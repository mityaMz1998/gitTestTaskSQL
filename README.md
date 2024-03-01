6. Create a trigger (output: file in the dbo.TR_Basket_insert_update repository in the Triggers branch).
6.1 If 2 or more records of the same ID_SKU are added to the dbo.Basket table at a time, the value in the DiscountValue field for this ID_SKU is calculated by the formula Value * 5%, otherwise DiscountValue = 0;
