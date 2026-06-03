-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 03 jun 2026 om 18:45
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop hardware`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `categorie_id`) VALUES
(1, 'portables', 'https://img.magnific.com/free-vector/antigravity-technology-with-elements_23-2148096088.jpg?semt=ais_hybrid&w=740&q=80', 1),
(2, 'desktops', 'https://img.pikbest.com/ai/illus_our/20230427/a296496727bca0208fd73caa4080fad8.jpg!w700wp', 2),
(3, 'tablets', 'https://img.magnific.com/free-photo/close-up-technological-devices-wooden-desk_1232-474.jpg?semt=ais_hybrid&w=740&q=80', 3),
(4, 'Monitors', 'https://img.magnific.com/premium-vector/computer-display-monitor-realistic-3d-isolated_177006-195.jpg?semt=ais_hybrid&w=740&q=80', 4),
(5, 'keyboards en mice', 'https://www.shutterstock.com/image-photo/computer-keyboard-mouse-isolated-on-260nw-2178973631.jpg', 5),
(6, 'printers en scanners', 'https://www.printabout.be/image/product/1147000/89636/400x400/canon-pixma-tr4755i-inkjetprinter.jpg?1736412284', 6),
(7, 'microsoft OS', 'https://thumbs.dreamstime.com/b/windows-microsoft-os-icon-vector-image-can-also-be-used-social-media-logos-suitable-mobile-apps-web-apps-print-media-81669055.jpg', 7),
(8, 'switches en hubs', 'https://i.pinimg.com/736x/0b/80/6e/0b806efd7de4abadb47b91a937d98ae3.jpg', 8),
(9, 'wifi materiaal', 'https://img.magnific.com/free-photo/top-view-wi-fi-router-with-vacuum-cleaner_23-2148779236.jpg?semt=ais_hybrid&w=740&q=80', 9);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `producten`
--

CREATE TABLE `producten` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text NOT NULL,
  `categorie_ID` int(11) NOT NULL,
  `description` text NOT NULL,
  `featured` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `producten`
--

INSERT INTO `producten` (`id`, `name`, `price`, `image`, `categorie_ID`, `description`, `featured`) VALUES
(1, 'HP 524pu - Series 5 Pro - LED monitor - Full HD (1080p) - 24\"', 211.00, 'https://static.fnac-static.com/multimedia/Images/A8/3A/65/1A/27677608-1505-1540-1/tsp20251202133629/HP-524pu-Series-5-Pro-ecran-LED-24-23-8-visualisable-1920-x-1080-Full-HD-1080p-100-Hz-IPS-350-cd-m2-1500-1-5-ms-HDMI-DisplayPort-USB-C-noir-de-jais-argent-naturel-et-noir-jais-support.jpg', 4, '', 1),
(2, 'HP PB4G1iR16 5-120U 16 16GB/512 PC AZERTY', 1426.00, 'https://azerty.nl/media/catalog/product/K/v/KvSbRq.4e1223efe035d3a95b162964a4891434-43e9c6d5.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700', 1, 'HP PB4G1iR16 5-120U 16 16GB/512 PC AZERTY - Intel Core 5 - 120U / up to 5 GHz - Win 11 Pro - Intel Graphics - 16 GB RAM - 512 GB SSD NVMe - 16\" IPS 1920 x 1200 - Gigabit Ethernet - Wi-Fi 6E, Bluetooth - pike silver - kbd: Belgium - with HP Wolf Pro Security Edition (1 year)', 0),
(3, 'HP EB6G1i16 U5 225U 16 16GB/512 PC Netherlands - QWERTY', 1432.00, 'https://cdn.centralpoint.be/objects/medium_pic/6/6ac/3676559_laptops-hp-g1i-16-ai-c14znetuug.jpg', 1, 'HP EB6G1i16 U5 225U 16 16GB/512 PC Netherlands - AI PC - Intel Core Ultra 5 - 225U / up to 4.8 GHz - Win 11 Pro - Intel Graphics - 16 GB RAM - 512 GB SSD NVMe - 16\" IPS 1920 x 1200 - Gigabit Ethernet - Wi-Fi 6E, Bluetooth - pike silver aluminium - kbd: Intl English - with HP Wolf Pro Security Edition (1 year)', 1),
(4, 'Dell Pro 16 PC16250 - 16\" - Intel Core Ultra 5 - 235U - vPro Enterprise - 16 GB RAM - 512 GB SSD - n', 1467.00, 'https://gfx3.senetic.com/akeneo-catalog/4/8/e/b/48ebb848bb8bceed35be4c5dd4da3a187e67a23c_1767494__normalized_image3.jpg', 1, 'Dell Pro 16 PC16250 U5-235U16GB 512GB SSD 16\" FHD+ IR Cam & Mic FgrPr  3 Cell noAC noPCORD  WLAN vPro Backlit Kb W11 Pro 1Y Basic Onsite power supply not included Azerty BE keyboard', 0),
(5, 'Lenovo ThinkBook 14 G8 IAL - AI PC - 14\" - Intel Core Ultra 5 - 225U - 16 GB RAM - 512 GB SSD - Engl', 1467.00, 'https://media.s-bol.com/xEZ30nKzV0An/MjJ8r95/550x394.jpg', 1, 'Lenovo ThinkBook 14 G8 IAL - AI PC - 180-degree hinge design - Intel Core Ultra 5 - 225U / up to 4.8 GHz - Win 11 Pro - Intel Graphics - 16 GB RAM - 512 GB SSD NVMe - 14\" IPS 1920 x 1200 - Gigabit Ethernet - Wi-Fi 6E, Bluetooth - arctic grey - kbd: English - Europe - with 2 Years Lenovo Depot Support, CO2 Offset 0.5 ton (2nd Gen)', 0),
(6, 'Lenovo ThinkPad L16 Gen 2 - AI PC - 16\" - Intel Core Ultra 5 - 225U - 16 GB RAM - 512 GB SSD - Engli', 1393.00, 'https://p4-ofp.static.pub//fes/cms/2025/04/18/s93adpqkap679puc4pyhohevfw8ldq438529.png', 1, 'Lenovo ThinkPad L16 Gen 2 - AI PC - 180-degree hinge design - Intel Core Ultra 5 - 225U / up to 4.8 GHz - Win 11 Pro - Intel Graphics - 16 GB RAM - 512 GB SSD TCG Opal Encryption 2, NVMe - 16\" IPS 1920 x 1200 - Wi-Fi 6E, Bluetooth - black - kbd: English - Europe - with CO2 Offset 0.5 ton (2nd Gen)', 0),
(7, 'HP EB8G1i16 U5 225U 16 16GB/512 PC Netherlands - QWERTY', 1623.00, 'https://www.techoutlet.eu/media/catalog/product/cache/79d62b5a17d20b122cb8cbf050cc7241/A/2/A26TMEA_1.png', 1, 'HP EB8G1i16 U5 225U 16 16GB/512 PC Netherlands - AI PC - Intel Core Ultra 5 - 225U / up to 4.8 GHz - Win 11 Pro - Intel Arc Graphics - 16 GB RAM - 512 GB SSD NVMe - 16\" IPS 1920 x 1200 - Wi-Fi 6E, Bluetooth - glacier silver aluminium - kbd: Intl English - with HP Wolf Pro Security Edition (1 year)', 0),
(8, 'Lenovo ThinkBook 16 G8 IAL - 16\" - Intel Core Ultra 5 - 135H - 16 GB RAM - 512 GB SSD - Belgium', 1048.00, 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_159678356/fee_786_587_png', 1, 'Lenovo ThinkBook 16 G8 IAL - 180-degree hinge design - Intel Core Ultra 5 - 135H / up to 4.6 GHz - Win 11 Pro - Intel Arc Graphics - 16 GB RAM - 512 GB SSD NVMe - 16\" IPS 1920 x 1200 - Wi-Fi 6E, Bluetooth - arctic grey - kbd: Belgium - with 2 Years Lenovo Depot Support, CO2 Offset 0.5 ton (2nd Gen)', 0),
(9, 'Alienware Aurora ACT1250', 4460.00, 'https://i.dell.com/is/image/DellContent/alienware-act1250-desktop-c-0030rf-bk-65w-1?wid=570&hei=400&fmt=png-alpha', 2, 'High‑end gaming AI PC met Core Ultra 9 285K (32 GBRAM, 2 TB SSD, RTX 5080, Wi‑Fi 7)', 1),
(10, 'Apple Mac Studio M3 Ultra', 4852.00, 'https://www.lab9.be/cdn/shop/files/IMG-16740590.jpg?v=1741290534&width=823', 2, 'Professionele desktop met M3 Ultra (96 GB RAM, 1 TB SSD, macOS Sequoia)', 0),
(11, 'HP EliteDesk 8 G1a Next Gen AI PC', 1492.00, 'https://www.hp.com/gb-en/shop/Html/Merch/Images/9b2a4c5f-7bed-4bc0-81e8-d3606a8bb08f_1750x1285.jpg', 2, 'Ryzen AI 7 350 (32 GB RAM, 512 GB SSD, Wolf Pro Security) – Copilot+ AI PC', 1),
(12, 'Lenovo ThinkCentre neo 50a 27 Gen 6 LNL', 1086.00, 'https://psrefstuff.lenovo.com/syspool/Sys/Image/ThinkCentre/ThinkCentre_neo_50a_27_Gen_6_LNL/Compressedimage/ThinkCentre_neo_50a_27_Gen_6_LNL_CT1_01.png', 2, 'All‑in‑one AI PC met Core Ultra 5 226V (16 GB RAM, 512 GB SSD, 27″ Full HD)', 0),
(13, 'Dell Pro Max Micro FCM2250', 2534.00, 'https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/desktops/dell-pro-max/fcm2250/media-gallery/desktop-dell-pro-max-fcm2250-micro-bk-gallery-2.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=163&qlt=100,1&resMode=sharp2&size=163,402&chrss=full', 2, 'Micro AI PC met Core Ultra 7 265 (32 GB RAM, 1 TB SSD, RTX A1000, Wi‑Fi 7)', 1),
(14, 'Lenovo ThinkCentre M70s Gen 6', 1183.00, 'https://p2-ofp.static.pub//fes/cms/2025/05/09/lqxpsxcuupeh95tbzf6e5d5hi0whnh734316.png', 2, 'SFF AI PC met Core Ultra 7 265 vPro Enterprise (16 GB RAM, 512 GB SSD)', 1),
(15, 'HP EliteDesk 8 Mini G1i U5235T', 1253.00, 'https://www.elecomsystems.com/cdn/shop/files/p1_9e784a3a-731e-4f6e-95c8-9465aa3a322b_large.jpg?v=1706922577', 2, 'Compacte AI PC met Core Ultra 5 5235T (16 GB RAM, 512 GB SSD, Wolf Pro Security)', 0),
(16, 'Dell Pro Slim Plus QBS1250', 1416.00, 'https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/desktops/dell-pro/qbs1250/media-gallery/odd/desktop-dell-pro-qbs1250-slim-plus-odd-gallery-1.psd?fmt=png-alpha&pscan=auto&scl=1&hei=320&wid=254&qlt=100,1&resMode=sharp2&size=254,320&chrss=full', 2, 'Slim desktop met Core Ultra 7 265 (16 GB RAM, 512 GB SSD, 3 jaar Onsite)', 1),
(17, 'Lenovo ThinkCentre neo 50q Gen 6 Copilot', 723.00, 'https://p2-ofp.static.pub//fes/cms/2026/01/20/2ivgrlphqc0dpzju4wlyldx2nlhx15150721.png', 2, 'Tiny Copilot+ PC met Core Ultra 5 226V (16 GB RAM, 512 GB SSD, Arc Graphics 130V)', 0),
(18, 'Apple iPad Pro 11\" M5 Wi‑Fi 256GB	', 1119.00, 'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ipad-pro-finish-select-202405-11inch-spaceblack-glossy-wifi_FMT_WHH?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1758631556227', 3, 'High‑end OLED‑tablet met extreme prestaties, ideaal voor pro‑gebruik.', 1),
(19, 'Apple iPad Air 11\" M3 Wi‑Fi 128GB', 609.00, 'https://www.lab9.be/cdn/shop/files/IMG-16746039_ec6633d1-d18a-485f-ba7a-038ac97358d8.jpg?v=1741290634&width=823', 3, 'Snelle, lichte tablet met M3‑chip, perfect voor school & werk.', 0),
(20, 'Samsung Galaxy Tab S11 Wi‑Fi 128GB', 764.00, 'https://image.vandenborre.be/WEB/images/products/superzoom/samsung_tab-s11-128gb-gray_7658427_1.jpg', 3, 'Premium Android‑tablet met sterk display en krachtige chipset.', 0),
(21, 'Samsung Galaxy Tab S11 Ultra Wi‑Fi 256GB', 1146.00, 'https://bsimg.nl/images/samsung-galaxy-tab-s11-ultra-wifi-plus-5g-256gb-grijs_12.png/Uq512JV2Q0EIJu6WTvoZm_ovCck%3D/fit-in/0x0/filters%3Aupscale%28%29', 3, '14.6\" powerhouse met topcamera’s en enorm AMOLED‑scherm.', 1),
(22, 'Samsung Galaxy Tab S10 Lite 5G 128GB', 415.00, 'https://bsimg.nl/images/samsung-galaxy-tab-s10-lite-wifi-plus-5g-128gb-grijs_5.png/1Bn9wqMCdSQVPkPLj4SG-znBQt8%3D/fit-in/0x0/filters%3Aupscale%28%29', 3, 'Sterke middenklasser met 5G en groot 10.9\" scherm.', 0),
(23, 'Lenovo Idea Tab Pro ZAE4 12.7\"', 352.00, 'https://m.media-amazon.com/images/I/71k2uxrC2PL._AC_UF1000,1000_QL80_.jpg', 3, 'Groot 12.7\" LTPS‑scherm, ideaal voor multitasking en media.', 1),
(24, 'Samsung Galaxy Tab A11+ 128GB', 277.00, 'https://www.img-selexion.be/images/photolib/865x615/1105112/9d60d326176d20d8448ece248af271576e0b4f81.jpg', 3, 'Betaalbare 11\" tablet met goede prestaties voor dagelijks gebruik.', 0),
(25, 'Apple iPad A16 Wi‑Fi 128GB', 389.00, 'https://www.lab9.be/cdn/shop/files/IMG-16745959_da89d8e2-cde4-4ddf-b9cd-259cdda40859.jpg?v=1741290432&width=823', 3, 'Sterke basis‑iPad met A16‑chip, ideaal voor school & entertainment.', 1),
(26, 'Samsung Galaxy Tab S10 FE 5G 128GB', 587.00, 'https://bsimg.nl/images/samsung-galaxy-tab-s10-fe-wifi-plus-5g-128gb-x526-grijs_7.png/Sapws1pC4VP5HMEf4z3yfVhsiEg%3D/fit-in/0x0/filters%3Aupscale%28%29', 3, 'Goede middenklasse tablet met 5G en sterke batterij.', 1),
(27, 'Samsung Galaxy Tab A11 64GB 8.7\"', 165.00, 'https://bsimg.nl/images/samsung-galaxy-tab-a11-wifi-4gb-64gb-grijs_6.png/hDzPb_82K70XIxJHyFOSKGAGEi0%3D/fit-in/0x0/filters%3Aupscale%28%29', 3, 'Compacte budgettablet, ideaal voor onderweg en video\'s', 0),
(28, 'Philips 34B2U5600C – 34\" Curved WQHD – HDR', 551.00, 'https://images.philips.com/is/image/philipsconsumer/da4cec15dbba4a08834cb1710070e484?$pnglarge$&wid=1250', 4, '34\" curved VA‑paneel, 3440×1440, HDR, USB‑C en speakers. Perfect voor productiviteit en media.', 0),
(29, 'HP 727pq – Series 7 Pro – 27\" QHD – HDR', 309.00, 'https://gfx3.senetic.com/akeneo-catalog/5/5/6/c/556ca60cbb89d33b6c3cc638bc3984c90026338d_1749385__normalized_image3.jpg', 4, 'Professionele QHD‑monitor met IPS Black‑paneel, HDR400 en hoge contrastverhouding. Uitstekend voor kleurkritisch werk.', 1),
(30, 'Lenovo ThinkVision P34WD‑40 – 34\" Curved WQHD', 805.00, 'https://p3-ofp.static.pub/ShareResource/ww/visuals/ThinkVision-P34WD-40/Gallery/01.png', 4, 'Premium 34\" ultrawide IPS‑monitor met 120 Hz, HDR10 en USB‑C. Zeer geschikt voor multitasking en creatief werk.', 0),
(31, 'LG UltraFine 32UQ850V‑W – 32\" 4K HDR', 448.00, 'https://cdn.centralpoint.be/objects/multimedia/e/e0c/3592653_146069386_medium_monitoren-lg-monitor-32-32uq850v-waeu-5ms-4k-ips-2xhdmi-dp-32uq850v-w.jpg', 4, '32\" 4K IPS‑monitor met HDR400, hoge helderheid en USB‑C. Ideaal voor foto/video‑editing.', 0),
(32, 'AOC Q27G4ZR – 27\" QHD – 240 Hz', 247.00, 'https://www.alternate.be/p/600x600/4/7/AOC_Q27G4ZR_27__gaming_monitor@@1939874_30.jpg', 4, 'Ultra‑snelle 240 Hz gaming‑monitor met Fast IPS, HDR400 en 0.3 ms response. Top voor e‑sports.', 1),
(33, 'LG UltraGear 27GR83Q‑B – 27\" QHD – 240 Hz', 359.00, 'https://www.lg.com/content/dam/channel/wcms/nl/images/monitor/27gr83q-b_aeu_eebn_nl_c/gallery/medium01.jpg', 4, '240 Hz IPS gaming‑monitor met HDR400 en uitstekende kleurweergave.', 0),
(34, 'Philips 40B1U5600 – 40\" WQHD – USB‑C', 592.00, 'https://cdn.rc-static.com/images/ProductImages/ScaleProducts/4370E903_Icat_3.jpg', 4, 'Enorme 40\" IPS‑monitor met 3440×1440, HDR400 en USB‑C docking. Perfect als all‑in‑one werkstation.', 1),
(35, 'LG UltraGear 27G610A‑B – 27\" QHD – 200 Hz – HDR', 179.00, 'https://www.lg.com/content/dam/channel/wcms/nl/monitoren/alle-monitoren/ultragear/27g610a/gallery/basic/ultragear-gaming-27g610a-2025-gallery-basic-01.jpg', 4, 'Krachtige gaming‑monitor met 200 Hz, QHD‑resolutie, IPS‑paneel en HDR‑ondersteuning. Uitstekende keuze voor snelle games en scherpe beeldkwaliteit.\r\n\r\n', 0),
(36, 'HP 534pm – Series 5 Pro – 34\" Curved WQHD', 489.00, 'https://hp.widen.net/content/dtfwdhqnnd/webp/dtfwdhqnnd.png?w=573&h=430&dpi=72&color=ffffff00', 4, '34\" curved WQHD‑monitor met hoge helderheid, IPS‑paneel, USB‑C en premium bouwkwaliteit. Ideaal voor multitasking en professioneel werk.', 1),
(37, 'LG UltraGear 27GS85Q‑B – 27\" QHD – 180 Hz', 242.00, 'https://media.s-bol.com/RVDOLEl9jx9V/zpqMDXq/550x611.jpg', 4, 'Gaming‑monitor met Nano IPS, 180 Hz, 1 ms en DisplayHDR 400. Zeer sterke prijs‑prestatie voor QHD gaming.', 0),
(38, 'Logitech MX Master 4 – Pale Grey', 116.00, 'https://cdn.mos.cms.futurecdn.net/6FzZRPJjNCQVg9Jo3gAaLU.jpg', 5, 'Premium 8‑knops muis, Bluetooth + 2.4 GHz, hoge precisie', 1),
(39, 'Logitech MX Anywhere 3S – Graphite', 90.00, 'https://www.img-exellent.be/images/photolib/865x615/833866/itlomxany3sgr-muis.png', 5, 'Compacte stille muis, 6 knoppen, Bluetooth', 0),
(40, 'Logitech Lift Vertical Ergonomic Mouse – Graphite', 72.00, 'https://studentenlaptop.be/media/e5/fa/ef/1746606748/910-006473.jpg?ts=1746606748', 5, 'Verticale ergonomische muis, 6 knoppen, Bluetooth + 2.4 GHz', 1),
(41, 'HP 720 Multi‑Device Rechargeable KB/MSE (QWERTY)', 108.00, 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MP_175754890?x=536&y=402&format=jpg&quality=80&sp=yes&strip=yes&trim&ex=536&ey=402&align=center&resizesource&unsharp=1.5x1+0.7+0.02&cox=0&coy=0&cdx=536&cdy=402', 5, 'Multi‑device set, oplaadbaar, programmeerbare toetsen', 0),
(42, 'Logitech MK540 Advanced – QWERTY US', 60.00, 'https://image.vandenborre.be/WEB/images/products/superzoom/logitech_mk540-qwerty-us-int_7950276_1.jpg', 5, 'Betrouwbare wireless keyboard‑mouse set', 1),
(43, 'HP 785M – Bluetooth + 2.4 GHz Mouse', 48.00, 'https://www.hp.com/gb-en/shop/Html/Merch/Images/5ef5cc24-0a26-4f38-8632-04b9bbb1d0d6_1750x1285.jpg', 5, 'Ergonomische 6‑knops muis, dual‑mode', 1),
(44, 'Logitech M705 Wireless Mouse', 44.00, 'https://prod.isg.bruneau.media/asset/aHR0cHM6Ly9pbWFnZXMuaWNlY2F0LmJpei9pbWcvZ2FsbGVyeS81MWJmZmQ4NzZhM2Y5ZTg2NTM4ZjVhNzcwMGVlNTFhNDMwY2ExYzI4LmpwZw==/?format=jpeg&height=477&quality=85&width=477', 5, 'Ergonomische muis met lange batterijduur', 0),
(45, 'HP 435 Multi‑Device Mouse – Bluetooth 5.2', 24.00, 'https://m.media-amazon.com/images/I/71rvioG+TbL._AC_UF1000,1000_QL80_.jpg', 5, 'Ergonomische 5‑knops muis met multi‑device ondersteuning', 1),
(46, 'HP 235 Wireless Keyboard & Mouse Combo – QWERTY', 24.00, 'https://cdn.centralpoint.be/objects/high_pic/4/469/3384258_toetsenborden-hp-235-draadloze-muis-en-toetsenbordcombo-1y4d0aaabb.jpg', 5, 'Betaalbare full‑size wireless set', 1),
(47, 'Apple Pencil Pro', 149.00, 'https://static.fnac-static.com/multimedia/Images/FR/MDM/7a/45/97/9913722/1541-1/tsp20260520174803/Apple-Pencil-2eme-generation-pour-iPad-Pro-11-2eme-generation-et-iPad-Pro-12-9-4eme-generation.jpg', 5, 'Active stylus met gyroscoop, Bluetooth, compatibel met nieuwste iPad Air & Pro', 0),
(48, 'Xerox B410V_DN', 482.00, 'https://m.media-amazon.com/images/I/51sLzz4u6JL.jpg_BO30,255,255,255_UF750,750_SR1910,1000,0,C_QL100_.jpg', 6, 'B/W laserprinter · Duplex · 47 ppm · 650‑sheet tray · USB, Gigabit LAN', 0),
(49, 'Ricoh ScanSnap iX2500', 432.00, 'https://m.media-amazon.com/images/I/61+AnHyfMAL.jpg', 6, 'Documentscanner · Dual CIS · 45 ppm · Wi‑Fi 6 · USB 3.2 · Bluetooth', 0),
(50, 'Epson WorkForce ES‑580W', 411.00, 'https://www.123inkt.be/image/Epson_WorkForce_ES-580W_A4_documentscanner_met_wifi_B11B258401_831804_m1_big.jpg', 6, 'Documentscanner · Duplex · 35 ppm · 100‑sheet ADF · Wi‑Fi(ac)', 0),
(51, 'Xerox C230', 242.00, 'https://www.123inkt.be/image/Xerox_C230_A4_laserprinter_kleur_met_wifi_C230V_DNI_896140_m1_big.jpg', 6, 'Kleurenlaserprinter · 22 ppm · USB, LAN, Wi‑Fi · 600×600 dpi', 0),
(52, 'Brother HL‑L5210DW', 266.00, 'https://m.media-amazon.com/images/I/61Ohlo4cKhL.jpg', 6, 'B/W laserprinter · Duplex · 48 ppm · USB, LAN, Wi‑Fi, NFC', 0),
(53, 'Brother HL‑L5210DN', 250.00, 'https://www.printabout.be/image/product/1145726/43892/800x800/brother-hl-l5210dn-laserprinter.jpg?1697617835', 6, 'B/W laserprinter · Duplex · 48 ppm · USB, Gigabit LAN', 0),
(54, 'Xerox B310', 173.00, 'https://www.123inkt.be/image/Xerox_B310_A4_laserprinter_zwart-wit_met_wifi_B310V_DNI_896145_m1_big.jpg', 6, 'B/W laserprinter · Duplex · 40 ppm · USB, LAN, Wi‑Fi', 1),
(55, 'Brother HL‑L2445DW', 127.00, 'https://www.123inkt.be/image/Brother_HL-L2445DW_A4_laserprinter_zwart-wit_met_wifi_HLL2445DWRE1_833260_m4_big.jpg', 6, 'B/W laserprinter · Duplex · 32 ppm · USB, LAN, Wi‑Fi', 1),
(56, 'Brother HL‑L2400DWE', 104.00, 'https://static.fnac-static.com/multimedia/Images/FR/NR/5a/93/fc/16552794/1520-2/tsp20260421140732/Imprimante-multifonction-Brother-HL-L2400DWE-Noir.jpg', 6, 'B/W laserprinter · Duplex · 30 ppm · USB, Wi‑Fi', 0),
(57, 'Brother PT‑D610BTVP', 103.00, 'https://www.manutan.be/fstrz/r/s/www.manutan.be/img/S/GRP/ST/AIG68220905.jpg?frz-v=26', 6, 'Labelprinter · 180 dpi · 30 mm/s · USB & Bluetooth', 1),
(58, 'Windows 11 Home – licence – 1 licence', 117.00, 'https://www.grc.be/1711-medium_default/windows-11-home-box-pack-1-licence-usb-flash-drive.jpg', 7, '“Windows 11 Home - Licence - 1 licence - Download - 64-bit, National Retail - All Languages”', 0),
(59, 'Windows 11 Pro – licence – 1 licence (ESD)', 203.00, 'https://www.licencedeals.com/cdn/shop/files/Windows_11_Professional_digital_licence-100_700x700.jpg?v=1746784405', 7, '“Windows 11 Pro - Licence - 1 licence - ESD - National Retail, 64-bit - All Languages”', 1),
(60, 'Windows 11 Home N – licence – 1 licence', 117.00, 'https://m.media-amazon.com/images/I/61Tzv07EqHL._AC_UF350,350_QL80_.jpg', 7, '“Windows 11 Home N - Licence - 1 licence - 64-bit, National Retail - All Languages”', 0),
(61, 'Windows 11 Home – licence – 1 licence (Dutch OEM DVD)', 114.00, 'https://www.csbzeeland.nl/4654-medium_default/microsoft-windows-11-home-nl-dvd-oem.jpg', 7, '“Windows 11 Home - Licence - 1 licence - OEM - DVD - 64-bit - Dutch”', 1),
(62, 'Windows 11 Pro – licence – 1 licence (Dutch OEM DVD)', 146.00, 'https://www.serverdirect.nl/assets/product_images/FQC-10528.jpg', 7, '“Windows 11 Pro - Licence - 1 licence - OEM - DVD - 64-bit - Dutch”', 1),
(63, 'Windows 11 Pro – licence – 1 licence (English OEM DVD)', 146.00, 'https://nairobicomputershop.co.ke/media/products/2025/01/PRO_11.jpg', 7, '“Windows 11 Pro - Licence - 1 licence - OEM - DVD - 64-bit - English”', 0),
(64, 'Windows 11 Home – licence – 1 licence (French OEM DVD)', 114.00, 'https://licentiepromo.be/wp-content/uploads/2020/10/Windows-11-home-F.png', 7, '“Windows 11 Home - Licence - 1 licence - OEM - DVD - 64-bit - French”', 1),
(65, 'Windows 11 Pro – licence – 1 licence (French OEM DVD)', 146.00, 'https://i.ebayimg.com/00/s/MTIwMFgxNjAw/z/ueYAAOSw2KFjhM8~/$_57.PNG?set_id=880000500F', 7, '“Windows 11 Pro - Licence - 1 licence - OEM - DVD - 64-bit - French”', 0),
(66, 'Windows 11 Home – licence – 1 licence (English OEM DVD)', 114.00, 'https://m.media-amazon.com/images/I/61kP1jsxQGL._AC_UF350,350_QL80_.jpg', 7, '“Windows 11 Home - Licence - 1 licence - OEM - DVD - 64-bit - English”', 1),
(67, 'Windows 11 Pro – box pack – 1 licence (Dutch)', 209.00, 'https://www.grc.be/1713-medium_default/windows-11-home-box-pack-1-licence-usb-flash-drive.jpg', 7, '“Windows 11 Pro - Box pack - 1 licence - flash drive - 64-bit - Dutch”', 0),
(68, 'NETGEAR GS108 – switch – 8 ports', 25.00, 'https://cdn.centralpoint.be/objects/multimedia/7/717/359_101241136_medium_netwerk-switches-netgear-prosafe-unmanaged-switch-gs108ge-desktop-8-gigabit-ethernet-poorten-gs108ge.jpg', 8, '“NETGEAR GS108 - Switch - 8 x 10/100/1000 - desktop”', 0),
(69, 'NETGEAR GS305 – switch – 5 ports – unmanaged', 19.00, 'https://gfx3.senetic.com/akeneo-catalog/c/b/4/0/cb4098053ce7f97f884635bd43506792687bff09_1676393__normalized_image1.jpg', 8, '“NETGEAR GS305 - Switch - unmanaged - 5 x 10/100/1000 - desktop, wall-mountable”', 0),
(70, 'Cisco Catalyst 9200L – 48P – 4X – E', 3544.00, 'https://m.media-amazon.com/images/I/61vR8kflWwS._AC_UF1000,1000_QL80_.jpg', 8, '“Cisco Catalyst 9200L - Network Essentials - switch - L3 - Managed - 48 x 10/100/1000 (PoE+) + 4 x 10 Gigabit SFP+”', 0),
(71, 'Cisco Catalyst 9200L – 24P – 4G – E', 1379.00, 'https://cdn.centralpoint.be/objects/high_pic/4/4ef/2120805_netwerk-switches-cisco-9200l-c9200l-24p-4g-e.jpg', 8, '“Cisco Catalyst 9200L - Network Essentials - switch - L3 - 24 x 10/100/1000 (PoE+) + 4 x Gigabit SFP”', 0),
(72, 'Cisco C1300-24P-4G', 738.00, 'https://m.media-amazon.com/images/I/615da4+rXFL._AC_UF1000,1000_QL80_.jpg', 8, '“Switch - L3 - Managed - 24 x 10/100/1000 (PoE+) + 4x 1G SFP+”', 1),
(73, 'Cisco Catalyst 9200L – 24P – 4X – E', 2053.00, 'https://cdn.centralpoint.be/objects/high_pic/4/4ef/2120805_netwerk-switches-cisco-9200l-c9200l-24p-4g-e.jpg', 8, '“Cisco Catalyst 9200L - Network Essentials - switch - 24 x 10/100/1000 (PoE+) + 4 x 10 Gigabit SFP+”', 1),
(74, 'NETGEAR Plus GS105Ev2 – switch – 5 ports – Managed', 28.00, 'https://m.media-amazon.com/images/I/71pXGvXxtgL._AC_UF350,350_QL80_.jpg', 8, '“NETGEAR Plus GS105Ev2 - Switch - Managed - 5 x 10/100/1000 - desktop”', 0),
(75, 'NETGEAR AV Line M4250-10G2F-PoE+', 751.00, 'https://www.bekafun.com/s/image/16276881/2000/2000/10840_gsm4212p_100eus_glowne_l_-jpg', 8, '“NETGEAR AV Line M4250-10G2F-PoE+ - Switch - L3 - Managed - 10 x 10/100/1000 (8 PoE+) + 2 x Gigabit SFP”', 1),
(76, 'TP-Link TL-SG105 – 5-Port Metal Gigabit Switch', 16.00, 'https://static.fnac-static.com/multimedia/Images/FR/MDM/5f/3f/a2/10633055/1520-3/tsp20260503082549/Commutateur-reseau-TP-LINK-TL-SG105-5-ports-Noir.jpg', 8, '“TP-Link TL-SG105 5-Port Metal Gigabit Switch - Switch - unmanaged - 5 x 10/100/1000”', 0),
(77, 'NETGEAR GS105 – switch – 5 ports', 20.00, 'https://image.vandenborre.be/WEB/images/products/superzoom/netgear_gs105-5port-gigabitswitch_8687722_1.jpg', 8, '“NETGEAR GS105 - Switch - 5 x 10/100/1000 - desktop”', 1),
(78, 'HPE Aruba AP‑505 (RW)', 408.00, 'https://cdn.centralpoint.be/objects/medium_pic/e/e9e/3720320_wlan-access-points-hpe-aruba-networking-ap-505-rw-dual-radio-2x2-80211ax-internal-antennas-unified-campus-ap-r2h28a.jpg', 9, '“Campus – radio access point – Bluetooth, Wi‑Fi 6 – 2.4 GHz, 5 GHz – in‑ceiling”', 1),
(79, 'Cisco Catalyst 9115AXI', 616.00, 'https://m.media-amazon.com/images/I/71L9lVoXp2L._AC_UF1000,1000_QL80_.jpg', 9, '“Radio access point – Bluetooth, Wi‑Fi 6 – 2.4 GHz, 5 GHz”', 1),
(80, 'HPE Aruba Networking AP‑725 (RW)', 586.00, 'https://cdn.centralpoint.be/objects/high_pic/b/b65/3695779_wlan-access-points-hpe-aruba-networking-ap-725-rw-tri-radio-2x2-wi-fi-7-internal-antennas-campus-access-point-s4a22a.jpg', 9, '“Campus – radio access point – Wi‑Fi 7, Bluetooth 5.4 LE, ZigBee – 2.4/5/6 GHz”', 0),
(81, 'Cisco Catalyst 9120AXI', 1014.00, 'https://cdn.centralpoint.be/objects/medium_pic/8/89e/3568644_wlan-access-points-cisco-catalyst-9120ax-c9120axi-e-rf.jpg', 9, '“Radio access point – 802.15.4, Bluetooth, Wi‑Fi 6 – 2.4 GHz, 5 GHz”', 0),
(82, 'TP‑Link Omada EAP670 V2', 156.00, 'https://static.fnac-static.com/multimedia/Images/BB/4B/76/1B/28796091-3-1541-1/tsp20251202200004/TP-Link-Omada-EAP670-V2-2-Borne-d-acces-sans-fil-Wi-Fi-6-2-4-GHz-5-GHz-gere-par-le-Cloud-montable-au-plafond-mur.jpg', 9, '“Radio access point – Wi‑Fi 6 – cloud‑managed – wall/ceiling mountable”', 1),
(83, 'HPE Instant On AP22 (RW)', 114.00, 'https://gfx3.senetic.com/akeneo-catalog/3/2/8/e/328ece9a76a95eac6b6a741b32d6d05175bc59d4_1624451__normalized_image2.jpg', 9, '“Radio access point – Bluetooth, Wi‑Fi 6 – wall/ceiling mountable”', 0),
(84, 'HPE Aruba AP‑615 (RW)', 488.00, 'https://gfx3.senetic.com/akeneo-catalog/c/f/c/f/cfcfc9a9a5198c8f8f7cf1d7ff34437f6a18335c_1709896__normalized_image1.jpg', 9, '“Campus – radio access point – Wi‑Fi 6E – 2.4/5/6 GHz”', 1),
(85, 'Cisco Catalyst 9164I', 1173.00, 'https://static01.galaxus.com/productimages/8/9/7/9/3/5/6/8/8/4/0/9/0/1/9/1/3/6/2/27b8890a-6f1a-4623-9820-807b7e8cfc60_cropped.jpg_sea.jpeg', 9, '“Radio access point – Wi‑Fi 6E – cloud‑managed – 1GbE/2.5GbE”', 0),
(86, 'HPE Aruba AP‑515 (RW)', 642.00, 'https://gfx3.senetic.com/akeneo-catalog/4/a/a/d/4aad636c5e52f48c93810fa08d8d726e5af33e6a_1031276__normalized_image1.jpg', 9, '“Radio access point – Bluetooth, Wi‑Fi 6 – in‑ceiling”', 0),
(87, 'Cisco Catalyst 9115AXE', 664.00, 'https://m.media-amazon.com/images/I/41kUmELDPNL.jpg_BO30,255,255,255_UF750,750_SR1910,1000,0,C_QL100_.jpg', 9, '“Radio access point – Bluetooth, Wi‑Fi 6 – 2.4 GHz, 5 GHz”', 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `producten`
--
ALTER TABLE `producten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
