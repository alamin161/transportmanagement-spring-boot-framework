<script type="text/javascript">
	var allDriver = [];
	var allTransportInformation = [];
	var allTransportType = [];

	function getAllTransportInformation(){
		$.get("viewAllTransportInformation",function(data){
			allTransportInformation = data;
		});
	}

	 function getAllTransportType(){
    $.post("viewAllTransportType",function(data){

        allTransportType = data;
    });
   }
	 
	 var populateDataForUpdate;

	$(document).ready(function(){
		
		var scheduleTravelInformationCommon = [];
		

		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");

        getAllDriver();
        getAllTransportType();
        getAllTransportInformation();


        funViewScheduledTravelInformation();


        //for get time,from location,to location from another form
         /* $.post("viewAllBrands", function(data){
        	
        	var scheduleInfo = '<table id="tblscheduleInfo" class="table table-hover">' +
            '<thead><tr><th>Departure Time</th></tr></thead><tbody>';
            
            for(var key in data){
            	scheduleInfo = '<tr><td>'+data[key].id+'</td><td>'+data[key].brandName'</td></tr>'
            }
            scheduleInfo += '</tbody></table>';
            
            $("#divfkTrnsportId").html(scheduleInfo);
    		$("#tblscheduleInfo").DataTable();
        	
        }); */ 

		//for get data from database to combo box Start
		//strat
		$.post("viewAllTransportType", function(data){
			//alert(JSON.stringify(data));
			var transportTypeComboBox = '<select id="fkTransportType" class="form-control">';
			
			for(var key in data)
			{
				transportTypeComboBox += '<option value="' + data[key].id + '">' +data[key].typeTitle+ '</option>';
			}
			transportTypeComboBox += '</select>';

			$("#divTransportType").html(transportTypeComboBox);
	
			$( "#fkTransportType" ).change(function() {
					viewTransportName( $(this).val() );
					}); 
			
		});//for get data from database to combo box end

		function viewTransportName(transportTypeId){//brandId
		
			$.post("viewTransportInformationByFkTransportType",{transportTypeId: transportTypeId}, function(data){
				//alert(JSON.stringify(data));
				var fkTrnsportId = '<select id="fkTrnsportId" class="form-control">';
				for(var key in data)
				{
					fkTrnsportId += '<option value="' + data[key].id + '">' +data[key].transportName+'</option>';
				}
				fkTrnsportId += '</select>';

				$("#divfkTrnsportId").html(fkTrnsportId);
				
				$("#fkTrnsportId").change(function() {
					viewTransportSchedule($(this).val());
				});

			});
		}

		//for get data from database to combo box Start
		//strat

		function viewTransportSchedule(transportId){

		$.post("viewTransportScheduleByFkTransportId",{transportId: transportId}, function(data){
			//alert(JSON.stringify(data));
			var transportScheduleComboBox = '<select id="fkScheduleId" class="form-control">';
			
			for(var key in data)
			{
				transportScheduleComboBox += '<option value="' + data[key].id + '">' + data[key].fkTransportId + " , " + data[key].fkFromLocation+ " , " + data[key].fkToLocation+ " , " + data[key].departureTime + '</option>';
			}
			transportScheduleComboBox += '</select>';

			$("#divfkScheduleId").html(transportScheduleComboBox);
			
			
		});//for get data from database to combo box end

		}

		function getAllDriver(){

		$.post("viewAllDriver", function(data){

			allDriver = data;
			//alert(JSON.stringify(data));
			var fkDriverId = '<select id="fkDriverId" class="form-control">';
			for(var key in data)
			{
				fkDriverId += '<option value="' + data[key].id + '">' +data[key].driverName+" &nbsp;&nbsp; |&nbsp;&nbsp;  "+data[key].driverCode+ '</option>';
			}
			fkDriverId += '</select>';

			$("#divfkDriverId").html(fkDriverId);
			//alert(JSON.stringify(brandmodelComboBox));
		});

		}
		//travel date/time taker
		 $(function () {
            $('#travelDate').datetimepicker({
                   /*format:'L'*/
                   format: 'YYYY-MM-DD'
            });
         });
         $(function () {
            $('#actualDepartureTime').datetimepicker({
                   format:'LT'
            });
         });
         $(function () {
            $('#actualReachedTime').datetimepicker({
                   format:'LT'
            });
         });
         //travel date/time taker

         function validator(){
         	var fkTrnsportId = $.trim($("#fkTrnsportId").val());
         	var fkScheduleId = $.trim($("#fkScheduleId").val());
         	var fkDriverId = $.trim($("#fkDriverId").val());
         	var travelDate = $.trim($("#travelDate").val());
         	var actualDepartureTime = $.trim($("#fkTrnsportId").val());
         	var actualReachedTime = $.trim($("#actualReachedTime").val());
         	var comments = $.trim($("#sheduledTravelInformationComment").val());

         	if(fkTrnsportId == ""){
                $("#errorMessage").html("Please enter a valid fkTrnsportId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            if(fkScheduleId == ""){
                $("#errorMessage").html("Please enter a valid fkScheduleId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(fkDriverId == ""){
                $("#errorMessage").html("Please enter a valid fkDriverId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(travelDate == ""){
                $("#errorMessage").html("Please enter a valid travelDate"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(actualDepartureTime == ""){
                $("#errorMessage").html("Please enter a valid actualDepartureTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(actualReachedTime == ""){
                $("#errorMessage").html("Please enter a valid actualReachedTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(comments == ""){
                $("#errorMessage").html("Please enter a valid comments"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else{return true;}


         }
         //end of validation

         $("#saveSheduledTravelInformation").click(function(event){

         	event.preventDefault();

         	if (validator()) {
         		var scheduledTravelInfo = {};

         		scheduledTravelInfo["fkTrnsportId"] = $.trim($("#fkTrnsportId").val());
         		scheduledTravelInfo["fkScheduleId"] = $.trim($("#fkScheduleId").val());
         		scheduledTravelInfo["fkDriverId"] = $.trim($("#fkDriverId").val());
         		scheduledTravelInfo["travelDate"] = $.trim($("#travelDate").val());
         		scheduledTravelInfo["departureTime"] = timeFormat12to24($.trim($("#actualDepartureTime").val()));
         		scheduledTravelInfo["arrivalTime"] = timeFormat12to24($.trim($("#actualReachedTime").val()));
         		scheduledTravelInfo["comments"] = $.trim($("#sheduledTravelInformationComment").val());

         		 $.ajax({
                    type: "POST",
                    url: "saveScheduledTravelInfo",
                    data: JSON.stringify(scheduledTravelInfo),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        funViewScheduledTravelInformation();

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        alert(JSON.stringify(error));
                    }
                });

         	}

         });
         //end of form submission


         function funViewScheduledTravelInformation(){
         
         	$.post("viewAllScheduledInfo",function(data){

         		var scheduledInfoData = '<table id="tblScheduledInfo" class="table table-bordered table-hover">' +
    			                    '<thead><tr"><th>Transport Type</th><th>Transport Name</th><th>Schedule</th><th>Driver</th><th>Travel Date</th><th>Departure Time</th><th>Arrival Time</th><th style="width:20%;">Actions</th></tr></thead><tbody>';

    			for(var key in data){
    				
    				var scheduleTravelInformationObject = {"id":[],"fkTrnsportId":[],"fkScheduleId":[],"fkDriverId":[],"travelDate":[],"departureTime":[],"arrivalTime":[],"comments":[]};

    				var oneTransportInfo = allTransportInformation.filter(object => {
    					return object.id === data[key].fkTrnsportId

    				});
    				//alert("One transportInfo: " + JSON.stringify(oneTransportInfo));

    				
    				//id to name mapping
    				var singleTransportType2 = allTransportType.filter(object => {

                        return object.id === oneTransportInfo[0].fkTransportType

                    });

    				var singleDriver = allDriver.filter(object =>{
    					return object.id === data[key].fkDriverId
    				});

    				fkTransportName = allTransportInformation.filter(object =>{
    					return object.id === data[key].fkTrnsportId
    				});

    				var travelDateFormat = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].travelDate));
    				
    				scheduleTravelInformationObject["id"] = data[key].id;
    				scheduleTravelInformationObject["fkTrnsportId"] = data[key].fkTrnsportId;
    				scheduleTravelInformationObject["fkScheduleId"] = data[key].fkScheduleId;
    				scheduleTravelInformationObject["fkDriverId"] = data[key].fkDriverId;
    				scheduleTravelInformationObject["travelDate"] = data[key].travelDate;
    				scheduleTravelInformationObject["departureTime"] = data[key].departureTime;
    				scheduleTravelInformationObject["arrivalTime"] = data[key].arrivalTime;
    				scheduleTravelInformationObject["comments"] = data[key].comments;
    				
    				scheduleTravelInformationCommon.push(scheduleTravelInformationObject);

    				scheduledInfoData += '<tr><td>' + singleTransportType2[0].typeTitle + '</td><td>' + fkTransportName[0].transportName +'</td><td>' + data[key].fkScheduleId +'</td><td>' + singleDriver[0].driverName +'</td><td>' + travelDateFormat +'</td><td>' + timeFormat24to12(data[key].departureTime) +'</td><td>' + timeFormat24to12(data[key].arrivalTime) + '</td><td ><a href="#"><button class="btn btn-outline-danger btnn-action"><i class="far fa-fw fa-trash-alt"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-outline-warning btnn-action"><i class="far fa-fw fa-edit"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-outline-success btnn-action"><i class="far fa-fw fa-eye"></i></button></a></td></tr>';

    			}

    			scheduledInfoData += '</tbody></table>';
    		
        		
        		$("#divScheduleTravelInfo").html(scheduledInfoData);
        		$("#tblScheduledInfo").DataTable();

         	});       	

         }
         
         populateDataForUpdate = function(driverId){
         	
         	$("#divShowDriverInformation").hide();
         	$("#divAddDiverInformation").show();
             
    		
 	   		var data = driverInformationCommon.filter(obj => {
 	   		  return obj.id === driverId
 	   		});
 	   		
             //alert(JSON.stringify(data));
 	   		var dateFormat3 = $.datepicker.formatDate('yy-mm-dd', new Date(data[0].licenseExpireDate));
 	   		//alert(data[0].id + ": name= "+ data[0].driverName);

            // alert(dateFormat3);

             $("#saveDriver").html("Update");
 	   		
 	   		//$("#driverName").val(data[1].driverName);
             $("#tmpId").val(data[0].id);
 	   		$("#driverName").val(data[0].driverName);
 	   		$("#driverCode").val(data[0].driverCode);
 	   		$("#driverDateOfBirth").val(data[0].driverDateOfBirth);
 	   		$("#driverNid").val(data[0].driverNid);
 	   		$("#drivingLicense").val(data[0].drivingLicense);
 	   		///$("#licenseExpireDate").val(data[0].licenseExpireDate);
             $("#licenseExpireDate").val(dateFormat3);
 	   		$("#driverContact").val(data[0].driverContactNO);
 	   		$("#driverEmail").val(data[0].driverEmail);
 	   		$("#driverPhoto").val(data[0].driverPhoto);
 	   		$("#presentAddress").val(data[0].presentAddress);
 	   		$("#parmanentAddress").val(data[0].parmanentAddress);
 	   		//$("#sdfdsf").val(data[0].driverName);		   		
    		}    
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
										<select class="form-control"></select>
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