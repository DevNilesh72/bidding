USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_isAproved]    Script Date: 19-04-2019 08:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_isAproved](@auctionid int)
returns int
as
begin
	declare @flag int;
	set @flag = 0;
	select @flag = 1 from tbl_Aprove where i_auction=@auctionid;
	return @flag; 
end