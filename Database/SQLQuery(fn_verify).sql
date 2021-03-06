USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_verify]    Script Date: 13-04-2019 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_verify](@email varchar(50), @pass varchar(50),@table varchar(50))
returns int
as
begin
	declare @flag int;
	set @flag = 0
	if (@table = 'tbl_Admin')
	begin
		select @flag = 1
		from tbl_adminmaster
		where username = @email
		and password = @pass
	end
	else
	begin
		select @flag = 1
		from tbl_usermaster userM 
		join tbl_userdetails userD
		on userM.i_autoid = userD.ref_id
		where userD.email_id = @email
		and userM.password = @pass
	end
	return @flag
end