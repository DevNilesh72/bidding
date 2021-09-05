alter proc sp_Payment(@aucid int)
as
begin
	update tbl_Aprove set paid = 1 where i_auction=@aucid;
end