2. Create tables (output: file in the repository CreateStructure.sql in the Tables branch).
2.1 dbo.SKU (ID identity, Code, Name);
   2.1.1 Restriction on uniqueness of Code field;
   2.1.2 Code field is calculated: "s" + ID;
2.2 dbo.Family (ID identity, SurName, BudgetValue);
2.3 dbo.Basket (ID identity, ID_SKU (foreign key to dbo.SKU table), ID_Family (foreign key to dbo.Family table) Quantity, Value, PurchaseDate, DiscountValue);
   2.3.1 Restrict that Quantity and Value field cannot be less than 0;
   2.3.2 Add a default value for the PurchaseDate field: the date the record was added (current date);
