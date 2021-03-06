USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TotalBids]    Script Date: 17-04-2019 14:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_TotalBids](@auctionid int)
returns table
as
return	select i_auctionid as id ,COUNT(i_autoid) as bidcount
		from tbl_bidmaster
		where i_auctionid = @auctionid
		group by i_auctionid

declare @amt int
select @amt = 1 from dbo.fn_TotalBids(1) where bidcount > 1
print(@amt)