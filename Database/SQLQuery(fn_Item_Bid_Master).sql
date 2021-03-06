USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Item_Bid_Master]    Script Date: 17-04-2019 12:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_Item_Bid_Master](@aucid int)
returns table
as
return
	select		A.item_id as Pid,BD.i_userid as Userid,BD.i_bidprice as Bidprice,BD.createdate as Bidon,BD.i_autoid as BidId
	from		tbl_auctionmaster A
	join		tbl_bidmaster BM
	on			A.i_autoid = BM.i_auctionid
	join		tbl_biddetails BD
	on			BM.i_autoid = BD.i_refid
	where		A.i_autoid = @aucid