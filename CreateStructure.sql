create table SKU
(
	ID int identity primary key,
	Code as ('s' + ID) unique,
	Name nvarchar(50)
)

create table Family
(
	ID int identity primary key,
	SurName nvarchar(50),
	BudjetValue money
)

create table Basket
(
	ID int identity primary key,
	ID_SKU int,
	ID_Family int,
	Quantity int check (Quantity >= 0),
	Value int check (Value >= 0),
	PurchaseDate datetime default GETDATE(),
	DiscountValue money, 
	FOREIGN KEY (ID_SKU) REFERENCES SKU (ID),
	FOREIGN KEY (ID_Family) REFERENCES Family (ID)
)