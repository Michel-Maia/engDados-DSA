
CREATE TABLE DIM_MOEDA
    (
      CurrencyKey INT NOT NULL ,
      CurrencyAlternateKey NCHAR(3) NOT NULL ,
      CurrencyName NVARCHAR(50) NOT NULL ,
      CONSTRAINT PK_DIM_MOEDA_CurrencyKey PRIMARY KEY ( CurrencyKey )
    );  

CREATE TABLE DIM_CLIENTE
    (
      CustomerKey INT NOT NULL  ,
      GeographyKey INT NULL ,
      CustomerAlternateKey NVARCHAR(15) NOT NULL ,
      Title NVARCHAR(8) NULL ,
      FirstName NVARCHAR(50) NULL ,
      MiddleName NVARCHAR(50) NULL ,
      LastName NVARCHAR(50) NULL ,
      NameStyle bool NULL ,
      BirthDate DATE NULL ,
      MaritalStatus NCHAR(1) NULL ,
      Suffix NVARCHAR(10) NULL ,
      Gender NVARCHAR(1) NULL ,
      EmailAddress NVARCHAR(50) NULL ,
      YearlyIncome NUMERIC(15, 2) NULL ,
      Education NVARCHAR(40) NULL ,
      Occupation NVARCHAR(100) NULL ,
      AddressLine1 NVARCHAR(120) NULL ,
      AddressLine2 NVARCHAR(120) NULL ,
      Phone NVARCHAR(20) NULL ,
      DateFirstPurchase DATE NULL ,
      CONSTRAINT PK_DIM_CLIENTE_CustomerKey PRIMARY KEY ( CustomerKey )
    );  
 
CREATE TABLE DIM_DATA
    (
      DateKey INT NOT NULL ,
      FullDateAlternateKey DATE NOT NULL ,
      DayNumberOfWeek INT NOT NULL ,
      DayNameOfWeek NVARCHAR(10) NOT NULL ,
      DayNumberOfMonth INT NOT NULL ,
      DayNumberOfYear INT NOT NULL ,
      WeekNumberOfYear INT NOT NULL ,
      MonthName NVARCHAR(10) NOT NULL ,
      MonthNumberOfYear INT NOT NULL ,
      CalendarQuarter INT NOT NULL ,
      CalendarYear INT NOT NULL ,
      CalendarSemester INT NOT NULL ,
      FiscalQuarter INT NOT NULL ,
      FiscalYear INT NOT NULL ,
      FiscalSemester INT NOT NULL ,
      CONSTRAINT PK_DIM_DATA_DateKey PRIMARY KEY ( DateKey )
    ) DISTSTYLE ALL;  

CREATE TABLE DIM_GEOGRAFIA
    (
      GeographyKey INT NOT NULL  ,
      City NVARCHAR(30) NULL ,
      StateProvinceCode NVARCHAR(3) NULL ,
      StateProvinceName NVARCHAR(50) NULL ,
      CountryRegionCode NVARCHAR(3) NULL ,
      CountryRegionName NVARCHAR(50) NULL ,
      PostalCode NVARCHAR(15) NULL ,
      SalesTerritoryKey INT NULL ,
      IpAddressLocator NVARCHAR(15) NULL ,
      CONSTRAINT PK_DIM_GEOGRAFIA_GeographyKey PRIMARY KEY ( GeographyKey )
    );  
 
CREATE TABLE DIM_PRODUTO
    (
      ProductKey INT NOT NULL  ,
      ProductAlternateKey NVARCHAR(25) NULL ,
      ProductSubcategoryKey INT NULL ,
      WeightUnitMeasureCode NCHAR(3) NULL ,
      SizeUnitMeasureCode NCHAR(3) NULL ,
      ProductName NVARCHAR(50) NOT NULL ,
      StandardCost NUMERIC(15, 2) NULL ,
      FinishedGoodsFlag bool NOT NULL ,
      Color NVARCHAR(15) NOT NULL ,
      SafetyStockLevel INT NULL ,
      ReorderPoint INT NULL ,
      ListPrice NUMERIC(15, 2) NULL ,
      Size NVARCHAR(50) NULL ,
      SizeRange NVARCHAR(50) NULL ,
      Weight FLOAT NULL ,
      DaysToManufacture INT NULL ,
      ProductLine NCHAR(2) NULL ,
      DealerPrice NUMERIC(15, 2) NULL ,
      Class NCHAR(2) NULL ,
      Style NCHAR(2) NULL ,
      ModelName NVARCHAR(50) NULL ,
      Description NVARCHAR(400) NULL ,
      StartDate DATETIME NULL ,
      EndDate DATETIME NULL ,
      Status NVARCHAR(7) NULL ,
      CONSTRAINT PK_DIM_PRODUTO_ProductKey PRIMARY KEY ( ProductKey )
    );  
  
