USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_currentValue]    Script Date: 17-04-2019 17:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_currentValue](@auctionid int)
returns int
as
begin
	declare @amt int;
	declare @flag int;

	set @flag = 0;

	select @flag = 1 from dbo.fn_TotalBids(@auctionid) where bidcount > 1;

	if @flag = 1
		select @amt = i_bidprice from tbl_biddetails where i_refid = (select MAX(i_autoid) from tbl_bidmaster where i_auctionid = @auctionid);
	else
		select @amt = Starting_amount from tbl_auctionmaster where i_autoid = @auctionid;

	return @amt;
end

declare @amt int
select i_bidprice from tbl_biddetails where i_refid = (select MAX(i_autoid)-1 from tbl_bidmaster where i_auctionid = 1);
print(@amt)