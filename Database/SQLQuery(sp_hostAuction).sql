USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_hostAuction]    Script Date: 14-04-2019 15:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_hostAuction]
(@itemname varchar(50),@itemimage varchar(50),@itemtype int,@amt int,@startdate datetime,@enddate datetime,@desc varchar(100),@userid int,@usertype varchar(10))
as
begin
	declare @pid int

	insert into tbl_itemdetailsmaster(itemname,itemimage,i_refid) values (@itemname,@itemimage,@itemtype)

	set @pid = SCOPE_IDENTITY()

	insert into tbl_auctionmaster(item_id,user_id,usertype,Starting_amount,Starting_date,Ending_date,Description) 
	values (@pid,@userid,@usertype,@amt,@startdate,@enddate,@desc)

end