CREATE TABLE DIM_PRODUTO_CATEGORIA
    (
      ProductCategoryKey INT NOT NULL  ,
      ProductCategoryAlternateKey INT NULL ,
      ProductCategoryName NVARCHAR(50) NOT NULL ,
      CONSTRAINT PK_DIM_PRODUTO_CATEGORIA_ProductCategoryKey PRIMARY KEY
        ( ProductCategoryKey )
    );  

CREATE TABLE DIM_PRODUTO_SUBCATEGORIA
    (
      ProductSubcategoryKey INT NOT NULL ,
      ProductSubcategoyAlternateKey INT NULL ,
      ProductSubcategoryName NVARCHAR(50) NOT NULL ,
      ProductCategoryKey INT NULL  ,
      CONSTRAINT PK_DIM_PRODUTO_SUBCATEGORIA_ProductSubcategoryKey PRIMARY KEY
        ( ProductSubcategoryKey )
    );  
 
 
CREATE TABLE DIM_REVENDEDOR
    (
      ResellerKey INT NOT NULL ,
      GeographyKey INT NULL  ,
      ResellerAlternateKey NVARCHAR(15) NULL ,
      Phone NVARCHAR(25) NULL ,
      BusinessType VARCHAR(20) NOT NULL ,
      ResellerName NVARCHAR(50) NOT NULL ,
      NumberEmployees INT NULL ,
      OrderFrequency CHAR(1) NULL ,
      OrderMonth INT NULL ,
      FirstOrderYear INT NULL ,
      LastOrderYear INT NULL ,
      ProductLine NVARCHAR(50) NULL ,
      AddressLine1 NVARCHAR(60) NULL ,
      AddressLine2 NVARCHAR(60) NULL ,
      AnnualSales NUMERIC(15, 2) NULL ,
      BankName NVARCHAR(50) NULL ,
      MinPaymentType INT NULL ,
      MinPaymentAmount NUMERIC(15, 2) NULL ,
      AnnualRevenue NUMERIC(15, 2) NULL ,
      YearOpened INT NULL ,
      CONSTRAINT PK_DIM_REVENDEDOR_ResellerKey PRIMARY KEY ( ResellerKey )
    );  


CREATE TABLE FATO_PRODUTO_INVENTARIO
    (
      ProductKey INT NOT NULL ,
      DateKey INT NOT NULL  ,
      MovementDate DATE NOT NULL ,
      UnitCost NUMERIC(15, 2) NOT NULL ,
      UnitsIn INT NOT NULL ,
      UnitsOut INT NOT NULL ,
      UnitsBalance INT NOT NULL ,
      CONSTRAINT PK_FATO_PRODUTO_INVENTARIO PRIMARY KEY ( ProductKey, DateKey )
    );
 
CREATE TABLE FATO_TAXAS
    (
      CurrencyKey INT NOT NULL ,
      DateKey INT NOT NULL  ,
      AverageRate FLOAT NOT NULL ,
      EndOfDayRate FLOAT NOT NULL ,
      Date DATETIME NULL ,
      CONSTRAINT PK_FactCurrencyRate_CurrencyKey_DateKey PRIMARY KEY
        ( CurrencyKey, DateKey )
    ); 
 
