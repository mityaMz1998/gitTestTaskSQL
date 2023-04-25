create function udf_GetSKUPrice(@ID_SKU int)
	returns decimal(18,2)
	as
	begin
		declare @getSKUprice dec (18, 2)
		select @getSKUprice = (sum(b.Value * 1.0) / sum(b.Quantity))
		from Basket as b
		where b.ID_SKU = @ID_SKU
		return @getSKUprice
	end