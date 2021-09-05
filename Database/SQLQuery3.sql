create function fn_isAproved(@auctionid int)
returns int
as
begin
	declare @flag int;
	set @flag = 0;
	select @flag = 1 from tbl_Aprove where i_auction=@auctionid;
	return @flag; 
end