USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_ForgotPassword]    Script Date: 18-04-2019 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_ForgotPassword](@username varchar(50),@Email varchar(50),@ques varchar(50) output,@ans varchar(50) output,@password varchar output)
as
begin
	declare @userid int;
	set @userid = 0;

	select @userid = M.i_autoid
	from tbl_usermaster M
	join tbl_userdetails D
	on M.i_autoid = D.ref_id
	where M.username=@username
	and D.email_id=@Email;

	if @userid != 0
		select @ques=question,@ans=ans,@password=password from tbl_usermaster where i_autoid=@userid;
	else
		select @ques='',@ans='',@password='';
end