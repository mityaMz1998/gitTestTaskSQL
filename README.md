3. Create a function (output: file in the repository dbo.udf_GetSKUPrice.sql in the Functions branch).
3.1 Input parameter @ID_SKU;
3.2 Calculates the price of the transferred product from the table dbo.Basket using the formula;
   3.1.1 sum Value on transferred SKU / sum Quantity on transferred SKU;
3.3 Output value of type decimal(18, 2);
