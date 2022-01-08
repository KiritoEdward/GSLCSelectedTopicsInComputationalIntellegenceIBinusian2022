CREATE DATABASE FishingMania
GO
USE FishingMania
GO

CREATE TABLE [MsCustomer] (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerEmail VARCHAR(50) NOT NULL,
	CustomerDOB DATE NOT NULL
);

INSERT INTO MsCustomer VALUES 
('CU001', 'Dirk Titterell', 'Male', '74 Melvin Point', 'dtitterell0@yellowpages.com', '2020-10-29'),
('CU002', 'Dukey Diano', 'Male', '92 Sugar Alley', 'ddiano1@state.com', '2020-09-27'),
('CU003', 'Alex Meekins', 'Male', '577 Dovetail Park', 'ameekins2@blogs.com', '2020-11-06'),
('CU004', 'Cherice Jermey', 'Female', '811 Debs Street', 'cjermey3@guardian.com', '2021-05-18'),
('CU005', 'Ingamar Carlin', 'Male', '389 Surrey Pass', 'icarlin4@shareasale.com', '2020-08-08'),
('CU006', 'Pooh McCutcheon', 'Male', '7 Melby Trail', 'pmccutcheon5@salon.com', '2020-08-03'),
('CU007', 'Silvain Jozsa', 'Female', '19269 Maryland Hill', 'sjozsa6@omniture.com', '2020-12-30'),
('CU008', 'Javier Drewson', 'Female', '8 Moulton Point', 'jdrewson7@home.com', '2020-08-20'),
('CU009', 'Wilbur Francino', 'Female', '21840 Golden Leaf Avenue', 'wfrancino8@wunderground.com', '2020-10-06'),
('CU010', 'Sadie Snow', 'Female', '70 Eagle Crest Hill', 'ssnow9@github.com', '2021-04-25'),
('CU011', 'Sofie Carmen', 'Female', '20196 Springview Plaza', 'scarmena@gov.com', '2020-11-20'),
('CU012', 'Amy Grenkov', 'Male', '2263 Weeping Birch Center', 'agrenkovb@aol.com', '2020-06-06'),
('CU013', 'Gabriela Scarf', 'Female', '920 Bobwhite Trail', 'gscarfc@skype.com', '2021-03-12'),
('CU014', 'Westley Boram', 'Female', '47 Darwin Terrace', 'wboramd@sun.com', '2020-09-03'),
('CU015', 'Hadleigh Playfoot', 'Female', '49 6th Junction', 'hplayfoote@msu.com', '2021-04-14');

CREATE TABLE [MsFisherman] (
	FishermanID CHAR(5) PRIMARY KEY CHECK (FishermanID LIKE 'FS[0-9][0-9][0-9]'),
	FishermanName VARCHAR(50) NOT NULL,
	FishermanGender VARCHAR(10) NOT NULL,
	FishermanAddress VARCHAR(50) NOT NULL
);

INSERT INTO MsFisherman VALUES 
('FS001', 'Clem', 'Male', '0975 Forest Dale Trail'),
('FS002', 'Dene', 'Male', '2 Grayhawk Parkway'),
('FS003', 'Lethia', 'Female', '905 Goodland Lane'),
('FS004', 'Tyrone', 'Male', '51745 Bowman Hill'),
('FS005', 'Shanda', 'Male', '848 New Castle Center'),
('FS006', 'Nani', 'Male', '3455 Village Green Court'),
('FS007', 'Dorothea', 'Male', '772 Goodland Park'),
('FS008', 'Chet', 'Female', '1 Merchant Street'),
('FS009', 'Darsie', 'Female', '31718 Toban Point'),
('FS010', 'Don', 'Male', '936 Lyons Plaza'),
('FS011', 'Tabby', 'Male', '10787 School Drive'),
('FS012', 'Desmond', 'Male', '8 Lien Junction'),
('FS013', 'Robenia', 'Female', '4 Dapin Avenue'),
('FS014', 'Curr', 'Female', '2 Veith Terrace'),
('FS015', 'Rudd', 'Male', '2 Hermina Park');

CREATE TABLE [MsFishType] (
	FishTypeID CHAR(5) PRIMARY KEY CHECK (FishTypeID Like 'FT[0-9][0-9][0-9]'),
	FishTypeName VARCHAR(50) NOT NULL
);

