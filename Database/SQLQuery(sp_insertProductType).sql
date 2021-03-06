USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertProductType]    Script Date: 13-04-2019 21:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_insertProductType](@name varchar(50), @imgfile varchar(50))
as
begin
	declare @flag int;

	set @flag = 0;
	
	select @flag = 1 from tbl_typemaster where typename = @name;

	if (@flag = 0)
	begin
		insert into tbl_typemaster(typename,typeimage)
		values (@name,@imgfile);
	end
end

exec sp_insertProductType 'ELECTRONICS','ELECTRONICS.jpg'

select * from tbl_typemaster

select 1 from tbl_typemaster