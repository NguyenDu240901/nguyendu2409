CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe 
GO

--Food
--Table
--FoodCategory
--Account
--Bill
--BillInfo

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bản chưa có  tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	--Trống || Có người
)
GO

CREATE TABLE Account
(
	UeserName NVARCHAR(100) NOT NULL PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Kter',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL DEFAULT 0 --1: admin && 0: staff
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL,

	FOREIGN KEY (idCategory) REFERENCES  dbo.FoodCategory(id) 
)	
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1:Đã thanh toán && 0:Chưa thanh toán

	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBiLL INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id),
)
GO

INSERT INTO	dbo.Account
		( UeserName ,
		DisplayName ,
		PassWord ,
		Type
		)
VALUES  ( N'K9' , --UserName - nvarchar(100)
		  N'RongK9' , --DisplayName - nvarchar(100)
		  N'1' , --PassWord - nvarchar(1000)
		  1 -- Type - int
		  )
INSERT INTO	dbo.Account
		( UeserName ,
		DisplayName ,
		PassWord ,
		Type
		)
VALUES  ( N'staff' , --UserName - nvarchar(100)
		  N'staff' , --DisplayName - nvarchar(100)
		  N'1' , --PassWord - nvarchar(1000)
		  0 -- Type - int
		  )
SELECT * FROM dbo.Account