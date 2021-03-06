USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserVerify]    Script Date: 13-04-2019 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_UserVerify](@user varchar(50),@pass varchar(50),@usertype varchar(50) output,@userId int output)
as
begin
	declare @type varchar(10)
	declare @flag int
	select @type = RIGHT(@user,5)

	if(@type = 'ADMIN')
	begin
		exec @flag = fn_verify @user,@pass,'tbl_Admin'
		if(@flag = 1)
		begin
			select @userId = i_autoid from tbl_adminmaster where username = @user
			set @usertype = @type
		end
	end
	else
	begin
		exec @flag = fn_verify @user,@pass,'tbl_Customer'
		if(@flag = 1)
		begin
			select @userId = userM.i_autoid,@usertype = userD.user_type
			from tbl_usermaster userM 
			join tbl_userdetails userD
			on userM.i_autoid = userD.ref_id
			where userD.email_id = @user
			and userM.password = @pass
		end
	end
end

declare @type1 varchar(50)
declare @id int
exec sp_UserVerify 'MasterADMIN','123',@type1,@id
print(@type1+','+@id)