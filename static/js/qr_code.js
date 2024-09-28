var qrCode = null;
var CORNER_VAL='square';
var DOTS_VAL='square';

function initializeQRCode() {
    var options = {
        width: $("#width").val(),
        height: $("#height").val(),
        type: "svg",
        data: $("#link").val(),
        image: $("#image_logo").val(),
        dotsOptions: {
            color: $("#fcolor").val(),
            type: $(".dot_ico.active").data('value')
        },
        cornersSquareOptions: {
            color: $("#corners-square-color").val(),
            type: $(".ico.active").data('value')
        },
        backgroundOptions: {
            color: $("#color").val(),
        },
        imageOptions: {
            crossOrigin: "anonymous",
            margin: 20
        }
    };

    if (qrCode) {
        qrCode.update(options);
    } else {
        qrCode = new QRCodeStyling(options);
        qrCode.append(document.getElementById("canvas"));
    }
}

function updateQRCode() {
    initializeQRCode();
}

function download(extension){
    qrCode.download({ name: "QRCODE", extension: extension });
}

$(document).ready(() => {
    initializeQRCode();

    $("#link, #height, #width, #color, #fcolor, #image_logo, #margin, #dots-type, #corners-square-color").on("input", initializeQRCode);
    $("#download_qr").on('click',()=>{
        download($("#extension").val());
    })

    $('.corner-image-selector img').click(function() {
        CORNER_VAL = $(this).attr('data-value');
        console.log('Clicked image data-value:', CORNER_VAL,this.id);
        $(".ico").css('border','1px solid black')
        $(`#${this.id}`).css('border','3px solid green');
        initializeQRCode();
    });

    $('.dots-type-selector img').click(function() {
        DOTS_VAL = $(this).attr('data-value'); 
        // Remove border from all images and hide all ticks
        $(".dot_ico").css('border', '1px solid black');
        $(".tick-icon").hide();
        // Set border for selected image and show its tick
        $(`#${this.id}`).css('border', '3px solid green');
        $(this).siblings('.tick-icon').show(); // Show tick icon for the clicked image
        
        initializeQRCode();
    });

});

// Add this function to your existing qr_code.js file
function saveQRCode() {
    const qrCodeDataUrl = document.querySelector('#canvas canvas').toDataURL('image/png');
    const settings = getQRCodeSettings();
    const url = $('#link').val();
    const qrId = new URLSearchParams(window.location.search).get('edit');

    fetch(qrId ? '/update_qr_code' : '/save_qr_code', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            qr_id: qrId,
            qr_code: qrCodeDataUrl,
            url: url,
            settings: settings
        }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(qrId ? 'QR code updated successfully!' : 'QR code saved successfully!');
            window.location.href = '/my_qr_codes';
        } else {
            alert('Failed to ' + (qrId ? 'update' : 'save') + ' QR code: ' + data.message);
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        alert('An error occurred while ' + (qrId ? 'updating' : 'saving') + ' the QR code.');
    });
}

function getQRCodeSettings() {
    return {
        url: $('#link').val(),
        height: parseInt($('#height').val()) || 100,
        width: parseInt($('#width').val()) || 100,
        margin: parseInt($('#margin').val()) || 0,
        image_logo: $('#image_logo').val(),
        dotsOptions: {
            type: $('.dot_ico.active').data('value') || 'square',
            color: $('#fcolor').val() || '#000000'
        },
        cornersSquareOptions: {
            type: $('.ico.active').data('value') || 'square',
            color: $('#corners-square-color').val() || '#000000'
        },
        backgroundColor: $('#color').val() || '#ffffff',
        backgroundOptions: {
            gradient: {
                type: $('#bg_gradient').val() || 'linear',
                colorStops: [
                    { color: $('#bg_color1').val() || '#ffffff' },
                    { color: $('#bg_color2').val() || '#000000' }
                ]
            }
        }
    };
}

// Add this event listener at the end of your $(document).ready function
$("#save_qr").on('click', saveQRCode);

function loadSavedSettings(settings) {
    if (!settings) return;

    // Basic settings
    $('#link').val(settings.url || '');
    $('#height').val(settings.height || 100);
    $('#width').val(settings.width || 100);
    $('#margin').val(settings.margin || 0);
    $('#image_logo').val(settings.image_logo || '');

    // Dot type
    if (settings.dotsOptions && settings.dotsOptions.type) {
        $('.dot_ico[data-value="' + settings.dotsOptions.type + '"]').click();
    }

    // Corner square type
    if (settings.cornersSquareOptions && settings.cornersSquareOptions.type) {
        $('.ico[data-value="' + settings.cornersSquareOptions.type + '"]').click();
    }

    // Colors
    if (settings.cornersSquareOptions) {
        $('#corners-square-color').val(settings.cornersSquareOptions.color || '#000000');
    }
    $('#color').val(settings.backgroundColor || '#ffffff');
    if (settings.dotsOptions) {
        $('#fcolor').val(settings.dotsOptions.color || '#000000');
    }

    // Background gradient
    if (settings.backgroundOptions && settings.backgroundOptions.gradient) {
        $('#bg_gradient').val(settings.backgroundOptions.gradient.type || 'linear');
        if (settings.backgroundOptions.gradient.colorStops && settings.backgroundOptions.gradient.colorStops.length >= 2) {
            $('#bg_color1').val(settings.backgroundOptions.gradient.colorStops[0].color || '#ffffff');
            $('#bg_color2').val(settings.backgroundOptions.gradient.colorStops[1].color || '#000000');
        }
    }

    // Update QR code preview
    updateQRCode();
}
