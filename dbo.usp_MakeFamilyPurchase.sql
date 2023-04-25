create procedure usp_MakeFamilyPurchase
@FamilySurName varchar(255)
as
begin
	if @FamilySurName = (select f.SurName from Family as f where f.SurName = @FamilySurName)
		update Family
		set Family.BudjetValue = Family.BudjetValue - 
		(select sum(b.Value) from Basket as b inner join Family as f on (f.ID = b.ID_Family)
		where f.SurName = @FamilySurName)
		where Family.SurName = @FamilySurName
	else
		print 'Ошибка! Такой семьи нет.'
end