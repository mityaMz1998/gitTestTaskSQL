create trigger TR_Basket_insert_update
on Basket
after insert, update
as
select ir.ID into #TemporaryBasketWithIdentical from inserted as ir where ir.ID_SKU in
(select b.ID_SKU from inserted as b group by b.ID_SKU having count(b.ID_SKU) = 1)
select i.ID into #TemporaryBasketWithoutIdentical from inserted as i where i.ID_SKU in 
(select b.ID_SKU from inserted as b group by b.ID_SKU having count(b.ID_SKU) >= 2)
if (exists (select * from #TemporaryBasketWithIdentical))
	begin
		update Basket
		set Basket.DiscountValue = Basket.Value * 0.05
		where Basket.ID in (select ID from #TemporaryBasketWithIdentical)
	end
if (exists (select * from #TemporaryBasketWithoutIdentical)) 
	begin
		update Basket 
		set Basket.DiscountValue = 0
		where Basket.ID in (select ID from #TemporaryBasketWithoutIdentical)
	end
go
