USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_selectProducts]    Script Date: 14-04-2019 21:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_selectProducts](@val int)
returns @Prodtable table (Aucid int,Pname varchar(50),Pimage varchar(50),Pprice int,Ptype varchar(50),Hostby int)
as
begin
	if (@val = -1)
	begin
		insert into @Prodtable 
		select		A.i_autoid as Aucid, P.itemname as Pname, P.itemimage as Pimage, A.Starting_amount as Pprice, T.typename as Ptype,A.user_id as Hostby
		from		tbl_itemdetailsmaster P
		join		tbl_typemaster T
		on			P.i_refid = T.i_autoid
		left join	tbl_auctionmaster A
		on			P.i_autoid = A.item_id
		where		DATEDIFF(DAY,A.Ending_date,GETDATE()) >= 0
	end
	else if(@val = 0)
	begin
		insert into @Prodtable 
		select		A.i_autoid as Aucid, P.itemname as Pname, P.itemimage as Pimage, A.Starting_amount as Pprice, T.typename as Ptype,A.user_id as Hostby
		from		tbl_itemdetailsmaster P
		join		tbl_typemaster T
		on			P.i_refid = T.i_autoid
		left join	tbl_auctionmaster A
		on			P.i_autoid = A.item_id
		where		DATEDIFF(DAY,A.Starting_date,GETDATE()) > 0
		and			DATEDIFF(DAY,A.Ending_date,GETDATE()) < 0
	end
	else
	begin
		insert into @Prodtable 
		select		A.i_autoid as Aucid, P.itemname as Pname, P.itemimage as Pimage, A.Starting_amount as Pprice, T.typename as Ptype,A.user_id as Hostby
		from		tbl_itemdetailsmaster P
		join		tbl_typemaster T
		on			P.i_refid = T.i_autoid
		left join	tbl_auctionmaster A
		on			P.i_autoid = A.item_id
		where		DATEDIFF(DAY,A.Starting_date,GETDATE()) <= 0
	end
	return
end

--select * from dbo.fn_selectProducts(0)