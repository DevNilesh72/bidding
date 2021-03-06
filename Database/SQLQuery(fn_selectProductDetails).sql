USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_selectProductDetails]    Script Date: 15-04-2019 20:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_selectProductDetails](@aucid int)
returns table
as
	return 
		select A.i_autoid as auctionid,I.itemname as pname, I.itemimage as pimage, T.typename as ptype, A.Description as description, A.Starting_amount as baseamt, A.Starting_date as startdate,A.Ending_date as enddate,currentValue = dbo.fn_currentValue(@aucid),isAproved = dbo.fn_isAproved(@aucid),A.user_id as Hostby,isPaid = (select paid from tbl_Aprove where i_auction = @aucid)
		from tbl_itemdetailsmaster I
		join tbl_typemaster T
		on I.i_refid = T.i_autoid
		join tbl_auctionmaster A
		on I.i_autoid = A.item_id
		where A.i_autoid = @aucid
		
		

--select * from dbo.fn_selectProductDetails(1)