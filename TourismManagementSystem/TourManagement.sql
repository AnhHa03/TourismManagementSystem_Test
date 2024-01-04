CREATE DATABASE TOURMANAGEMENT
GO
USE TOURMANAGEMENT
GO

CREATE TABLE LOAITUYEN (
	MALOAI VARCHAR(8) PRIMARY KEY,
	TENLOAI NVARCHAR(20),
	TGMUATRUOCKHOIHANH INT, --DON VI: GIO
	TGHOANVEMIENPHI INT,
	LEPHIHOANVETRE INT
)

CREATE TABLE DIADIEM (
	MADD VARCHAR(8) PRIMARY KEY,
	TENDD NVARCHAR(MAX),
	DIACHI NVARCHAR(MAX),
	MOTA NVARCHAR(MAX)
)

CREATE TABLE TUYEN (
	MATUYEN VARCHAR(8) PRIMARY KEY,
	TENTUYEN NVARCHAR(MAX),
	DDXUATPHAT VARCHAR(8) FOREIGN KEY REFERENCES DIADIEM(MADD),
	GIADUKIEN INT,
	SONGAY INT,
	SODEM INT,
	MALOAI VARCHAR(8) FOREIGN KEY REFERENCES LOAITUYEN(MALOAI)
)

CREATE TABLE PHUONGTIEN (
	MAPT VARCHAR(8) PRIMARY KEY,
	TENPT NVARCHAR(MAX),
	SLGHE INT
)

CREATE TABLE KHACHSAN (
	MAKS VARCHAR(8) PRIMARY KEY,
	TENKS NVARCHAR(MAX),
	DIACHI NVARCHAR(MAX),
	SDT VARCHAR(10),
	SOSAO INT,
	SUCCHUA INT
)

CREATE TABLE DICHVUKHAC (
	MADV VARCHAR(8) PRIMARY KEY,
	TENDV NVARCHAR(MAX),
	MOTA NVARCHAR(MAX)
)

CREATE TABLE NHAHANG (
	MANH VARCHAR(8) PRIMARY KEY,
	TENNH NVARCHAR(MAX),
	SDT VARCHAR(10),
	MOTA NVARCHAR(MAX)
)

CREATE TABLE LICHTRINH (
	MALT VARCHAR(8) PRIMARY KEY,
	MATUYEN VARCHAR(8) FOREIGN KEY REFERENCES TUYEN(MATUYEN),
	DDBATDAU VARCHAR(8) FOREIGN KEY REFERENCES DIADIEM(MADD),
	DDKETTHUC VARCHAR(8) FOREIGN KEY REFERENCES DIADIEM(MADD),
)

CREATE TABLE CHITIETKHACHSAN (
	MALT VARCHAR(8) FOREIGN KEY REFERENCES LICHTRINH(MALT),
	MAKS VARCHAR(8)  FOREIGN KEY REFERENCES KHACHSAN(MAKS),
	CONSTRAINT PK_LT_KS PRIMARY KEY (MALT, MAKS)
)

CREATE TABLE CHITIETNHAHANG (
	MALT VARCHAR(8) FOREIGN KEY REFERENCES LICHTRINH(MALT),
	MANH VARCHAR(8) FOREIGN KEY REFERENCES NHAHANG(MANH),
	CONSTRAINT PK_LT_NH PRIMARY KEY (MALT, MANH)
)

CREATE TABLE CHITIETPHUONGTIEN (
	MALT VARCHAR(8) FOREIGN KEY REFERENCES LICHTRINH(MALT),
	MAPT VARCHAR(8) FOREIGN KEY REFERENCES PHUONGTIEN(MAPT),
	CONSTRAINT PK_LT_PT PRIMARY KEY (MALT, MAPT)
)

CREATE TABLE CHITIETDVKHAC (
	MALT VARCHAR(8) FOREIGN KEY REFERENCES LICHTRINH(MALT),
	MADV VARCHAR(8) FOREIGN KEY REFERENCES DICHVUKHAC(MADV),
	CONSTRAINT PK_LT_DV PRIMARY KEY (MALT, MADV)
)

CREATE TABLE LOAICHUYEN (
	MALOAI VARCHAR(8) PRIMARY KEY,
	TENLOAI NVARCHAR(20),
	TILEHOANTRA INT --PHAN TRAM
)

