use dbTest

create function udf_GetSKUPrice(@ID_SKU int)
	returns decimal(18,2)
	as
	begin
		declare @getSKUprice dec (18, 2)
		select @getSKUprice = (b.Value / b.Quantity)
		from Basket as b
		where ID_SKU = @ID_SKU
		return @getSKUprice
	end

select udf_GetSKUPrice(1) from Basket