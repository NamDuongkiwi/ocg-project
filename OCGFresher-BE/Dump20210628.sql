-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: online_shop
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_self` (`parent_id`),
  CONSTRAINT `pk_self` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Linh kiện PC',NULL),(2,'Mainboard',1),(3,'CPU',1),(4,'SSD',1),(5,'RAM',1),(6,'VGA',1),(7,'Vỏ case',1),(8,'Nguồn',1),(9,'Gaming Gear',NULL),(10,'Bàn phím',9),(11,'Chuột',9),(12,'Media',NULL),(13,'Phụ kiện',NULL),(14,'Tản nhiệt',13),(15,'Lót chuột',13),(16,'Màn hình',12),(17,'Bàn gaming',9),(18,'Loa',12);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `product_id` int NOT NULL,
  `type` int NOT NULL,
  `data` varchar(180) NOT NULL,
  PRIMARY KEY (`product_id`,`data`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,0,'https://hanoicomputercdn.com/media/product/52345_rog_strix_z490_e_gaming_01_01.jpg'),(2,0,'https://hanoicomputercdn.com/media/product/52345_rog_strix_z490_e_gaming_01_04.jpg'),(2,0,'https://hanoicomputercdn.com/media/product/52345_rog_strix_z490_e_gaming_01_06.jpg'),(2,0,'https://hanoicomputercdn.com/media/product/52345_rog_strix_z490_e_gaming_01_07.jpg'),(3,0,'https://hanoicomputercdn.com/media/product/58353_mainboard_msi_b560m_pro_e_1.jpg'),(3,0,'https://hanoicomputercdn.com/media/product/58353_mainboard_msi_b560m_pro_e_2.jpg'),(3,0,'https://hanoicomputercdn.com/media/product/58353_mainboard_msi_b560m_pro_e_5.jpg'),(4,0,'https://hanoicomputercdn.com/media/product/52306_gigabyte_z490_ud.jpg'),(4,0,'https://hanoicomputercdn.com/media/product/52306_mainboard_gigabyte_z490_ud_intel_z490_socket_1200_atx_4_khe_ram_ddr4_11.jpg'),(5,0,'https://hanoicomputercdn.com/media/product/52364_intel_core_i5_10400_100.jpg'),(5,0,'https://hanoicomputercdn.com/media/product/52364_intel_core_i5_10400_12.jpg'),(5,0,'https://hanoicomputercdn.com/media/product/52364_intel_core_i5_10400_13.jpg'),(6,0,'https://hanoicomputercdn.com/media/product/49437_intel_core_i9_10940x.jpg'),(6,0,'https://tandoanh.vn/wp-content/uploads/2019/11/Intel-Core-I9-10940X-14C28T-19.25M-Cache-3.3GHz-Up-To-4.60-GHz-Socket-2066.jpg'),(7,0,'https://hanoicomputercdn.com/media/product/44015_hnc_intel_i7_9700k_right_facing_850x850.jpg'),(7,0,'https://hanoicomputercdn.com/media/product/44015_intel_core_i7_9700k.jpg'),(8,0,'https://images-na.ssl-images-amazon.com/images/I/71NxQR9o2mL._SS400_.jpg'),(8,0,'https://product.hstatic.net/1000026716/product/11400_500_600_4859b8f0229b4c09b381a0a0a4da30fe.jpg'),(9,0,'https://hanoicomputercdn.com/media/product/29034_phan_lung_mouse_logitech_g402_usb_black.jpg'),(9,0,'https://hanoicomputercdn.com/media/product/29034_tong_the_mouse_logitech_g402_usb_black.jpg'),(10,0,'https://product.hstatic.net/1000026716/product/gearvn-chuot-razer-basilisk-ultimate-ban-khong-dock-sac-35_8e6bcc3ad6dd45bb9b3af39e2d164359.jpg'),(10,0,'https://tanthanhdanh.vn/wp-content/uploads/2020/08/Razer-Basilisk-Ultimate-HyperSpeed-Wireless-Gaming-Mouse-With-Charging-Dock-1.jpg'),(11,0,'https://hanoicomputercdn.com/media/product/48545_chuot_logitech_g903_hero_wireless_gaming_4.jpg'),(11,0,'https://hanoicomputercdn.com/media/product/48724_tong_the_chuot_logitech_g903_hero_wireless_gaming.jpg'),(12,0,'https://bizweb.dktcdn.net/100/372/934/products/laptopnew-mouse-gaming-asus-rog-gladius-origin-2-pink-thumnail-min-2b79e2b2-37d0-4861-8968-e83348f4c56e.jpg?v=1623518321893'),(12,0,'https://hanoicomputercdn.com/media/product/54460_rog_gladius_ii_origin_pnk_ltd_3d_5.png'),(12,0,'https://product.hstatic.net/1000026716/product/gearvn-mouse.jpg'),(13,0,'https://hanoicomputercdn.com/media/product/47354_keyboard_realforce_r2_apc_mechanical_topre_55gram_switch_tkl_white_r2tla_us5_iv_0002_1.jpg'),(13,0,'https://hanoicomputercdn.com/media/product/49692_ban_phim_co_realforce_r2_apc_mechanical_topre_55gram_switch_fullsize_black_r2a_us5_bk_0001_2.jpg'),(14,0,'https://hanoicomputercdn.com/media/product/57157_filco_majestouch_minila_air_r_convertible_matte_black_5.jpg'),(14,0,'https://hanoicomputercdn.com/media/product/57159_filco_majestouch_minila_air_r_convertible_matte_black_bluetooth_blue_switch_ffbtr63mc_emb_0004_5.jpg'),(14,0,'https://itgc.com.vn/image/cache/catalog/media/product/57157_filco_majestouch_minila_air_r_convertible_matte_black_bluetooth_brown_switch_ffbtr63m_emb_0004_5-800x800.jpg'),(15,0,'https://hanoicomputercdn.com/media/product/57805_ban_phim_co_leopold_fc750r_sp_silent_red_switch_white_skyblue_0000_1.jpg'),(15,0,'https://hanoicomputercdn.com/media/product/57805_ban_phim_co_leopold_fc750r_sp_silent_red_switch_white_skyblue_0002_3.jpg'),(17,0,'https://cf.shopee.vn/file/183436f4e68ee33c2ac2a73e2e6a3085'),(17,0,'https://hanoicomputercdn.com/media/product/57514_xg27q_g__4_.jpg'),(17,0,'https://product.hstatic.net/1000026716/product/xg279q-g_gundam_edition_8807f319c8ae4a71869d1fa45974982e.jpg'),(18,0,'https://dlcdnwebimgs.asus.com/gain/f0752c79-06cf-459c-af9c-ca36c0ebd392/w800'),(18,0,'https://xgear.vn/wp-content/uploads/2021/05/PA278CV-11_compressed.jpg'),(19,0,'https://cf.shopee.vn/file/2861521594c57b54623b3ffd745b7390'),(19,0,'https://minhancomputer.com/media/product/432_m__n_h__nh_dell_ultrasharp_u2719d_4.jpg'),(19,0,'https://phucanhcdn.com/media/product/34663_ma__n_hi__nh_dell_u2719d_27inch_2k_qhd_ultrasharp_ips_3.jpg'),(20,0,'https://2techshop.com/wp-content/uploads/2021/04/LCD-SAMSUNG-LC27RG50FQEXXV-1.png'),(20,0,'https://cellphones.com.vn/media/catalog/product/m/a/man-hinh-cong-samsung-27-inch-lc27rg50fqexxv.jpg'),(21,0,'https://hanoicomputercdn.com/media/product/51421_jabra_speak_810__3_.jpg'),(21,0,'https://phucanhcdn.com/media/product/29629_jabra_speak_810_1.jpg'),(22,0,'https://hanoicomputercdn.com/media/product/47900_loa_bluetooth_edifier_s360db_2_1__6_.jpg'),(22,0,'https://salt.tikicdn.com/ts/product/4b/59/67/b2e232be50fb249fc5e396b53ff09d40.jpg'),(22,0,'https://salt.tikicdn.com/ts/product/ee/ef/4d/447de7d3f78e4b4695e7587a215dc317.jpg'),(23,0,'https://hanoicomputercdn.com/media/product/8782_10343_hanoicomputer_93922_1.jpg'),(23,0,'https://phucanhcdn.com/media/product/6934_loa_logitech_5_1_z906_1_1.jpg'),(24,0,'https://hanoicomputercdn.com/media/product/42018_loa_creative_sound_blasterx_katana___7_1_01.jpg'),(24,0,'https://hanoicomputercdn.com/media/product/42018_loa_creative_sound_blasterx_katana__2_.jpg'),(24,0,'https://vinatechnhatrang.com/FileStorage/ProductPictures/Thumbnail/katana2.png'),(25,0,'https://hanoicomputercdn.com/media/product/52775_coolermaster_hyper_212_spectrum__1_.jpg'),(25,0,'https://hanoicomputercdn.com/media/product/52775_coolermaster_hyper_212_spectrum__3_.jpg'),(26,0,'https://anphat.com.vn/media/product/29962_cpu_gigabyte_aorus_atc800_rgb_2.png'),(26,0,'https://baoanpc.com/wp-content/uploads/2020/06/48679_tan_nhiet_cpu_gigabyte_aorus_atc800_rgb_0001_1__9_.jpg'),(26,0,'https://xgear.vn/wp-content/uploads/2019/07/ATC800_2_compressed1-1.jpg'),(27,0,'https://hanoicomputercdn.com/media/product/47761_tan_nhiet_nuoc_id_cooling_dashflow_240rgb_0000_1__7_.jpg'),(27,0,'https://hanoicomputercdn.com/media/product/47761_tan_nhiet_nuoc_id_cooling_dashflow_240rgb_0004_1__3_.jpg'),(27,0,'https://hanoicomputercdn.com/media/product/47761_tan_nhiet_nuoc_id_cooling_dashflow_240rgb_0005_1__2_.jpg'),(28,0,'https://hanoicomputercdn.com/media/product/56625_nzxt_kraken_x63_rgb_0000_1__5_.jpg'),(28,0,'https://hanoicomputercdn.com/media/product/56625_nzxt_kraken_x63_rgb_0003_1__2_.jpg'),(29,0,'https://hanoicomputercdn.com/media/product/56483_ban_di_chuot_corsair_mm350_x_large_450_x_400_x_5mm_ch_9413561_ww_xam_0002_3.jpg'),(29,0,'https://hanoicomputercdn.com/media/product/56485_ban_di_chuot_corsair_mm350_x_large_450_x_400_x_5mm_ch_9413560_ww_den_0000_1.jpg'),(29,0,'https://hanoicomputercdn.com/media/product/59684_ban_di_chuot_gaming_luminous_led_rgb_01_300_x_700_x_4mm_0001_2.jpg'),(29,0,'https://itgc.com.vn/image/cache/catalog/media/product/35361_mousepad_razer_firefly_cloth_edition_0002_3-600x600.jpg'),(29,0,'https://phucanhcdn.com/media/product/42836_moa_cor_ch_9413561_ww_a.jpg'),(30,0,'https://hanoicomputercdn.com/media/product/59684_ban_di_chuot_gaming_luminous_led_rgb_01_300_x_700_x_4mm_0001_2.jpg'),(30,0,'https://itgc.com.vn/image/cache/catalog/media/product/35361_mousepad_razer_firefly_cloth_edition_0002_3-600x600.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `promo_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `promo_id` (`promo_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `price` int NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,2,'Mainboard ASUS ROG STRIX Z490-E GAMING',7199000,'Chuẩn mainboard: ATX\nSocket: 1200, Chipset: Z490\nHỗ trợ RAM: 4 khe DDR4, tối đa 128GB\nLưu trữ: 2 x M.2 NVMe, 6 x SATA 3 6Gb/s\nCổng xuất hình: 1 x HDMI, 1 x DisplayPort','2021-06-24 00:38:52'),(3,2,'Mainboard MSI B560M PRO-E',2399000,'Thông số sản phẩm\nChipset: Intel B560\nSocket: Intel LGA 1200\nKích thước: M-ATX\nSố khe RAM: 2','2021-06-24 00:43:38'),(4,2,'Mainboard GIGABYTE Z490 UD',4099000,'Thông số sản phẩm\nChuẩn mainboard: ATX\nSocket: 1200, Chipset: Z490\nHỗ trợ RAM: 4 khe DDR4, tối đa 128GB\nLưu trữ: 2 x M.2 NVMe, 6 x SATA 3 6Gb/s\nCổng xuất hình: 1 x HDMI','2021-06-24 00:45:06'),(5,3,'CPU Intel Core i5-10400',5099000,'Thông số sản phẩm\nDòng Core i thế hệ thứ 10 dành cho máy bàn của Intel\n6 nhân & 12 luồng\nXung nhịp: 2.9GHz (Cơ bản) / 4.3GHz (Boost)\nSocket: LGA1200\nĐã kèm sẵn tản nhiệt từ hãng\nTích hợp sẵn iGPU','2021-06-27 22:40:54'),(6,3,'CPU Intel Core i9-10940X ',23999000,'Thông số sản phẩm\nCPU Core i thế hệ thứ 10 của Intel\n14 nhân & 28 luồng\nXung cơ bản: 3.3 GHz\nXung tối đa (boost): 4.6 GHz\nChạy tốt trên các mainboard socket 2066\nPhù hợp cho những nhà sáng tạo nội dung\n23.999.000₫','2021-06-28 00:32:30'),(7,3,'CPU Intel Core i7-9700K ',8599000,'Thông số sản phẩm\nBộ vi xử lý Intel Core i7 9700K, 8 nhân 8 luồng, 12MB cache\nLà sản phẩm dựa trên kiến trúc Coffee Lake Refresh thế hệ mới nhất\nBộ vi xử lý này có tần số cơ bản là 3.6 GHz turbo lên tới 4.9 GHz. Mức TDP 95W\nHỗ trợ RAM DDR4 2666 / Dual Channel','2021-06-28 00:33:09'),(8,3,'CPU Intel Core i5-11400',5899000,'Socket: FCLGA1200\nSố lõi/luồng: 6/12\nTần số cơ bản/turbo: 2,90/4,30 GHz\nBộ nhớ đệm: 12 MB\nĐồ họa tích hợp: Intel® UHD 630\nBus ram hỗ trợ: DDR4-2666\nMức tiêu thụ điện: 65W','2021-06-28 00:34:57'),(9,11,'Chuột Logitech G402 Hyperion Fury USB Black',689000,'Chuột Game FPS nhanh nhất thế giới !\nChuột Logitech G402 sử dụng cảm biến quang học công nghệ Logitech Delta Zero™ tích hợp Fusion Engine™ cho tốc độ lên đến 500IPS.\nTích hợp 8 nút có thể lập trình được, gán các tác vụ khác nhau được trên chuột.\nCho phép chuyển đổi DPI từ 250 DPI đến 4000 DPI ngay tức thì bằng phím bấm trên chuột.\nSử dụng bộ xử lý 32 BIT ARM để đảm bảo mọi tác vụ được xử lý nhanh chóng , tốc độ, chính xác,... một cách thông minh.\nTốc độ phản hồi 1 millisecond của cổng cắm USB đảm bảo chuột di chuyển nhanh chóng, nhanh, tức thì và không bao giờ bị lag\nClick chuột nhanh hơn với Hyperion Fury, đáp ứng tốt và tập chung cao độ với tốc độ tối đa để đem lại hiệu quả tối đa trong game bắn súng.\nĐộ bền của nút chuột trái / phải lên đến 20 triệu lần click.','2021-06-28 00:53:53'),(10,11,'Chuột Razer Basilisk Ultimate with Dock',3689000,'Kết nối cả không dây và có dây\nĐầu USB Wireless 2.4GHz\nSử dụng pin sạc kèm Dock sạc\nCông nghệ Razer HyperSpeed\nMắt đọc Razer Forcus+ Optical 20.000 DPI\n11 nút bấm có thể lập trình\n14 vùng LED RGB Chroma có thể tinh chỉnh\n2 nút chính tuổi thọ 70 triệu lượt nhấn','2021-06-28 00:55:02'),(11,11,'Chuột Logitech G903 Hero Wireless Gaming',3099000,'Chuột chơi game G903 HERO Wireless Gaming\nKết nối không dây Lightspeed\nCảm biến HERO 16K DPI tối đa lên đến 16.000\nThiết kế đối xứng, nút bấm có thể lập trình lên đến 11 nút','2021-06-28 00:55:34'),(12,11,'Chuột Asus ROG Gladius II Pink',2289000,'Chuột Asus ROG Gladius II Pink\nPhiên bản màu hồng cực cá tính\nCảm biến quang học PixArt PMW3360 cho độ chính xác cao\n12000 DPI, gia tốc 50G và 250 IPS\nSwitch Omron với độ bền 50 triệu lần nhấn, đồng thời có thể thay nóng với thiết kế độc quyền của Asus\nChuột chơi game quang có dây USB được thiết kế để vừa vặn với mọi tay cầm với bánh xe cuộn có thể nhấp, công tắc DPI và micro-USB tháo nhanh\nHệ thống chiếu sáng RGB ASUS Aura Sync có phổ màu sắc gần như vô tận với khả năng đồng bộ hóa các hiệu ứng trong một hệ sinh thái ngày càng mở rộng của các sản phẩm hỗ trợ Aura Sync\nPhần mềm Armory II để dễ dàng tùy chỉnh các nút, cài đặt hiệu suất và ánh sáng','2021-06-28 00:56:48'),(13,10,'Bàn phím cơ Realforce R2 APC',6259000,'Bàn phím RealForce R2 APC\nThương hiệu bàn phím cơ cao cấp nhất đến từ Nhật bản\nThiết kế layout TKL 87 phím gọn gàng\nSwitch Topre cao cấp, mang lại cảm giác gõ mượt mà, êm ái\nTiếng ồn được giảm thiểu tối đa\nCho phép tuỳ chỉnh độ nhạy của phím\nCụm phím số tích hợp trên phím\nLực nhấn phân bổ đồng đều trên bàn phím\n','2021-06-28 00:59:14'),(14,10,'Bàn phím cơ Không dây Filco Majestouch Minila Air-R Convertible Matte Black',3959000,'Bàn phím cơ Không dây Filco Majestouch Minila Air-R\nPhiên bản mới nâng cấp từ Minila Air\nKết nối Bluetooth 5.1\nHỗ trợ 4 Profile Bluetooth và một kết nối dây USB\nLayout 2 trong 1 hỗ trợ cả Windows và MAC\nKeycap PBT Double độc đáo, bề mặt chữ có thể tháo rời\nSwitch Cherry MX nổi tiếng đến từ Đức\nThời lượng pin cao lên đến 8-12 tháng\nBảo hành 5 năm','2021-06-28 01:04:39'),(15,10,'Bàn phím cơ Leopold FC750R SP Silent Red switch',3719000,'Bàn phím cơ Leopold FC750R SP SkyBlue\nBàn phím cơ đến từ thương hiệu nổi tiếng Hàn Quốc\nPhiên bản đặc biệt với thiết kế màu keycap đặc trưng và độc đáo\nTích hợp núm Stick Point cho phép sử dung chuột bằng bàn phím\nKeycap chất liệu PBT Dye-sub siêu bền\nSử dụng 100% Switch Cherry chất lượng cao nhất được chọn lọc kĩ càng\nKhông có hệ thống đèn Led, nhưng tối ưu tốt cảm giác gõ\nDây cáp Mini-USB có thể tháo rời thuận tiện\nPhù hợp với người dùng thích sự đơn giản, cần cảm giác gõ tốt nhất','2021-06-28 01:05:20'),(17,16,'Màn hình Asus ROG Strix XG279Q-G Gundam Limited edition',19989000,'Kích thước: 27 inch\nTấm nền: IPS\nĐộ phân giải: 2560x1440\nĐộ sáng (Typ.):400cd/㎡\nTốc độ làm mới: 170Hz(OC)\nThời gian đáp ứng: 1ms(GTG)\nNổi bật : HDR10 , Speaker 2Wx2 , tương thích G-SYNC , 95% DCI-P3 và chứng nhận DisplayHDR ™ 400\nCổng kết nối: DisplayPort 1.2 x 1, HDMI(v2.0) x 2 , USB 3.0 x2','2021-06-28 01:08:37'),(18,16,'Màn hình Asus ProArt PA278CV',10989000,'Kích thước: 27 inch\nTấm nền: IPS\nĐộ phân giải: 2K (2560x1440)\nTốc độ làm mới: 75Hz\nThời gian đáp ứng: 5ms(GTG)\nCổng kết nối: HDMI(v1.4) x 1, DisplayPort 1.2 x 2, USB-C x 1\nPhụ kiện: Cáp nguồn, Cáp DisplayPort,Cáp HDMI','2021-06-28 01:09:24'),(19,16,'Màn hình Dell U2719D',10399000,'Loại màn hình: Phẳng\nTỉ lệ: 16:9\nKích thước: 27 inch\nTấm nền: IPS\nĐộ phân giải: QHD 2560 x 1440\nTốc độ làm mới: 60Hz\nThời gian đáp ứng: 5 ms\nCổng kết nối: HDMI, DisplayPort\nCông nghệ:\nPhụ kiện: Cáp nguồn, Cáp DisplayPort, Cáp USB\n','2021-06-28 01:10:03'),(20,16,'Màn hình Samsung LC27RG50FQEXXV',10599000,'Màn hình máy tính Samsung LC27RG50FQEXXV\nLoại màn hình: Màn hình cong\nTỉ lệ: 16:9\nKích thước: 27 inch\nTấm nền: VA\nĐộ phân giải: Full HD (1920x1080)\nTốc độ làm mới: 240Hz\nThời gian đáp ứng: 4ms (GTG)\nCổng kết nối: HDMI, DisplayPort','2021-06-28 01:10:42'),(21,18,'Loa hội nghị không dây Bluetooth Jabra SPEAK 810 MS',14999000,'Kết nối với máy tính bằng cổng USB\nKết nối qua bluetooth\nLoa ngoài lớn\nMíc 360 độ và hỗ trợ chức năng mic thông minh\nHỗ trợ hội nghị 15 -20 người\nKết nối qua cổng 3.5 mm','2021-06-28 01:11:49'),(22,18,'Loa Bluetooth Edifier S360DB 2.1',8499000,'Âm thanh chất lượng cao HI-Res với tổng công suất 150W\nLoa treble với thiết kế chuẩn\nLoa siêu trầm không dây bluetooth kích thước 8 inch (210mm)\nLoa trung được chế tạo với vật liệu nhôm tinh khiết kích thước 4 inch (105mm)\nKết nối Bluetooth 4.1 của Qualcomm® aptX ™ cho việc truyền tải nhạc không dây hoàn hảo với chất lượng CD\nÂm ly Class D hiệu năng cao và xử lý tín hiệu số là sản phẩm mới nhất của tập đoàn Mỹ Texas Instruments\nVỏ gỗ được gia công bằng MDF làm giảm tối đa sự cộng hưởng âm thanh','2021-06-28 01:12:21'),(23,18,'Loa Logitech Z906 - 5.1',6399000,'Thiết Kế: Hệ Thống Loa 5.1\nKết Nối: Jack 3.5mm (headphone) / Jack 3.5mm (input) / RCA (input) / Jack 3.5 (surround input) / Coaxial (input) / Optical (input) / Push Ternminal (output)\nChức Năng: Volume Control / Bass Control / 2.1 Mode / 4.1 Mode / 3D Mode / DTS Interative / Dolby Digital / THX / Loa treo tường được\nCông Suất: 500W RMS\nCông suất loa trầm: 165W\nCông suất loa vệ tinh: 5x67W\nDolby Digital 5.1 decoding: Yes\nDTS decoding: Yes\n3D Stereo (Surround sound from 2-channel sources): Yes','2021-06-28 01:12:46'),(24,18,'Loa Creative Sound BlasterX Katana - 7.1',5999000,'Công suất thực 75W, công suất cao nhất 150W\nTần số phản hồi 20Hz - 20000Hz, tần số phản hồi của subwoofer là 20Hz - 150Hz\nCó remote điều khiển từ xa\nKết nối Bluetooth 4.2 (tối đa 2 thiết bị cùng lúc), AUXin 3.5mm, Opticalin, USB FlashDrive, USB Audio, Micin, Headset out\nKích thước (H x W x D)\nSoundbar: 60.0 x 600.0 x 79.0 mm (2.4 x 23.6 x 3.1 inches)\nSubwoofer: 333 x 130 x 299 mm (5.1 x 11.8 x 13.1 inches)\nTrọng lượng\nSoundbar: 1.5kg (3.3 lbs)\nSubwoofer: 4kg (8.8 lbs)\nCấu hình hệ thống\nHệ thống 2.1\nPhiên bản Bluetooth®\nBluetooth 4.2','2021-06-28 01:13:14'),(25,14,'Tản Nhiệt Khí CoolerMaster Hyper 212 Spectrum',749000,'Hỗ trợ Socket: Intel® LGA 2066/2011-v3 / 2011 / 1200 /1151 / 1150 / 1155 / 1156 / 1366 / 775\nAMD AM4/AM3+ / AM3 / AM2+ / AM2 / FM2+ / FM2 / FM1\n4 ống dẫn nhiệt với các lá tản nhiệt nhôm\nTrang bị quạt SF120R với đèn ARGB có hiệu ứng màu sắc vô cùng độc đáo và khả năng điều chỉnh tốc độ cho độ ồn thấp.','2021-06-28 01:14:29'),(26,14,'Tản nhiệt CPU Gigabyte Aorus ATC800 RGB',2269000,'Ống đồng trực tiếp 6 x mm6mm, tản nhiệt CPU 200W một cách hiệu quả.\nQuạt RGB 2 bóng 12 x 2cm.\nHỗ trợ đồng bộ hóa RGB FUSION 2.0 với các thiết bị AORUS khác.','2021-06-28 01:14:53'),(27,14,'Tản nhiệt nước ID Cooling DashFlow 240RGB',2499000,'Tản nhiệt nước ID Cooling DashFlow 240RGB , giải pháp tản nhiệt nước','2021-06-28 01:15:55'),(28,14,'Tản nhiệt nước CPU NZXT Kraken X63 RGB',4659000,'Phần pump với vòng LED ARGB vô cực và logo NZXT phát sáng độc đáo\nVòng sáng lớn hơn 10% với thế hệ cũ đem tới nhiều ánh sáng hơn\nTuỳ chỉnh tất cả thông số và đèn thông qua phần mềm CAM\nQuạt Aer 2 140 RGB thổi Radiator đem lại hiệu ứng ánh sáng RGB cực đẹp cho PC của bạn.\nDây nối bọc dù cứng cáp kèm khả năng xoay đầu dây thuận tiện cho việc bố trí lắp đặt','2021-06-28 01:16:27'),(29,15,'Bàn di chuột Corsair MM350 X-Large 450 x 400 x 5mm',599000,'Bàn di chuột Corsair MM350 X-Large\nKích thước: 450 x 400 x 5mm\nBề mặt : Vải chống xơ','2021-06-28 01:17:56'),(30,15,'Bàn di chuột FULL SIZE VITRA P01 Led RGB 300 x 800 x 4mm',299000,'Kích thước: 800 x 300 x 4mm\nChất liệu: 100% cao su tự nhiên, vải bo viền led\nThiết kế: bề mặt pad speed giúp chuột điều khiển dễ dàng, giảm tổn hại mòn feet chuột. Phần đế cao su được tạo vân bám chắc trên bề mặt bàn, chống trơn trượt. Có thể cuộn tròn lại,dễ mang đi mang lại.\nLed: RGB, có thể tùy chỉnh bằng điều khiển trên pad','2021-06-28 01:19:31');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `id` int NOT NULL,
  `description` int NOT NULL,
  `reduction` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(15) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` int NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28  1:52:18