CREATE TABLE CHUYEN (
	MACHUYEN VARCHAR(8) PRIMARY KEY,
	TGBATDAU DATETIME,
	TGKETTHUC DATETIME,
	SLTOITHIEU INT,
	SLTHUCTE INT, 
	GIAVE INT,
	MALOAI VARCHAR(8) FOREIGN KEY REFERENCES LOAICHUYEN(MALOAI),
	MATUYEN VARCHAR(8) FOREIGN KEY REFERENCES TUYEN(MATUYEN)
)

CREATE TABLE HUONGDANVIEN (
	MAHDV VARCHAR(8) PRIMARY KEY,
	HOTEN NVARCHAR(MAX),
	GIOITINH NVARCHAR(5),
	SDT VARCHAR(10),
	NGSINH DATE,
	DIACHI NVARCHAR(MAX)
)

CREATE TABLE DIEUPHOI (
	MAHDV VARCHAR(8) FOREIGN KEY REFERENCES HUONGDANVIEN(MAHDV),
	MACHUYEN VARCHAR(8) FOREIGN KEY REFERENCES CHUYEN(MACHUYEN),
	CONSTRAINT PK_DP PRIMARY KEY (MAHDV, MACHUYEN)
)

CREATE TABLE KHACHHANG (
	MAKH VARCHAR(8) PRIMARY KEY,
	HOTEN NVARCHAR(MAX),
	CCCD VARCHAR(20),
	SDT VARCHAR(10),
	EMAIL VARCHAR(100),
	DIACHI NVARCHAR(MAX)
)

CREATE TABLE PHIEUDATCHO (
	MAPHIEU VARCHAR(8) PRIMARY KEY,
	NGAYDAT DATE,
	TINHTRANG NVARCHAR(20),
	SLKHACH INT,
	TONGTIEN INT,
	SOTIENDATHANHTOAN INT,
	MACHUYEN VARCHAR(8) FOREIGN KEY REFERENCES CHUYEN(MACHUYEN),
	MAKH VARCHAR(8) FOREIGN KEY REFERENCES KHACHHANG(MAKH)
)

CREATE TABLE HANHKHACH (
	MAHK VARCHAR(8) PRIMARY KEY,
	HOTEN NVARCHAR(MAX),
	NGSINH DATE,
	GIOITINH NVARCHAR(5),
	DIACHI NVARCHAR(MAX),
	SDT VARCHAR(10),
	CCCD VARCHAR(20),
	PASSPORT VARCHAR(50),
	NGAYHETHANPASSPORT DATE,
	NGAYHETHANVISA DATE,
	MAPHIEU VARCHAR(8) FOREIGN KEY REFERENCES PHIEUDATCHO(MAPHIEU)
)

CREATE TABLE THONGTINTHANHTOAN (
	MATT VARCHAR(8) PRIMARY KEY,
	MAPHIEU VARCHAR(8) FOREIGN KEY REFERENCES PHIEUDATCHO(MAPHIEU),
	SOTIEN INT,
	THOIGIAN DATETIME,
	TRANGTHAI NVARCHAR(20),
	PHUONGTHUC NVARCHAR(50)
)

CREATE TABLE VE (
	MAVE VARCHAR(8) PRIMARY KEY,
	MAHK VARCHAR(8) FOREIGN KEY REFERENCES HANHKHACH(MAHK),
	MAPHIEU VARCHAR(8) FOREIGN KEY REFERENCES PHIEUDATCHO(MAPHIEU),
	TRANGTHAI NVARCHAR(20),
	NGAYBAN DATE,
	GIAVE INT
)

CREATE TABLE TAIKHOAN (
	TENTK VARCHAR(100) PRIMARY KEY,
	MATKHAU VARCHAR(50)
)

CREATE TABLE THONGBAO (
	MATB VARCHAR(8) PRIMARY KEY,
	THONGBAO NVARCHAR(MAX),
	THOIGIAN DATETIME,
	DADOC BIT
)

ALTER TABLE LICHTRINH ADD NGAYTHU INT
ALTER TABLE CHUYEN ADD THANHCONG bit

INSERT INTO LOAITUYEN VALUES ('LT000001', N'Trong nước', 24, 4, 100000)
INSERT INTO LOAITUYEN VALUES ('LT000002', N'Nước ngoài', 168, 72, 1250000)
INSERT INTO LOAICHUYEN VALUES ('LC000001', N'Thông thường', 100)
INSERT INTO LOAICHUYEN VALUES ('LC000002', N'Khuyến mãi', 80)
INSERT INTO TAIKHOAN VALUES ('admin', 'db69fc039dcbd2962cb4d28f5891aae1')