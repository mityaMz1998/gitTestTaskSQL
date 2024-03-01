1. To master and consolidate skills in working with functions, stored procedures, views and triggers in the MS SQL relational database management system.
1.1 Create a repository on GitHub;
1.2 Each subsequent item should be on a separate branch (branches should not contain code that is not related to the item);
1.3 Create Pull Requests of each branch in main;
2. Create tables (output: file in the repository CreateStructure.sql in the Tables branch).
2.1 dbo.SKU (ID identity, Code, Name);
   2.1.1 Restriction on uniqueness of Code field;
   2.1.2 Code field is calculated: "s" + ID;
2.2 dbo.Family (ID identity, SurName, BudgetValue);
2.3 dbo.Basket (ID identity, ID_SKU (foreign key to dbo.SKU table), ID_Family (foreign key to dbo.Family table) Quantity, Value, PurchaseDate, DiscountValue);
   2.3.1 Restrict that Quantity and Value field cannot be less than 0;
  2.3.2 Add a default value for the PurchaseDate field: the date the record was added (current date);
3. Create a function (output: file in the repository dbo.udf_GetSKUPrice.sql in the Functions branch);
3.1 Input parameter @ID_SKU;
3.2 Calculates the price of the transferred product from the table dbo.Basket using the formula;
   3.1.1 sum Value on transferred SKU / sum Quantity on transferred SKU;
3.3 Output value of type decimal(18, 2);
4. Create a view (output: file in dbo.vw_SKUPrice repository in the VIEWs branch);
4.1 Returns all product attributes from the dbo.SKU table and a calculated attribute with the cost per product (using the function dbo.udf_GetSKUPrice).
5. Create a procedure (output: file in the dbo.usp_MakeFamilyPurchase repository in the Procedures branch).
5.1 Input parameter (@FamilySurName varchar(255)) is one of the values of the SurName attribute of the dbo.Family table;
5.2 Procedure when called updates the data in the BudgetValue field of the dbo.Family table by logic;
   5.2.1 dbo.Family.BudgetValue - sum(dbo.Basket.Value), where dbo.Basket.Value purchases for the family passed to the procedure;
   5.2.2 When passing a non-existent dbo.Family.SurName, the user gets an error that there is no such family;
6. Create a trigger (output: file in the dbo.TR_Basket_insert_update repository in the Triggers branch).
6.1 If 2 or more records of the same ID_SKU are added to the dbo.Basket table at a time, the value in the DiscountValue field for this ID_SKU is calculated by the formula Value * 5%, otherwise DiscountValue = 0;

