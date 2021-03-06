USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertBid]    Script Date: 17-04-2019 16:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_insertBid](@auctionid int,@userid int)
as
begin
	begin try
		begin transaction
			declare @ref int;
			declare @amt int;

			select @amt = dbo.fn_currentValue(@auctionid);

			insert into tbl_bidmaster(i_auctionid) values (@auctionid);
			set @ref = SCOPE_IDENTITY();

			set @amt = @amt + @amt * 0.1;

			insert into tbl_biddetails(i_refid,i_userid,i_bidprice) values (@ref,@userid,@amt);
		Commit transaction
	end try
	begin catch
		Rollback transaction
	end catch
end