CREATE TABLE FATO_VENDAS
    (
      ProductKey INT NOT NULL ,
      OrderDateKey INT NOT NULL  ,
      DueDateKey INT NOT NULL ,
      ShipDateKey INT NOT NULL ,
      CustomerKey INT NOT NULL ,
      CurrencyKey INT NOT NULL ,
      SalesTerritoryKey INT NOT NULL ,
      SalesOrderNumber NVARCHAR(20) NOT NULL ,
      SalesOrderLineNumber INT NOT NULL ,
      RevisionNumber INT NOT NULL ,
      OrderQuantity INT NOT NULL ,
      UnitPrice NUMERIC(15, 2) NOT NULL ,
      ExtendedAmount NUMERIC(15, 2) NOT NULL ,
      UnitPriceDiscountPct FLOAT NOT NULL ,
      DiscountAmount FLOAT NOT NULL ,
      ProductStandardCost NUMERIC(15, 2) NOT NULL ,
      TotalProductCost NUMERIC(15, 2) NOT NULL ,
      SalesAmount NUMERIC(15, 2) NOT NULL ,
      TaxAmt NUMERIC(15, 2) NOT NULL ,
      Freight NUMERIC(15, 2) NOT NULL ,
      CarrierTrackingNumber NVARCHAR(25) NULL ,
      CustomerPONumber NVARCHAR(25) NULL ,
      OrderDate DATETIME NULL ,
      DueDate DATETIME NULL ,
      ShipDate DATETIME NULL ,
      CONSTRAINT PK_FATO_VENDAS_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY
        ( SalesOrderNumber, SalesOrderLineNumber )
    ); 
 


ALTER TABLE   DIM_CLIENTE     ADD  CONSTRAINT  FK_DIM_CLIENTE_DIM_GEOGRAFIA  FOREIGN KEY( GeographyKey )
REFERENCES   DIM_GEOGRAFIA  ( GeographyKey );
 

