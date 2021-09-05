USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Item_Bid_Details]    Script Date: 17-04-2019 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_Item_Bid_Details](@aucid int)
returns table
as
return
	select	BM.Userid as userid,UM.username as username,BM.Bidprice as Bidprice,BM.Bidon as Biddate,BM.bidId as BidId
	from	dbo.fn_Item_Bid_Master(@aucid) BM
	join	tbl_usermaster UM
	on		UM.i_autoid = BM.Userid