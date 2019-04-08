<script type="text/javascript">

	var allTransportType = [];
	
	$(document).ready(function(){
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        
        /* $("#create-new-requisition").hide();
        $("#existing-requisition" ).show(); */
        
        $( "#btnAddNewRequisition" ).click(function() {

        	$("#create-new-requisition").show();
            $("#existing-brands" ).hide();

        });
        

        getAllTransportType();
        funViewTransportRequisitionData();
/*
        $(function(){
			  $('#travelDate').datepicker({
				     dateFormat: "yy-mm-dd",
				     minDate:0,
     				 changeMonth: true,
     				 changeYear: true
    				});
			  });
*/

        $(function () {
            $('#travelDate').datetimepicker({
            	/*minDate:0,
                   format:'L'
*/
                   format: 'YYYY-MM-DD',
                   /*defaultDate: "11/1/2013",
                   disabledDates: [
                        moment("12/25/2013"),
                        new Date(2013, 11 - 1, 21),
                        "11/22/2013 00:53"
                    ]*/
                  

            });
         });
       
        
            // pickup data to combobox/selector from foreign table
			$.post("viewAllTransportType", function(data){
			//alert(JSON.stringify(data));
			var transportTypeComboBoxForTransportRequisition = '<select id="fkTransportType" class="custom-select">';
			
			for(var key in data)
			{
				transportTypeComboBoxForTransportRequisition += '<option value="' + data[key].id + '">' +data[key].typeTitle+ '</option>';
			}
			transportTypeComboBoxForTransportRequisition += '</select>';

			$("#divTransportRequisitionTransportType").html(transportTypeComboBoxForTransportRequisition);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});

		$.post("showAllUser", function(data){
			//alert(JSON.stringify(data));
			var fkRequestedByComboBox = '<select id="fkRequestedBy" class="form-control">';
			
			for(var key in data)
			{
				fkRequestedByComboBox += '<option value="' + data[key].id + '">' +data[key].userName+ '</option>';
			}
			fkRequestedByComboBox += '</select>';

			$("#divFkRequestedBy").html(fkRequestedByComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});

		$.post("showAllUser", function(data){
			//alert(JSON.stringify(data));
			var fkRequestedByComboBox = '<select id="fkApproveddBy" class="form-control">';
			
			for(var key in data)
			{
				fkRequestedByComboBox += '<option value="' + data[key].id + '">' +data[key].userName+ '</option>';
			}
			fkRequestedByComboBox += '</select>';

			$("#divFkApprovedBy").html(fkRequestedByComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});
		
		
		//validator
		function validator(){

            //var brandName	= $.trim($("#username").val());
			var brandName = $.trim($("#brandName").val());
		
            if(brandName == ""){
                $("#errorMessage").html("Please enter a valid Brand Name..."); 
                $("#errorMessage").removeClass("hidden");


                $("#successMessage").addClass("hidden");
                return false;
            } /* else if(){ // for multiple validation check
            	
            	
            }*/

            return true;
        }

        function validator(){

        	//var fkRequestedBy = $.trim($("#fkRequestedBy").val());
        	//var requestDate = $.trim($("#requestDate").val());
        	var travelDate = $.trim($("#travelDate").val());
        	alert(travelDate);
        	var fkTransportType = $.trim($("#fkTransportType").val());
        	var purpose = $.trim($("#purpose").val());
        	//var status = $.trim($("#status").val());
        	//var fkApproveddBy = $.trim($("#fkApproveddBy").val());
        	//var approveDate = $.trim($("#approveDate").val());
        	//var comment = $.trim($("#comment").val());

        	/* if(fkRequestedBy == ""){
                $("#errorMessage").html("Please enter a valid fkRequestedBy"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else */if(travelDate == ""){

            	$("#errorMessage").html("Please enter a valid travelDate"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else if(fkTransportType == ""){

            	$("#errorMessage").html("Please enter a valid fkTransportType"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else if(purpose == ""){

            	$("#errorMessage").html("Please enter a valid purpose"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }


            return true;


        }//end of validator

        //save to database

        $("#saveTransportRequisition").click(function(event) {

            event.preventDefault();

            if (validator()){

                var transportRequisition = {};

                //transportRequisition["fkRequestedBy"] = $.trim($("#fkRequestedBy").val());
                //var dateFormat = 
        		transportRequisition["travelDate"] = $.trim($("#travelDate").val());
        		transportRequisition["fkTransportType"] = $.trim($("#fkTransportType").val());
        		transportRequisition["purpose"] = $.trim($("#purpose").val());
        		//transportRequisition["status"] = $.trim("P");
        		//transportRequisition["fkApproveBy"] = $.trim($("#fkApproveddBy").val());

        		//transportRequisition["comment"] = $.trim($("#comment").val());

                //alert(JSON.stringify(transportRequisition)); 
                
                $.ajax({
                    type: "POST",
                    url: "saveTransportRequisition",
                    data: JSON.stringify(transportRequisition),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {

                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewTransportRequisitionData();
                       

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission
        
        
        
        //view The Database data
        function funViewTransportRequisitionData(){
        	
        	
        	
        	$.post("viewTransportRequisition",function(data){
        		
        		
        		//alert(JSON.stringify(data));
        		var transportRequisitionData = '<table id="tblTransportRequisition" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Travel Date</th><th>TransportType</th><th>Purpose</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){  
    				

    				//foreign key id to name  mapping
					var singleTransportType = allTransportType.filter(object => {

						return object.id === data[key].fkTransportType

						});//end of foreign key id to name  mapping

    				transportRequisitionData += '<tr><td>' + data[key].id + '</td><td>' + data[key].travelDate + '</td><td>' + singleTransportType[0].typeTitle + '</td><td>' + data[key].purpose +  '</td><td><a href="#" class="btn btn-sm btn-danger"><span data-feather="trash" class="feather feather-trash align-middle"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
    				    			
    			transportRequisitionData += '</tbody></table>';
    		
        		
        		$("#divTransportRequisition").html(transportRequisitionData);
        		$("#tblTransportRequisition").DataTable();
        		
        		
        		
        	});
        }

        $('#travelDate').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            /*locale: {
                format: 'DD/MM/YYYY'
            }*/
        });
        $('#travelDate1').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
        /*$('#travelTimeFrom').daterangepicker({
			datepicker:false,
            timePicker: true,
            opens: 'left',
            startDate: moment().startOf('hour'),
            endDate: moment().startOf('hour').add(32, 'hour'),
            locale: {
                format: 'M/DD hh:mm A'
            }
        });*/




	});

   function getAllTransportType(){
   	$.post("viewAllTransportType",function(data){

   		allTransportType = data;

   	});
   }

</script>

<main class="content">
	<div class="container-fluid p-0">
		<div class="clearfix">
			<form class="form-inline float-right mt--1 d-none d-md-flex">
				<button id="btnAddNewRequisition" class="btn btn-primary"><i data-feather="plus"></i>&nbsp;Add Requisition</button>
			</form>
			<h1 class="h3 mb-3">Transport Requisition</h1>
		</div>
		<div class="row">
		<div id="create-new-requisition" class="col-12"><!--  col-md-6 -->
			<div class="card">
			<div class="card-header">
				<h5 class="card-title">Create New Requisition</h5>
				<h6 class="card-subtitle text-muted">This table is for all brand information</h6>
			</div>
			<div class="card-body">
				<form>
					<fieldset>
				
						<!-- Form Name -->
						<!-- <legend>Create New Transport Requisition</legend> -->
						
						<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
						<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>
						
						<label>ek e field a date-time use kora jai kina</label>
						
						<div style="margin: 0 0 1.5% 0 ;" class="form-row"> <!-- custom-controls-stacked -->
							<label style="margin: 0 3.5% 0 0;" class="control-label" for="travellerType">Traveller Type:</label>
							
							<label style="margin-right:3.5%;" class="form-check form-check-inline custom-radio">
					            <input class="form-check-input input-md" type="radio" name="inline-radios-example" value="option1">
					            <span class="form-check-label">Local</span>
					        </label>
					        <label class="form-check form-check-inline">
					            <input class="form-check-input input-md" type="radio" name="inline-radios-example" value="option1">
					            <span class="form-check-label">Foreigner</span>
					        </label>
										
						</div>
				
						<!-- Text input-->
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="travelDate">Travel Starting Date</label>
								<input id="travelDate" name="travelDate" placeholder="Travel Date" class="form-control input-md" type="text">
							</div>
					
							<!-- Select Basic -->
							<div class="form-group col-md-6">
								<label for="travelDate">Travel Ending Date(Optional)</label>
								<input id="travelDate1" name="travelDate1" placeholder="Travel Date" class="form-control input-md" type="text">
							</div>
						</div>
						
						<!-- Select Basic -->
							<div class="form-group">
								<label for="fkTransportType">Transport Type</label>
								<div id="divTransportRequisitionTransportType"></div>
							</div>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="travelTimeFrom">Travel Time From</label>
								<input id="travelTimeFrom" name="travelTimeFrom" placeholder="Time From" class="form-control input-md" type="text">
							</div>
							<div class="form-group col-md-6">
								<label for="travelTimeTo">Travel Time To</label>
								<input id="travelTimeTo" name="travelTimeTo" placeholder="Time To" class="form-control input-md" type="text">
							</div>
							
						</div>
						
						
						
						
						
				
						<!-- Textarea -->
						<div class="form-group">
							<label for="purpose">Purpose</label>
							<textarea class="form-control input-md" id="purpose" name="purpose"></textarea>
						</div>
				
						<!-- Button (Double) -->
						<div class="form-group">
								<button id="saveTransportRequisition" name="saveTransportRequisition" class="btn btn-primary">Save</button>
								<button id="resetTransportRequisition" name="resetTransportRequisition" class="btn btn-warning" type="Reset" value="Reset">Reset</button>
						</div>
						
				
					</fieldset>
				</form>
				</div>
		</div>
		</div>
		</div>
</div>
</main>
<main class="content">
	<div class="container-fluid p-0">	
		<div class="row">
			<div id="existing-requisition" class="col-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">Existing Requisition</h5>
						<h6 class="card-subtitle text-muted">This table is for all requisition information</h6>
					</div>
					<div class="card-body">
						<div id="divTransportRequisition"></div>
					</div>
				</div>
			</div>
		</div>
   </div>
</main>
<!-- <div class="col-md-12">
	<legend>Existing Requisition</legend>
	<div id="divTransportRequisition"></div>
</div> -->