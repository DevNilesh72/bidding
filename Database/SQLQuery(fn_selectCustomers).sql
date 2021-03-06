USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_selectCustomers]    Script Date: 17-04-2019 21:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_selectCustomers]()
returns table
as
return
	select D.i_autoid as id,M.username as username,D.email_id as email,D.mobile_no as phone,D.address as address,D.user_type as type,D.bankname as bank,D.account_no as acc
	from tbl_usermaster M
	join tbl_userdetails D
	on M.i_autoid = D.ref_id