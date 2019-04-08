<<script type="text/javascript">
 
 
$.post("viewAllBrands", function(data){
	
	var scheduleInfo = '<table id="tblscheduleInfo" class="table table-hover">' +
    '<thead><tr><th>Departure Time</th></tr></thead><tbody>';
    
    for(var key in data){
    	scheduleInfo = '<tr><td>'+data[key].id+'</td><td>'+data[key].brandName'</td></tr>'
    }
    scheduleInfo += '</tbody></table>';
    
    $("#divfkTrnsportId").html(scheduleInfo);
	$("#tblscheduleInfo").DataTable();
	
});
</script>


<main class="content">
	<div class="container-fluid p-0">
	<div class="clearfix">
		<form class="form-inline float-right mt--1 d-none d-md-flex">
			<button id="btnAddNewScheduleTravelInfo" class="btn btn-primary"><i data-feather="plus"></i>&nbsp;Add Schedule Travel Info</button>
		</form>
		<h1 class="h3 mb-3">Schedule Travel Information</h1>
	</div>	
	<div class="row">
		<div id="create-new-schedule-travel-information" class="col-12"><!--  col-md-6 -->
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Create New Schedule Travel Information</h5>
					<h6 class="card-subtitle text-muted">This table is for all schedule travel information information</h6>
				</div>
				<div class="card-body">
					<form class="form-horizontal">
						<fieldset>				
							<!-- Form Name -->
							<!-- <legend>Create New Brands</legend> -->
					        
							<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
							<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>
							
							<!-- for edit update-->
							<input type="text" class="d-none"  id="tmpId" name="tmpId" value="0" readonly="readonly">
							
							<!-- Select Basic -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="transportType">Transport Type</label>
									<div id="divTransportType"></div>
									 
								</div>
								<div class="form-group col-md-6">
									<label for="fkTrnsportId">Transport Name</label>
									<div id="divfkTrnsportId">
										 <select class="form-control"></select> 
									</div>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="fkScheduleId">Schedule</label>
									<div id="divfkScheduleId">
										<!-- <select class="form-control"></select>  -->
									</div>
								</div>
								<div class="form-group col-md-6">
									<label for="fkDriverId">Driver</label>
									<div id="divfkDriverId"></div>
									 
								</div>
							</div>
							 

							<div class="form-row">
		                            <!-- Text input-->
		                       <div class="form-group col-md-4">
			                       <label for="travelDate">Travel Date</label>
			                           <input id="travelDate" name="travelDate" placeholder="Enetr Travel Date" class="form-control input-md"type="text">
		                       </div>

		                             <!-- Text input-->
		                       <div class="form-group col-md-4">
			                       <label for="actualDepartureTime">Departure Time</label>
				                       <input id="actualDepartureTime" name="actualDepartureTime" placeholder="Actual Departure Time" class="form-control input-md"type="text">
		                       </div>

		                       <div class="form-group col-md-4">
			                       <label for="actualReachedTime">Arrival/Driver Check In Time</label>
				                       <input id="actualReachedTime" name="actualReachedTime" placeholder="Actual Reached Time" class="form-control input-md" type="text">
		                       </div>
		                     </div>
		
		                     <div class="form-row">
		                               <!-- Text input-->
		                        <div class="form-group col-md-12">
			                         <label for="sheduledTravelInformationComment">Comment</label>
				                         <textarea class="form-control" id="sheduledTravelInformationComment" name=sheduledTravelInformationComment"></textarea>
		                        </div>
		                      </div>
					
							<!-- Button -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="btnSave"></label>
								<div class="form-group col-md-12">
			                         <button id="saveSheduledTravelInformation" name="saveSheduledTravelInformation" class="btn btn-success">Save</button>
			                         <button id="resetSheduledTravelInformation" name="resetSheduledTravelInformation" class="btn btn-warning" type="reset" value="reset" >Reset</button>
		                        </div>
							</div>
					
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- //// -->
		<div id="existing-schedule-travel-info" class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Existing Schedule Travel Information</h5>
					<h6 class="card-subtitle text-muted">This table is for all schedule travel information information</h6>
				</div>
				<div class="card-body">
					<div id="divScheduleTravelInfo" class="col-12"></div>
				</div>
			</div>
		</div>
		</div>
	</div>
</main>