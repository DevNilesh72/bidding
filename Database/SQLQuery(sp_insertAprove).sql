USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAprove]    Script Date: 18-04-2019 22:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_insertAprove](@auctid int,@userid int,@bidid int)
as
begin
	declare @flag int;
	set @flag = 0;

	select @flag=1 from tbl_Aprove where i_auction = @auctid;

	if (@flag=0)
	begin
		insert into tbl_Aprove(i_auction,i_bid,i_user) values (@auctid,@bidid,@userid);

		update tbl_auctionmaster set Ending_date = GETDATE() where i_autoid = @auctid;
	end
end