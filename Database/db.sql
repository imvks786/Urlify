-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2024 at 07:14 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `url_shortener`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `temp_user` varchar(200) NOT NULL,
  `long_url` varchar(2000) NOT NULL,
  `short_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_code` (`short_code`),
  UNIQUE KEY `temp_user` (`temp_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

DROP TABLE IF EXISTS `qr_codes`;
CREATE TABLE IF NOT EXISTS `qr_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` varchar(200) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image_data` longblob NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `settings` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `created_by`, `url`, `image_data`, `created_at`, `settings`) VALUES
(1, 'admin', 'https://google.com', 0x89504e470d0a1a0a0000000d494844520000006400000064080600000070e295540000062749444154789ced9dcb6f15551cc73fbf3333bd6defbda05090502b8d0f08203e423404134c301817108dd168f04f60e3c66874e5d6c41d890b173e626461a28198b8415d904aa41123122336d1a282349477ef6defbd33e7b86849c894328c3373ef99783ebbf6ce79cd37bff33b8fdf392380a18b1893ae3811c9943e6b7ef1e78b4675b53447224e10cb708258861fff47d63e3a4e521f9cf47bbc3e597d40d6f615fd7e9c85588613c4329c2096b1c887c4493b0ecfbb8f4d226f1f91b5fc2492eae72cc4329c2096e104b18c441fd26db2ce3b92f2b31d672196e104b10c278865f4dc8724f5f1697d8aedf3a6249c85588613c4329c209691e8438aee63d3ee8724a5efb64fc8bb3c672196e104b10c2788652cf221dd8e438a93f7bc236dfa5ec769390bb10c27886538412cc3eff55a4ed6b5a8a2f3eff6fb711662194e10cb70825846ea7948b7cf77e4bd5f9244d6794b561fe52cc4329c2096e104b10c3fefb5a23869f32bbacf2f9aac6b61ce422cc30962194e10cb1093f3624dde3e65666666e9bc047c0da203940124a2a3345a812cd1aa5aad76cbf2d292d5e7c529b5858881880e8a082422d02d90704931ca40cf2317d360645e044f2b94bec6f4e75fa0cefd8e6f3c003c13d146a1363cc8e0337b30f8cc9bced216631ba51264fea56a2e1ef98abeb16f699ffc112e5f412df402ca4088429f18a779e2186ae71eea8f6fc3a7b7dbd269c83c0f893f5fc4fe8111d08028c3dcf877b40f7c40e7f424a8807ead0995a2a50c9e8aa8b485f6d4399a9d0e95ed3b5062c018aef7ce45efa927e597947f692c448ca1716c9ccbfbdfa536750644602e64c51b6f323bbc81403415d3e18e5f8e3371f020feb3afb0e2916d28532e37590a41b484444193a0358177fe145a06b92815d6bcf63ad193bbf02a035401319ad6e803dcf5d84ec2a121fcdab25e573d35a510c4d30a6ffa67daedb7a8ef9e211a1b61ed0bfba83cb50b1d0cdce0b0159d6a1d19ac112cfca72ccefc3aa9637bd3ae0d65ed531b8d06da7898d63282b089ac9f231ca9113cb4112fa8029ad06ff0d1218f937ffdc3cdaa37b2f2327b778fb2ba7ff9a2df8a5e6b8b93f43e4a612188c60ba6f182261aa86fda86b76694b6d11881c1d921a6ae297ebd347bd3e47f9f9b66ef8e2af477b7daff8572080208f3730da321943e42cf233e9a35ba1f8c60540b110f8d0f081ddf10ca1cc654bb5ff1949444104d280685a2238689a9a3acaa4f30b4722b00cd8169066932ec5d22c2807498f5eb5c8986d151c4dae5157cdf47c4eb713b92497dd749da717c1e7db488a1d3e731d3bf8ec3332d3e3e5f67efaab33c7fe72606d4007e58e5d597aac02a8cc04c3be0d3a3119f8d355122bcb8f36186ea86f9d9ccad49aa6f569fb8b86da5bc2fcba752dbc6a9b5efb0ffc2462e747cde1b3fc0e1c9ef694a0b231ad0181371356af0e54f7f7268ec1a22822fb3acae86109463b8558a2e4b0c10f90c78230cfbf770da4c1106f0f60fefd31c8a586f86d1618447c8d1d93ff8f0c429aac1cb78e17236af9e62d98087a7ebbd6ec66d21c4ae89cd1af69275e9219ebed168dcf097e6c899e3ec3ffe0993ed292adad0f634a1379fc68f04230610fcab5bd91c3dc7be9df7b36554a1164600d56a3ac75ef496739cdc637b8bddc3563c31fc2873cd59beb930cec9a9dfb8d8b90a80118d118daf3d56f7ad60e37d7dec5e37c796118588995f10bb8dfaa58d038b93b5fd891b54dd0e22b8b5852c3c239a96841c3cf93593adb344448808c64478a6c286eadd3c7def760683c5d690b441d5eb033da51424febc8f41449883c4a57627484a6c3b86dd6d41721f65157dae3cef4146b76387dd9d8b25c30962194e10cb5834318c93d527e4bd679f95a2637db3fa1c672196e104b10c278865e41edb5b34ddf60149e45d1f672196e104b10c2788652c8aed2d9a5ef7d179dfb795b5fc38ce422cc30962194e10cbe8f9770cd33e9ff7da5a12457fafa4a47159ff1f9c2096e104b18cd4817249e4bd079d44afef19ce1b672196e104b10c2788659422fafd46f2f64979c789c5493b6f721662194e10cb70825846cf7d886db1be59ef76493a939884b310cb7082588613c4327afe1dc338799f7b4f4bd673ea59f3771662194e10cb70825846cfbf6358f4fe48de77d9a7256dfb9c85588613c4329c2096f12f2e5d02c2884aadc30000000049454e44ae426082, '2024-09-05 06:33:13', NULL),
(2, 'admin', 'https://google.com', 0x89504e470d0a1a0a0000000d494844520000006400000064080600000070e295540000062749444154789ced9dcb6f15551cc73fbf3333bd6defbda05090502b8d0f08203e423404134c301817108dd168f04f60e3c66874e5d6c41d890b173e626461a28198b8415d904aa41123122336d1a282349477ef6defbd33e7b86849c894328c3373ef99783ebbf6ce79cd37bff33b8fdf392380a18b1893ae3811c9943e6b7ef1e78b4675b53447224e10cb708258861fff47d63e3a4e521f9cf47bbc3e597d40d6f615fd7e9c85588613c4329c2096b1c887c4493b0ecfbb8f4d226f1f91b5fc2492eae72cc4329c2096e104b18c441fd26db2ce3b92f2b31d672196e104b10c278865f4dc8724f5f1697d8aedf3a6249c85588613c4329c209691e8438aee63d3ee8724a5efb64fc8bb3c672196e104b10c2788652cf221dd8e438a93f7bc236dfa5ec769390bb10c27886538412cc3eff55a4ed6b5a8a2f3eff6fb711662194e10cb70825846ea7948b7cf77e4bd5f9244d6794b561fe52cc4329c2096e104b10c3fefb5a23869f32bbacf2f9aac6b61ce422cc30962194e10cb1093f3624dde3e65666666e9bc047c0da203940124a2a3345a812cd1aa5aad76cbf2d292d5e7c529b5858881880e8a082422d02d90704931ca40cf2317d360645e044f2b94bec6f4e75fa0cefd8e6f3c003c13d146a1363cc8e0337b30f8cc9bced216631ba51264fea56a2e1ef98abeb16f699ffc112e5f412df402ca4088429f18a779e2186ae71eea8f6fc3a7b7dbd269c83c0f893f5fc4fe8111d08028c3dcf877b40f7c40e7f424a8807ead0995a2a50c9e8aa8b485f6d4399a9d0e95ed3b5062c018aef7ce45efa927e597947f692c448ca1716c9ccbfbdfa536750644602e64c51b6f323bbc81403415d3e18e5f8e3371f020feb3afb0e2916d28532e37590a41b484444193a0358177fe145a06b92815d6bcf63ad193bbf02a035401319ad6e803dcf5d84ec2a121fcdab25e573d35a510c4d30a6ffa67daedb7a8ef9e211a1b61ed0bfba83cb50b1d0cdce0b0159d6a1d19ac112cfca72ccefc3aa9637bd3ae0d65ed531b8d06da7898d63282b089ac9f231ca9113cb4112fa8029ad06ff0d1218f937ffdc3cdaa37b2f2327b778fb2ba7ff9a2df8a5e6b8b93f43e4a612188c60ba6f182261aa86fda86b76694b6d11881c1d921a6ae297ebd347bd3e47f9f9b66ef8e2af477b7daff8572080208f3730da321943e42cf233e9a35ba1f8c60540b110f8d0f081ddf10ca1cc654bb5ff1949444104d280685a2238689a9a3acaa4f30b4722b00cd8169066932ec5d22c2807498f5eb5c8986d151c4dae5157cdf47c4eb713b92497dd749da717c1e7db488a1d3e731d3bf8ec3332d3e3e5f67efaab33c7fe72606d4007e58e5d597aac02a8cc04c3be0d3a3119f8d355122bcb8f36186ea86f9d9ccad49aa6f569fb8b86da5bc2fcba752dbc6a9b5efb0ffc2462e747cde1b3fc0e1c9ef694a0b231ad0181371356af0e54f7f7268ec1a22822fb3acae86109463b8558a2e4b0c10f90c78230cfbf770da4c1106f0f60fefd31c8a586f86d1618447c8d1d93ff8f0c429aac1cb78e17236af9e62d98087a7ebbd6ec66d21c4ae89cd1af69275e9219ebed168dcf097e6c899e3ec3ffe0993ed292adad0f634a1379fc68f04230610fcab5bd91c3dc7be9df7b36554a1164600d56a3ac75ef496739cdc637b8bddc3563c31fc2873cd59beb930cec9a9dfb8d8b90a80118d118daf3d56f7ad60e37d7dec5e37c796118588995f10bb8dfaa58d038b93b5fd891b54dd0e22b8b5852c3c239a96841c3cf93593adb344448808c64478a6c286eadd3c7def760683c5d690b441d5eb033da51424febc8f41449883c4a57627484a6c3b86dd6d41721f65157dae3cef4146b76387dd9d8b25c30962194e10cb5834318c93d527e4bd679f95a2637db3fa1c672196e104b10c278865e41edb5b34ddf60149e45d1f672196e104b10c2788652c8aed2d9a5ef7d179dfb795b5fc38ce422cc30962194e10cbe8f9770cd33e9ff7da5a12457fafa4a47159ff1f9c2096e104b18cd4817249e4bd079d44afef19ce1b672196e104b10c2788659422fafd46f2f64979c789c5493b6f721662194e10cb70825846cf7d886db1be59ef76493a939884b310cb7082588613c4327afe1dc338799f7b4f4bd673ea59f3771662194e10cb70825846cfbf6358f4fe48de77d9a7256dfb9c85588613c4329c2096f12f2e5d02c2884aadc30000000049454e44ae426082, '2024-09-05 06:33:13', NULL),
(3, 'admin', 'https://google.com', 0x89504e470d0a1a0a0000000d494844520000006400000064080600000070e295540000154349444154789cd55d7b7056c5153f79a081844040f2302186249aeffb9260514bc62915355362ab52272f86a16884c844184b2b5425409e1471ecd8d229d8222d846aa5df97a0339d8ec5325567aa940ed4a9421c1413302022c45250c04272fac799751f77efdd7bbf57e26fe64eee66cf9ebbdfeebde7dcf3d8bd098888a0c3cb2f031c3c08f0f6db00fbf6019c38a125fb0ab9b900151500336600949501dc779f33bd5b747703ac5943e7ebd601d4d68e0e7eb11a1f543130805855850810d9515545bc224520c079060223cf2fc6e3234f485757e417528faeae70878e505aca79f9fd91f18a945f1cc6874fc89e3dd1bf183bf6ec097f004321c4ec6c449f8fce23c5f3cf539f4a4abcf18bd3f8d0840c0eea09172e440c06dd899e8101a25db850cf6b7050df2e14a23bd5efa773b56ca237c12bbd0e711c1f9a9086062b4130185ee711a9adcaafa1414f2b8a90d2526b5985571d100d9117c7f101ece9b156eedf1ffec518f6efb7f2ede9b1d289035c56662d3bd1eb264c454a8a377a15711e1fc0d5abe57f2e5912f9c518962c9179af5e6da50985108b8b11afbf9e7e7c28c4ef66dd049aea55b4b478a35711e7f14986b7df96df8367cd92cb6d6df4ee0ec0dfd99dca6d6d32af2d5b7859bd16c39831f4777818e0d22500bf9f97550c0cc8f5dddd002d2d54eee8b0da15e5e5cefc4c88f7f8604e8e3c4bfdfdf22cde7ebbb38c17cbb7df2eb7edef9779e7e458ef92b2325e3f61824caf1331b1d6392ae23c3e8970f2a43ce30505deef223ba8bcd46b01c8776d5e1e4020c0cb0909567a44b95e2c9b9098e89e9621cee3936c6c347b36c0e9d374ae8a03b53c7bb6f74eb5b703d4d59158e9e8a009aaaba389696fb7d2b7b501d4d7137d7b3bc05fff0ad0dbcbcb2a4a4b9deb234594c7c73c21b1c6b973b28cafad95ef7a5547d4d5c9f5d5d500cf3e6bcf3f188c7e9f6309cbab978a486424a2f5d54ec49123de7446345c275e11e7f10943a846114545b2ced0e1fc797e9e3cf20f74ac31f23ae4dbdf26199f9bab97f1ebd703fce007001919006bd77ae71f6b44797c46f6090100f8f5afe9613d7e1ca0a6c65abf6001d57ff619e98fee6e7aaa0201fe7e2f42ad3795471b4654878403bf3f323bc5ab5d12771d929b2bcfd0f1e3d19b6d95977aad70e0c596506d1444d9b6d1d9392ae23c3ec9505101b06b17ffe7debd241a182291917bf7cae58a0aef9d5691950570e810404989ec8660686c04d8b409202989eadf7a0be0cb2fa9fcf8e300efbcc3cbbaf62ae23d3ed8d9293f360b177a172376507dff9d9d569a60908245e1c643baba228f773821cee303f8d24b56391989af9f41e7f37fe92599a6bdddea1ef7aa2344fa68c4dc55c4797c484be982f691f8fc75befeaa2a3dada864f3f2106fb8c17e420e1c9079e6e62216163a4f603410c7f1a1091918b0120090bf7ec70eab875387fe7ea2557dfcecb00b73d6d5712b7cdb36c4cc4c5e56e317274e208e1bc7eb7fff7bc4152b289e126ebcc30de2383efc3d2e161915ec70ca3c09069d75c0638f4516638f568c3e4ee303d24563915961977172e60c626bab4c2b8a9c9e1ec4ea6afb7a06935d11697d9cc7072c171d1cd407f5bd1e0d0df69926229c94f2c993f406c6ea7531f6ec6cfb09fbe20be709eded354f789cc7c73a210c3d3d144ffedef7ac5133dd919343b4ab57bb97e57d7dbcbd4e07f4f5212e5feeac23584c3e56f57688d1f8d83b17ababe98825a64da3ee8a50e31f656500dbb691c56c17131763f22a6a6b65034de56f6a6f87588d8ffb5b224ef01a3337d59be8a39d3b1c21465780e1830fc82dc2209eab387306e0dd779d69183efc10a0af8f0e95fe7fffe3e76e7c5bb1c648df115fe1c30f111f7d94dfad3e1fe2ba7588b7ddc6efde68e800953e5c1d1223585da776f183d2528050c8fb8c6fdd0a30618239fe909e0e70cf3d004b97528c3d21811c886fbc415374e8905e66d7d6d293d5db4bf56ee21daace10cb5ee32da67aaff118cb147995e176387edceaaff19a8b1b8e2bc4a413228d97c498bf5587886f3d972e91fc0d07575d45725e84938c3e7b96aef5f1c7fc7f5e621f67ced021e6510d0f53f9d83180a347e970d2516ab9b71760cf1eeadbc99374f4f6caf5dddd00fffd2fd5f5f73bf33f7f1ee08b2f9c7f9f658a984c0540dcbe9d6716fa7cde64ecb97388afbe4a39bb3a3be3e245c463c7c861f8eaab887ff803e22f7f895851616f97a8f8cf7f108f1e45fcf7bf11fff63772414c9bc6efc05b6f45fcf18f11efbd97faafda06a2631280ec849933a9cfd1b26b3ceaac646d6e2c7b6f3f7c98e2dcec4d646888fe7efe39dd750303001b37d2396b0f00d0dc0c303808b07c39c02f7e4191b163c700babae4b8794e0ec0adb7d2758687a9fd3ffe61bd6bec307122ddc162fffbfa649aee6e80bffc859e4ea603553b84951f7c502e47c3ee61ff13fbe3d4de22e38e1c416c6b93655fb8871bbb21523b2052991e6d1d12617f93259d919040b952adad7400f0544c86a54be9ce2e28a05cdc3beee075656534eb8cde6b6e6e38b9b722f43259be9e7857eaca5efa1393fe9a64e2ae5d1438129d62afbc427603a2ac7374c7dd77933df1c73f22eede4df10b56979eceed0c00c4c993298ad8d545b4870f237efaa9f31d176d991e2bdf97cbf6d1370c597cc1e7436c6c449c3f9f063b2585dce9afbc8278f020e2f9f332bd1a53072025af7a44597d49094de0ca95881b37d28fdbb78f26f1934fccfd03409c3307f19e7bf80df1c823884f3c41e7e3c7236ed982f8e28bded640ba1d1f1b7e0988aa772f42040200efbde74c5359490be88b8b019a9adcf39d3103e08517f8ff8a8a008e1cf1d6bfb23277ee16b7a8a901484d958fb434ebffd871f3cdbc6d490965bf30111f08c4c07522c62f74c7e1c332bd180fd11d6fbc21877f45a50840c6e7be7d6488ba81694da3d7b25718f8c5466431db23230371fd7a59c7fcea5788172e70fa6010b1a888d7d7d5214e9a44e7f7de8bf8e73f23beffbecc9ff19b3f9f1206ce9ef5d63fd67ede3cc41ffe90cea74e8d8e8e717b7d1b7ee02ae65c5e4e33b979330da0cf47e5f5eb292a17094221e2e7f79311f7e8a364dcf9fd742d16732f29415cb60c71e952c42953e815f5a187286f8add002d2d88cf3dc79fba871ea2178aa222734c1d0071d122f3d316ed75f40a12b0b414bf92a9a5a5b4a18a0851278c1b0770e102af1b370e60d52abe994b3888b64c37e1fefb010a0b2938366d1ac0dcb9e41a01d0ff7e156a7fbffb5d80ec6c3a7272e4bfd9d9a44fbcc0281345c32935d5ea6e3875caf35d20c1a4439c0e550667673b87534debdeb3b29cdfd0547a13bf30748cd90ed9b4895f60c306d201ac1c8d154dc1a03cc9cb96215e771d9d575420feee775c242d5840e99759599cbea686d33ffbac2c932b2b494788f4afbf2e5f5fa47fe001abce52c1d6c90390c8d6d547a063cc3a440593e981000d801b7a9f8f8ececee8e81cbf9f8ccae79e9365f6ca955c07f97c9420f1dbdf46b6374ab4f75631d45b7d592698726f9de801e88e3d71c2dcce0e4ebe2837c79b6f92a7d90d7ff5c8caf2de3f8ff5565f96094949fc5c8d77e8a0f2dcb00160ec58770a4e07d1f7a4be0c949793479a195ab9b900575f2d7b80d3d3015252ecf98be3a1fae6264d32f7cf349ec67aaf326ff3663ec3d5d566fa609092a299d23d7ddadcc6c48fd9114545a4d3443ba7b292fbde82412ed303017a0d3e77ce997f7737e7158edd21da61bff98dbede811fb91b9dfcf33d3df43ac862c00f3fcc1fe29e1eb95eb75ebcae8ee2218814557bed35009f8fe89f798662142cc6dcd141b116272424507f7d3e80279f0458b68c62eaac4f4d4d00e3c7535cfeadb7002e5e247a44803973a8ce0935359c577535fd1d3306e0934f28da678a89d7d602bcff3eb55bb2447f0da718be51e6893a40f71a67aa576192f94f3f8df8f9e7f6ed559dd4dc8c78e890be7ee64c2b7d5313adf9303d2976d7138fc993ddf170fafd4b97d29bec6baf219e3eed428798f48a58cf228a4e509fc2ebaee3114700bac35353eddb8bfd050058b1c25eb69f3c29f32a2b73def5c184bc3cbabbfbfba93c658a771eaa8e7afd7580cd9b79d995ff9f2da2f9e94ff5f54c66de7597f90e1175406e2ee9a4d4542a1717bb6b5f5e4ef477dfadaf67beb1fbefa7d80aebdfd4a9881f7c60be86fafbd8f8fce847f496989f4ffce6cef5fec668f065256b63c02a929248c69594e8eb939349662f5a443a81451b3b3ae88e6869a1bf0f3f0c70edb5441f08f045977979f4a42d5e6ce52dc6fc9b9be9ade9ca15ba9e6e11695d9dbc281380dc2522bfb973e97adfff3ebd896ddac4fbab1b0b26f3bff52daadfb8513f0e8c7f6b2b4982ce4ecef7f2655e4e4ea6f1d0e5851967549479e5e5d67a51c696975b758a930c66aba1c4727bbbfdf5994125ae4b5cb5cadb5d2af2bbe516b35da5bafbdf7cd33d7f37c777be437af0e597114f9d7291db2bca3c557e03c876c9952bb21e419475cc840900d75cc373bd2e5c209be4e2455e5eb448e67fe50a3fffe823d239972ef1ffad59434e4eb71075d8fefd14e462181c34b73f7b96fa6b674b39d931baf28913b4c5142b1bef28317ed0d666ad0f0611d3d2f87b7b3048711026e3c5f6b366916f4a7ca2c4a562ba3b3418e4323b3393d621b220587dbdb1fb5a7e4cc7dc761bf163fd5bb1c2eada8976eeb0311ee2e6024ebe19e6dbf2f9dc2d1766bead9212c49fffdc4cef743d5d7bb1bea303f1b3cfacbf2710e0c9dc5ee1c557d5d282b873a7275f98371d128df519aa4e51bdaf26a8325d5dc3a8ca7075c1a95affe493de420826f7baf8fb6eb9c5f3f898138b4c768a58afdb535185c8232505e09bdf34b7b1bb1e00c0cc99cef5e21b1680d50e6a6800c8cc0ceffa4cf789107fdfa54be6f1b3f237c06d9e92ee6e74e2078078e79d667a15c1200f42dd78a39e3f8b7fe8744c2844f60800e21d77780fb085425c07fde427669de3510759e321b1f0ff07023c46ae82c9fcd252c4ad5be5f8c9a64de6eb7b85b82efe673fb3ae9317cbcc39a9d6b31c8070f66631c0eacb8a64cd9ece4e11eb274c90334e106599cb264e94f17d7de63e78413472969d0ed50fe7d1d797689171de651e3f176d065d7d4686f5fd5dbc466fafbc7e62ea544a148826541d3379b25c16f7d265891022f2f3e5b2b8676471b1b31fce55ff22cd3bf2920bfbe28bf6f5ec89dcb9935be2d3a79bafef15e2f5eaeb65df5a73337d5f8495d7ac417cea29ee3bbbfe7a995e1c2f56d65d2f3b9bfc763a9da3c0acd4471bc43c2d55c66fd820e7e2b2bc2e26f3d7afa70d6b9c7484579874b0c7f2d76f429c7c63858572fdd8b1dee47f385934a24ebae926b9fc8d6fc8e59b6f96cb3366587c6b23bf2b6924484d9565b8b8c72f00e92b755f603176929121d78b7e39b710ed9a7ffd0be0d4295ebe7245d6595f7e29972f5f96cb64b77ccd20da21353564fb309dc37c53ec2b0bebd6c9beb6b973a93c793295abaa68dd0af38de9b62074d31f6697ac5c492251a7635cfab2ecbdbda3e53b86a110c5431212001e7984bcc5132792e778de3ca22928a0faa6268a2de4e450dc85c56f58bce5aebbacf192ee6e5ac9e4f7ebe33da6ef9300d08a63313e33660c953ffa88471901f8def64e6b102d333edabe6328ca58357e929626afbad51d2cab911d1f7f6ccf1f80e22b62bcddb4f7bc583f7dba5cbef146b39da640d6213b76d0bbffeeddae6e5e47ecde4dbc76ec888c8f6a37e4e5c965d1f6494991ed8ac242395672c30df4f4881075c0a449b4b5b9989922d6eb748c58ffce3bb43299616848eeffbbefcaf9033a7c3535a3f93b866c39c133cf5099e980e6662ab378494101ad776731fa3973643b61ed5a2bffe79fe76f63d9d9f6bea9fc7cb31db56387bd9de2da978538b2df315421fa925e78c1bb9d20b6dfbcd95a2ff27bea299a4066d784e33b8bb21d43133292df3154a1c6e845191c4ede970a319e515868a5f79a4512e9f74d141d9408bb76016cdf2ecbb1fdfbad991b5e5057473c446cdf2e6fd96d07514e0f0db9cbf512a1ea1c278c1d6b8d8f785d7b2e5e2f1c3b466c3f3c0c23ff1d4315624cbebedeec2bd2b5bfe61aa26f6ab2d66fdfcefbd3d646760ce31f8e1d120af13591769b459bda4b76c868f88ea1085d5e9553de986e0fc52953c85eb9f34eaa5fbb96a6a0b393deba68f93159fa575fcded069f4fe6c73e30c3f2ccd4726323797fb3b2e858bc58df1fb18c68cd5b93f2b246fa3b86914297b7e5f4c6377ebc7d9da9bd980fe6e6608137bbb2c66e19f9ef18460a51067ffaa91c5f292de55f8003203b64ea545e9e38919e0a86a4246b7bd1d7959e6ef58d89795d2a7d62a255c7587486501e1a1a05dfa08a14eded004f3c41ee8b75eb28916df1629a88071fa4c4ba55ab68c787c646ba499a9ba93c6b1689c7a6264a58c8cfa736ab56911899378f824e2d2d447fd34df43dacc71e2383f4f1c7a94d67271985353554deb081da2f5e4c3700e3d7de4e93c0fa1308d0f585fad1b52ba91ba832beaece7a63a8d98f6abda8a34221fe24cf9faff735cd9f2f97172c90fb73f932dd0065657cfd0a007915bcee9f65917b2a46f337a8d2d2225f442af28bd48ed01d7fffbbfbf67effd7301e22caf882026f79bd26983cda3a883a40d52199999431efb67d52928bcfe6cd9e4d172a2de58f9f5d391e3aa4bd9de43a807919851b74747087e3f2e5dedbb7b5f1fe8c1fcffbe7f7f3d75b2788f4ededa3e03b86e21a43b7df1554ed06d65eb7afb0799f5c7adb0a0400a64fe7fd292d257ab17f3afe75757c8de3debdb25d919969ed9fae3fa34a87788c1738faba4c7961a678866a87a8760300e23fffe9dc3f913e1070d6311a3b65e4bf6328ca50f1dc0ea20e51e975ed4dfcc5ff2526cafc8f1f977d5dd75e6bce4516f9a931f5b2326b0cdf62a7a85fb151bdbcadadfc49686d359745a85e5fddba76afbe2a917ee74e7779512c9ea2abdfb68ddfadededc493f996b66ea5f6e9e9e1e5a9b1987e7131f150e3236c6b10c19795083366c833fca73fc9e5b6368aad1f3c48e7a6b2132ff55a0c4c27b8d97b9dedf58ec863eaacbd9d67f8aaabe8af6e1d7e5a1ab7d60301e2c9f692676b1e594cde4dff587f002846cfec92dc5cca4811f7aa6f6c94e987876164bf638868d5015e758a489f9e8ef8de7bf6f5a6eda7dce8182ff46abcc505ff44b8ef3e80aa2a7986ebeb010e1cd0cfbe1b1c38403c445455e933515419ef55a78834f9f9b26fca2d0f06dd1326b63f7a548ee1ebe21f22fdb871561de1444f3a0547f63b86d1c82d66ebd0c3d9673718a4f5224eb9c9f9f972ff3232dce53287b10f30f9b2f2f2685ff6071e90676fcb16399e112ebabaacd9220c265f8f1bb075f24343665f971aaf4848203d22ea089607c6e21fa9a9f22ed8d9d9d65db14598f2b09ce8a5d98ae7770ca305af3a48d529261d11890e71e31b73f4655556d25aed86067777a6131a1a88576565e4bcdc42135f7084aa5fd478baae2cb609673f2c13bdedccc5e33b86d10093c125253cbd5f2c7ba5f75a36f1f7d8ffff03d3f43a5c0c6658510000000049454e44ae426082, '2024-09-05 07:06:50', '{\"url\": \"https://google.com\", \"width\": 100, \"height\": 100, \"margin\": 0, \"image_logo\": \"\", \"dotsOptions\": {\"color\": \"#ff0000\"}, \"backgroundColor\": \"#ffffff\", \"backgroundOptions\": {\"gradient\": {\"type\": \"linear\", \"colorStops\": [{\"color\": \"#ffffff\"}, {\"color\": \"#000000\"}]}}, \"cornersSquareOptions\": {\"color\": \"#ff0000\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
CREATE TABLE IF NOT EXISTS `urls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `long_url` text NOT NULL,
  `short_code` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_short_code` (`short_code`),
  KEY `short_code` (`short_code`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `urls`
--

INSERT INTO `urls` (`id`, `username`, `long_url`, `short_code`, `created_at`) VALUES
(44, 'admin', 'https://www.google.com/', 'MzZeST', '2024-09-03 11:41:37'),
(53, 'admin', 'https://imvks786.github.io', '3mTcBt', '2024-09-28 04:54:35'),
(55, 'admin', 'https://facebook.com', 'pBhzl6', '2024-09-28 04:54:35'),
(56, 'admin', 'https://yahoo.in', 'WfMIWf', '2024-09-28 04:54:35'),
(57, 'admin', 'https://google.com', 'i65ygY', '2024-09-28 04:54:35'),
(58, 'admin', 'https://youtube.com', 'qaSAYB', '2024-09-28 04:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `dt`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '2024-07-25 09:37:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE IF NOT EXISTS `user_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `short_code` varchar(200) NOT NULL,
  `datetime_utc` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `user_time` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `user_agent` text,
  `platform` varchar(100) DEFAULT NULL,
  `referring_url` text,
  `host_name` varchar(100) DEFAULT NULL,
  `screen_size` varchar(20) DEFAULT NULL,
  `orientation` varchar(50) DEFAULT NULL,
  `color_scheme` varchar(20) DEFAULT NULL,
  `hdr` varchar(3) DEFAULT NULL,
  `touch_screen` varchar(3) DEFAULT NULL,
  `gpu` text,
  PRIMARY KEY (`id`),
  KEY `short_code` (`short_code`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `short_code`, `datetime_utc`, `ip_address`, `timezone`, `user_time`, `language`, `browser`, `user_agent`, `platform`, `referring_url`, `host_name`, `screen_size`, `orientation`, `color_scheme`, `hdr`, `touch_screen`, `gpu`) VALUES
(19, 'ZngUsX', '2024-09-03 11:35:30', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:35:29.493Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(20, 'ZngUsX', '2024-09-03 11:41:43', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:41:42.914Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(21, 'ZngUsX', '2024-09-03 11:42:23', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:42:22.542Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(22, 'MzZeST', '2024-09-03 11:42:28', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:42:27.546Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(23, 'uKzBA6', '2024-09-03 11:50:58', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:50:58.238Z', 'en-GB', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(24, 'ZngUsX', '2024-09-03 11:51:01', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:51:00.910Z', 'en-GB', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(25, 'MzZeST', '2024-09-03 11:51:05', '127.0.0.1', 'Asia/Calcutta', '2024-09-03T11:51:04.945Z', 'en-GB', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(26, 'ZngUsX', '2024-09-04 12:11:02', '127.0.0.1', 'Asia/Calcutta', '2024-09-04T12:11:01.958Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(27, 'MzZeST', '2024-09-05 04:32:49', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T04:32:48.642Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(28, 'uKzBA6', '2024-09-05 04:32:51', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T04:32:51.198Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(29, 'ZngUsX', '2024-09-25 04:32:54', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T04:32:54.173Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(30, 'MzZeST', '2024-09-22 05:38:19', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T05:38:19.418Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', '', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(31, 'MzZeST', '2024-09-22 05:39:14', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T05:39:14.115Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', '', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(32, 'MzZeST', '2024-09-23 05:41:51', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T05:41:51.352Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', '', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(33, 'MzZeST', '2024-09-26 05:42:55', '127.0.0.1', 'Asia/Calcutta', '2024-09-05T05:42:55.244Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', '', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(34, 'ax6Hdc', '2024-09-25 12:12:46', '127.0.0.1', 'Asia/Calcutta', '2024-09-20T12:12:45.508Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(35, 'ax6Hdc', '2024-09-28 04:49:55', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:49:54.803Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(36, 'G3KleT', '2024-09-28 04:50:22', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:50:22.171Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(37, 'ZngUsX', '2024-09-28 04:50:44', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:50:43.484Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(38, 'xB9CqV', '2024-09-28 04:50:53', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:50:52.578Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(39, 'G3KleT', '2024-09-28 04:52:10', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:52:10.440Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(40, '3mTcBt', '2024-09-28 04:54:47', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T04:54:46.626Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', '', 'localhost:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(41, 'pBhzl6', '2024-09-28 06:43:43', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:43:43.115Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(42, 'pBhzl6', '2024-09-28 06:43:48', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:43:47.985Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(43, 'pBhzl6', '2024-09-28 06:43:51', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:43:51.390Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(44, 'qaSAYB', '2024-09-28 06:44:07', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:06.492Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(45, 'qaSAYB', '2024-09-28 06:44:07', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:07.316Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(46, 'qaSAYB', '2024-09-28 06:44:08', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:07.940Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(47, 'qaSAYB', '2024-09-28 06:44:09', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:08.626Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(48, 'qaSAYB', '2024-09-28 06:44:09', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:09.284Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(49, 'qaSAYB', '2024-09-28 06:44:10', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:09.858Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(50, 'qaSAYB', '2024-09-28 06:44:11', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:10.494Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(51, 'qaSAYB', '2024-09-28 06:44:12', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:11.749Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(52, 'i65ygY', '2024-09-28 06:44:38', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:38.465Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(53, 'i65ygY', '2024-09-28 06:44:39', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:39.431Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(54, 'i65ygY', '2024-09-28 06:44:41', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:40.582Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(55, 'WfMIWf', '2024-09-28 06:44:50', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:50.432Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(56, 'WfMIWf', '2024-09-28 06:44:51', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:51.181Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(57, 'WfMIWf', '2024-09-28 06:44:53', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:52.792Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)'),
(58, 'WfMIWf', '2024-09-28 06:44:54', '127.0.0.1', 'Asia/Calcutta', '2024-09-28T06:44:53.599Z', 'en-US', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Win32', 'http://127.0.0.1:5000/add_url', '127.0.0.1:5000', '1536x864', 'landscape-primary', 'Dark', 'No', 'No', 'ANGLE (Intel, Intel(R) UHD Graphics (0x00009A78) Direct3D11 vs_5_0 ps_5_0, D3D11)');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `FK_shortcode` FOREIGN KEY (`short_code`) REFERENCES `urls` (`short_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
