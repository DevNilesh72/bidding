USE [AuctionOfAssets]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_selectCategory]    Script Date: 14-04-2019 14:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_selectCategory]()
returns table
as
	return (select i_autoid as id,typename as name,typeimage as imgfile from tbl_typemaster)

select * from dbo.fn_selectCategory()