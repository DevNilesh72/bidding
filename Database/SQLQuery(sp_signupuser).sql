USE [AuctionOfAssets]
GO
/****** Object:  StoredProcedure [dbo].[sp_signupuser]    Script Date: 13-04-2019 16:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_signupuser]
(@username varchar(50), @password varchar(50),@usertype varchar(50),@address varchar(50),@mobile bigint,@email varchar(50),@bank varchar(50),@account varchar(50),@ques varchar(50), @ans varchar(50),@result varchar(100) output)
as
begin
declare @ref int
declare @useremail varchar(50)
	
	select @useremail = email_id from tbl_userdetails where email_id = @email;

	if (@useremail is null) 
	begin
		insert into tbl_usermaster(username,password,question,ans) values (@username,@password,@ques,@ans);
		
		set @ref = SCOPE_IDENTITY();

		insert into tbl_userdetails(ref_id,user_type,address,mobile_no,email_id,account_no,bankname) values (@ref,@usertype,@address,@mobile,@email,@account,@bank);
		
		select @result = 'User Registered Successfully!!!';
	end
	else
		select @result = 'Already Registered';
end

declare @result1 varchar(10)
exec sp_signupuser 'Darshan Kashyap','123','Customer','Ghatkoper, Mumbai',0987654321,'dar1@gmail.com','DGB','364754635243546','What is my degree college name?','radav',@result1 output
select @result1