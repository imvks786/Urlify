$(document).ready(function() {
    $('#upload-btn').on('click', function() {
        var fileInput = $('#excel-file')[0];
        var formData = new FormData();
        formData.append('file', fileInput.files[0]);

        $.ajax({
            url: '/upload_excel',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if (response.success) {
                    $('#preview-table tbody').empty();
                    let sno = 1; // Initialize serial number
                    response.links.forEach(function(link) {
                        $('#preview-table tbody').append(`
                            <tr>
                                <td>${sno}</td> <!-- Serial Number -->
                                <td>${link}</td> <!-- Original Link -->
                                <td class="shortened-url"></td> <!-- Shortened URL (to be filled later) -->
                                <td class="status"></td> <!-- Status (to be filled later) -->
                            </tr>`);
                        sno++;
                    });
                    $('#preview-container').show();
                } else {
                    alert(response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    });

    $('#process-links').on('click', function() {
        // Collect all links from the preview table
        var links = [];
        $('#preview-table tbody tr').each(function() {
            var link = $(this).find('td:nth-child(2)').text(); // Get the original link from the second column
            
            // Check if the link starts with 'http://' or 'https://'
            if (!/^https?:\/\//i.test(link)) {
                link = 'https://' + link; // Add 'https://' if missing
            }
            links.push(link);
        });

        // Send the links to the server for processing
        $.ajax({
            url: '/process_links',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ links: links }),
            success: function(response) {
                if (response.success) {
                    // Update the preview table with shortened URLs and status
                    $('#preview-table tbody tr').each(function(index) {
                        $(this).find('.shortened-url').text(response.shortened_urls[index]); // Fill in the shortened URL
                        $(this).find('.status').html(`<i class="fa fa-check-circle"></i> Done`); // Update status
                    });
                    alert('Links processed successfully!');
                } else {
                    alert('Error processing links: ' + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    });
});