INSERT INTO MsFishType VALUES
('FT001', 'Bass'),
('FT002', 'Grouper'),
('FT003', 'Tuna'),
('FT004', 'Marlin'),
('FT005', 'Catfish');

CREATE TABLE [MsFish] (
	FishID CHAR(5) PRIMARY KEY CHECK (FishID LIKE 'FI[0-9][0-9][0-9]'),
	FishTypeID CHAR(5) FOREIGN KEY REFERENCES MsFishType(FishTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishName VARCHAR(50) NOT NULL,
	FishPrice FLOAT NOT NULL
);

INSERT INTO MsFish VALUES 
('FI001', 'FT005', 'Channel Catfish', 12.5),
('FI002', 'FT004', 'Blue Marlin', 20.3),
('FI003', 'FT003', 'Albacore', 10.3),
('FI004', 'FT004', 'Sailfish', 30.5),
('FI005', 'FT002', 'Red Grouper', 10.7),
('FI006', 'FT003', 'Atlantic Bonito', 20.3),
('FI007', 'FT004', 'Swordfish', 31.4),
('FI008', 'FT003', 'Bigeye Tuna', 10.2),
('FI009', 'FT004', 'White Marlin', 20.3),
('FI010', 'FT001', 'Spotted Bass', 35.3),
('FI011', 'FT003', 'Blackfin Tuna', 12.3),
('FI012', 'FT003', 'King Mackerel', 15.3),
('FI013', 'FT001', 'Striped Bass', 16.3),
('FI014', 'FT005', 'Flathead Catfish', 8.1),
('FI015', 'FT002', 'Gag Grouper', 39.4),
('FI016', 'FT005', 'Blue Catfish', 7.4);

CREATE TABLE [TransactionHeader] (
	TransactionID CHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishermanID CHAR(5) FOREIGN KEY REFERENCES MsFisherman(FishermanID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
);

INSERT INTO TransactionHeader (TransactionID, FishermanID, CustomerID, TransactionDate) VALUES 
('TR001', 'FS002', 'CU004', '2020-09-06'),
('TR002', 'FS013', 'CU015', '2020-06-05'),
('TR003', 'FS007', 'CU015', '2020-12-18'),
('TR004', 'FS011', 'CU015', '2020-12-15'),
('TR005', 'FS010', 'CU012', '2020-08-04'),
('TR006', 'FS005', 'CU005', '2021-02-19'),
('TR007', 'FS006', 'CU011', '2021-01-01'),
('TR008', 'FS009', 'CU013', '2021-04-28'),
('TR009', 'FS001', 'CU001', '2020-06-22'),
('TR010', 'FS012', 'CU009', '2020-06-13'),
('TR011', 'FS005', 'CU007', '2020-06-04'),
('TR012', 'FS003', 'CU001', '2020-07-28'),
('TR013', 'FS015', 'CU008', '2021-03-18'),
('TR014', 'FS006', 'CU001', '2020-08-22'),
('TR015', 'FS003', 'CU013', '2020-05-31');

CREATE TABLE [TransactionDetail] (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishID CHAR(5) FOREIGN KEY REFERENCES MsFish(FishID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(TransactionID, FishID)
);

INSERT INTO TransactionDetail VALUES
('TR001', 'FI011', 9),
('TR001', 'FI015', 2),
('TR002', 'FI006', 4),
('TR002', 'FI016', 23),
('TR003', 'FI015', 27),
('TR003', 'FI007', 2),
('TR004', 'FI014', 27),
('TR004', 'FI001', 6),
('TR005', 'FI014', 21),
('TR005', 'FI003', 28),
('TR006', 'FI015', 4),
('TR006', 'FI002', 9),
('TR007', 'FI015', 26),
('TR007', 'FI004', 16),
('TR008', 'FI007', 17),
('TR008', 'FI005', 20),
('TR009', 'FI002', 17),
('TR009', 'FI005', 20),
('TR010', 'FI010', 9),
('TR010', 'FI004', 15),
('TR011', 'FI012', 14),
('TR011', 'FI014', 8),
('TR012', 'FI016', 5),
('TR012', 'FI009', 24),
('TR013', 'FI004', 3),
('TR013', 'FI005', 26),
('TR014', 'FI014', 27),
('TR014', 'FI010', 2),
('TR015', 'FI005', 26),
('TR015', 'FI002', 21);

-- Jawaban Nomor 1
DECLARE @TransactionID NVARCHAR(50), @TransactionDateDay NVARCHAR(50), @TransactionDateMonth VARCHAR(80);
PRINT 'Transaction in 2021';
PRINT '--------------------'
-- Mendeklarasikan Sebuah Cursor
DECLARE TransactionIn2021 CURSOR FOR
-- Untuk Menunjuk TransactionId, Day dan Month dalam tabel TransactionHeader
SELECT TH.TransactionID, DATENAME(DAY,TH.TransactionDate) AS [Day], DATENAME(MONTH,TH.TransactionDate) AS [Month] FROM TransactionHeader TH
-- Memakai Kondisi
WHERE DATEPART(YEAR,TH.TransactionDate) = '2021'
-- Buka Cursor-TransactionIn2021 agar dapat digunakan
OPEN TransactionIn2021
	-- Mengambil data dari TransactionIn2021
	FETCH NEXT FROM TransactionIn2021
	INTO @TransactionID, @TransactionDateDay,@TransactionDateMonth
	-- Selama ada datanya maka lakukan pengambilan data
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT CONCAT(@TransactionID,' - ',@TransactionDateDay,' ',@TransactionDateMonth)
			-- Ambil data selanjutnya
			FETCH NEXT FROM TransactionIn2021
			INTO @TransactionID, @TransactionDateDay,@TransactionDateMonth
		END
-- Tutup Cursor TransactionIn2021
CLOSE TransactionIn2021
-- Delete Cursor TransactionIn2021
DEALLOCATE TransactionIn2021

-- Jawaban Nomor 2
DECLARE @CustomerName NVARCHAR(50), @Spending INT;
-- Mendeklarasikan Sebuah Cursor
DECLARE FemaleSpending1000 CURSOR FOR
-- Untuk Menunjuk Quantity dan FishPrice
SELECT MC.CustomerName,SUM((TD.Quantity * MF.FishPrice)) AS [Spending] FROM MsCustomer MC 
JOIN TransactionHeader TH ON MC.CustomerID = TH.CustomerID
JOIN TransactionDetail TD ON TH.TransactionID = TD.TransactionID
JOIN MsFish MF ON MF.FishID = TD.FishID
-- Memakai Kondisi
WHERE MC.CustomerGender LIKE 'Female'
-- GROUP BY KARENA ADA AGGREGATE
GROUP BY MC.CustomerName
-- Buka Cursor-FemaleSpending1000 agar dapat digunakan
OPEN FemaleSpending1000
	-- Mengambil data dari FemaleSpending1000
	FETCH NEXT FROM FemaleSpending1000
	INTO @CustomerName, @Spending
	-- Selama ada datanya maka lakukan pengambilan data
	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @Spending >= 1000
				PRINT CONCAT(@CustomerName,' has reached the condition of spending $1000!')
			ELSE
				PRINT CONCAT('Money spent by ',@CustomerName,' is still below $1000!')
			-- Ambil data selanjutnya
			FETCH NEXT FROM FemaleSpending1000
			INTO @CustomerName, @Spending
		END
-- Tutup Cursor FemaleSpending1000
CLOSE FemaleSpending1000
-- Delete Cursor FemaleSpending1000
DEALLOCATE FemaleSpending1000

-- Jawaban Nomor 3
-- Mendeklarasikan Sebuah Cursor
DECLARE DecreaseFishPrice CURSOR FOR
-- Untuk Menunjuk Tabel yang dibutuhkan
SELECT MF.FishName ,COUNT(TH.TransactionID) AS [Total Bought] FROM TransactionHeader TH
JOIN TransactionDetail TD ON TH.TransactionID = TD.TransactionID
JOIN MsFish MF ON MF.FishID = TD.FishID
JOIN MsFishType MFT ON MFT.FishTypeID = MF.FishTypeID
-- GROUP BY KARENA ADA AGGREGATE
GROUP BY MF.FishName
-- Memakai Kondisi
HAVING COUNT(TH.TransactionID) < 3


-- Jawaban Nomor 4

-- Jawaban Nomor 5

-- Jawaban Nomor 6

-- Jawaban Nomor 7

-- Jawaban Nomor 8

-- Jawaban Nomor 9

-- Jawaban Nomor 10