ALTER TABLE   DIM_PRODUTO     ADD  CONSTRAINT  FK_DIM_PRODUTO_DIM_PRODUTOSubcategory  FOREIGN KEY( ProductSubcategoryKey )
REFERENCES   DIM_PRODUTOSubcategory  ( ProductSubcategoryKey );
 
 
ALTER TABLE   DIM_PRODUTOSubcategory     ADD  CONSTRAINT  FK_DIM_PRODUTOSubcategory_DIM_PRODUTO_CATEGORIA  FOREIGN KEY( ProductCategoryKey )
REFERENCES   DIM_PRODUTO_CATEGORIA  ( ProductCategoryKey );
 
 
ALTER TABLE   DIM_REVENDEDOR     ADD  CONSTRAINT  FK_DIM_REVENDEDOR_DIM_GEOGRAFIA  FOREIGN KEY( GeographyKey )
REFERENCES   DIM_GEOGRAFIA  ( GeographyKey );
 
 
ALTER TABLE   FATO_PRODUTO_INVENTARIO     ADD  CONSTRAINT  FK_FATO_PRODUTO_INVENTARIO_DIM_DATA  FOREIGN KEY( DateKey )
REFERENCES   DIM_DATA  ( DateKey );
 
 
ALTER TABLE   FATO_PRODUTO_INVENTARIO     ADD  CONSTRAINT  FK_FATO_PRODUTO_INVENTARIO_DIM_PRODUTO  FOREIGN KEY( ProductKey )
REFERENCES   DIM_PRODUTO  ( ProductKey );
 
 
ALTER TABLE   FATO_TAXAS     ADD  CONSTRAINT  FK_FactCurrencyRate_DIM_MOEDA  FOREIGN KEY( CurrencyKey )
REFERENCES   DIM_MOEDA  ( CurrencyKey );
 
 
ALTER TABLE   FATO_TAXAS     ADD  CONSTRAINT  FK_FactCurrencyRate_DIM_DATA  FOREIGN KEY( DateKey )
REFERENCES   DIM_DATA  ( DateKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_MOEDA  FOREIGN KEY( CurrencyKey )
REFERENCES   DIM_MOEDA  ( CurrencyKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_CLIENTE  FOREIGN KEY( CustomerKey )
REFERENCES   DIM_CLIENTE  ( CustomerKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_DATA  FOREIGN KEY( OrderDateKey )
REFERENCES   DIM_DATA  ( DateKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_DATA1  FOREIGN KEY( DueDateKey )
REFERENCES   DIM_DATA  ( DateKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_DATA2  FOREIGN KEY( ShipDateKey )
REFERENCES   DIM_DATA  ( DateKey );
 
 
ALTER TABLE   FATO_VENDAS     ADD  CONSTRAINT  FK_FATO_VENDAS_DIM_PRODUTO  FOREIGN KEY( ProductKey )
REFERENCES   DIM_PRODUTO  ( ProductKey );


INSERT INTO FATO_VENDAS (
    ProductKey,
    OrderDateKey,
    DueDateKey,
    ShipDateKey,
    CustomerKey,
    CurrencyKey,
    SalesTerritoryKey,
    SalesOrderNumber,
    SalesOrderLineNumber,
    RevisionNumber,
    OrderQuantity,
    UnitPrice,
    ExtendedAmount,
    UnitPriceDiscountPct,
    DiscountAmount,
    ProductStandardCost,
    TotalProductCost,
    SalesAmount,
    TaxAmt,
    Freight,
    CarrierTrackingNumber,
    CustomerPONumber,
    OrderDate,
    DueDate,
    ShipDate
) VALUES (
    123, -- ProductKey
    456, -- OrderDateKey
    789, -- DueDateKey
    321, -- ShipDateKey
    654, -- CustomerKey
    987, -- CurrencyKey
    246, -- SalesTerritoryKey
    'SO123456', -- SalesOrderNumber
    1, -- SalesOrderLineNumber
    1, -- RevisionNumber
    10, -- OrderQuantity
    100.00, -- UnitPrice
    1000.00, -- ExtendedAmount
    0.10, -- UnitPriceDiscountPct
    100.00, -- DiscountAmount
    50.00, -- ProductStandardCost
    75.00, -- TotalProductCost
    900.00, -- SalesAmount
    90.00, -- TaxAmt
    25.00, -- Freight
    '1234567890', -- CarrierTrackingNumber
    'PO123456', -- CustomerPONumber
    '2022-01-15 12:00:00', -- OrderDate
    '2022-01-20 12:00:00', -- DueDate
    '2022-01-18 12:00:00' -- ShipDate
);

SELECT dpc.ProductCategoryName, AVG(fv.UnitPrice) as AvgUnitPrice
FROM DIM_PRODUTO_CATEGORIA dpc
JOIN FATO_VENDAS fv ON dpc.ProductCategoryKey = fv.ProductKey
GROUP BY dpc.ProductCategoryName;

SELECT ProductKey, ShipDateKey, CustomerKey, SalesAmount FROM FATO_VENDAS;

SELECT AVG(UnitPrice) FROM FATO_VENDAS;

CREATE VIEW vw_MediaUnitPricePorProduto AS
SELECT dpc.ProductCategoryName, AVG(fv.UnitPrice) as AvgUnitPrice
FROM DIM_PRODUTO_CATEGORIA dpc
JOIN FATO_VENDAS fv ON dpc.ProductCategoryKey = fv.ProductKey
GROUP BY dpc.ProductCategoryName;

SELECT * FROM vw_MediaUnitPricePorProduto;

SELECT vupp.ProductCategoryName, vupp.AvgUnitPrice, fv.SalesAmount
FROM vw_MediaUnitPricePorProduto vupp
JOIN FATO_VENDAS fv ON vupp.ProductCategoryName = fv.ProductKey;

CREATE VIEW vw_ClientesCompraramMaisDe2Unidades AS
SELECT c.CustomerKey, c.FirstName, c.LastName, dv.ProductKey, SUM(dv.OrderQuantity) AS TotalOrderQuantity
FROM DIM_CLIENTE c
JOIN FATO_VENDAS dv ON c.CustomerKey = dv.CustomerKey
WHERE dv.OrderQuantity > 2
GROUP BY c.CustomerKey, c.FirstName, c.LastName, dv.ProductKey;

SELECT * FROM vw_ClientesCompraramMaisDe2Unidades;

CREATE TABLE ClientesCompraramMaisDe2Unidades (
    CustomerKey INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ProductKey INT NOT NULL,
    TotalOrderQuantity INT NOT NULL
);

INSERT INTO ClientesCompraramMaisDe2Unidades (
    CustomerKey, FirstName, LastName, ProductKey, TotalOrderQuantity
)
SELECT c.CustomerKey, c.FirstName, c.LastName, dv.ProductKey, SUM(dv.OrderQuantity) AS TotalOrderQuantity
FROM DIM_CLIENTE c
JOIN FATO_VENDAS dv ON c.CustomerKey = dv.CustomerKey
WHERE dv.OrderQuantity > 2
GROUP BY c.CustomerKey, c.FirstName, c.LastName, dv.ProductKey;

CREATE VIEW vw_ClientesProdutosCompraramMaisDe2Unidades AS
SELECT ccm.CustomerKey, ccm.ProductKey, ccm.TotalOrderQuantity, p.ProductName, p.ProductLine
FROM ClientesCompraramMaisDe2Unidades ccm
JOIN DIM_PRODUTO p ON ccm.ProductKey = p.ProductKey;

SELECT * FROM vw_ClientesProdutosCompraramMaisDe2Unidades;


