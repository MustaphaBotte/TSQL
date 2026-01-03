alter procedure FetchCars 
@PageNumber int ,@RowPerPage int ,@LastIdInLastPage int as
begin
select * from VehicleDetails where ID>@LastIdInLastPage order by VehicleDetails.ID
OFFSET (@PageNumber*@RowPerPage) rows 
fetch next @RowPerPage rows only
end




