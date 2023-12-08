CREATE TABLE `carts` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `spID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `ten_san_pham` varchar(200) DEFAULT NULL,
  `cau_hinh` varchar(200) DEFAULT NULL,
  `hang` varchar(45) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `tong_gia` double DEFAULT NULL,
  PRIMARY KEY (`cartID`)
)


CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mat_khau` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)


CREATE TABLE `san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) DEFAULT NULL,
  `cau_hinh` varchar(45) DEFAULT NULL,
  `hang` varchar(100) DEFAULT NULL,
  `loai_san_pham` varchar(45) DEFAULT NULL,
  `gia` varchar(45) DEFAULT NULL,
  `hinh_anh` varchar(100) DEFAULT NULL,
  `trang_thai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 


--CREATE TABLE `orders` (
--  `id` int NOT NULL AUTO_INCREMENT,
--  `orderID` varchar(45) DEFAULT NULL,
--  `ho_ten` varchar(100) DEFAULT NULL,
--  `email` varchar(100) DEFAULT NULL,
--  `so_dien_thoai` varchar(45) DEFAULT NULL,
--  `dia_chi` varchar(45) DEFAULT NULL,
--  `gia` varchar(45) DEFAULT NULL,
--  `phuong_thuc_thanh_toan` varchar(45) DEFAULT NULL,
--  `ten_sp` varchar(100) DEFAULT NULL,
--  `cau_hinh` varchar(100) DEFAULT NULL,
--  PRIMARY KEY (`id`)
--)