<script type="text/javascript">
	var editTransportType;
	$(document).ready(function(){

		var transportTypeCommon = [];

		funViewData();
		$("#tmpId").val(0);

		function validator() {

			//var typeTitle	= $.trim($("#username").val());
			var typeTitle = $.trim($("#typeTitle").val());

			if (typeTitle == "") {
				$("#errorMessage").html("<strong>Warning!</strong> Please enter a valid type Title");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");
				return false;
			}
			else{
				return true;
			}
			
			}


		/* Submitting form to controller*/
		$("#btnTransportSave").click(function(event) {

			event.preventDefault();

			if (validator()) {

				var transportType = {};//json type for 2nd bracket

				transportType["tmpId"] = $.trim($("#tmpId").val());
				transportType["typeTitle"] = $.trim($("#typeTitle").val());

				//alert(JSON.stringify(transportType)); 

				//return false;
				$.ajax({ /*ajax request */
					type : "POST",
					url : "saveTransportType",
					data : JSON.stringify(transportType),
					contentType : "application/json; charset=utf-8",
					
					success : function(successData) {
						
						$("#successMessage").html(successData);
						$("#successMessage").removeClass("hidden");
						$("#errorMessage").addClass("hidden");
						
						funViewData();
						$("#tmpId").val(0);

					},
					error : function(error) {
						$("#errorMessage").html("<strong>Error!</strong> Record Not Saved");
						$("#errorMessage").removeClass("hidden");
						$("#successMessage").addClass("hidden");
						/*$("#submit").prop("disabled", false); */
						//alert(JSON.stringify(error));
						}
					});

				} // End of validation
			}); // End of form submission

						//Function for viewing existing data

			function funViewData() {
				$.post("viewAllTransportType",function(data) {

					var transportTypeData = '<table id="tblTransportType" class="table table-bordered table-hover">'+ '<thead><tr><th>ID</th><th>Transport Type</th><th style="width:13%;">Actions</th></tr></thead><tbody>';

						for ( var key in data) {

							var transportTypeObject = {"id":[],"typeTitle":[]};

							transportTypeObject["id"] = data[key].id;
							transportTypeObject["typeTitle"] = data[key].typeTitle;

							transportTypeCommon.push(transportTypeObject);/* id="btnUpdate_' + data[key].id + '" onclick="editTransportType(' + data[key].id + ')"  */

							transportTypeData += '<tr><td>'+ data[key].id + '</td><td>'+ data[key].typeTitle + '</td><td ><a href="#"><button class="btn btn-outline-danger btnn-action"><i class="far fa-fw fa-trash-alt"></i></button></a>&nbsp;&nbsp;<a href="#" id="btnUpdate_' + data[key].id + '" onclick="editTransportType(' + data[key].id + ')" ><button class="btn btn-outline-warning btnn-action"><i class="far fa-fw fa-edit"></i></button></a></td></tr>';
												
						}

						transportTypeData += '</tbody></table>';

						$("#divTransportType").html(transportTypeData);
						$("#tblTransportType").DataTable();
					});
			}

			//function delete




	editTransportType = function(transportTypeId){
		var data = transportTypeCommon.filter(object =>{
			return object.id === transportTypeId
		});

		$("#btnTransportSave").html("Update");

		$("#tmpId").val(data[0].id);
		$("#typeTitle").val(data[0].typeTitle);
	}

	/*===========================================*/
	/*window.setTimeout(function() {
    $("#successMessage").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
    }, 4000);*/
    /*==========================================*/

	}); //end of document ready function
					
</script>

<!-- End of J Query -->

<main class="content">
	<div class="container-fluid p-0">
	<div class="clearfix">
		<form class="form-inline float-right mt--1 d-none d-md-flex">
			<button id="btnAddNewTransport" class="btn btn-primary"><i data-feather="plus"></i>&nbsp;Add Transport Type</button>
		</form>
		<h1 class="h3 mb-3">Transport Type</h1>
	</div>	
	<div class="row">
		<div id="create-new-transport_type" class="col-12"><!--  col-md-6 -->
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Create New Transport Type</h5>
					<h6 class="card-subtitle text-muted">This table is for all Transport Type information</h6>
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
							
							<!-- Text input-->
							<div class="form-group">
				               <label class="col-md-4 control-label" for="typeTitle">Transport Type</label>
				               <div class="col-md-6">
					              <input id="typeTitle" name="typeTitle" placeholder="Enter Transport Type" class="form-control input-md" type="text">				
				               </div>
			                 </div>
					
							<!-- Button -->
							<div class="form-group">
				               <label class="col-md-4 control-label" for="btnTransportSave"></label>
				               <div class="col-md-4">
					              <button id="btnTransportSave" name="btnTransportSave" class="btn btn-primary">Save</button>
					              <button id="btnTransportReset" name="btnTransportReset" class="btn btn-warning" type="reset" value="reset">Reset</button>
				               </div>
			                </div>
					
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- //// -->
		<div id="existing-transport_type" class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Existing Transport Type</h5>
					<h6 class="card-subtitle text-muted">This table is for all Transport Type information</h6>
				</div>
				<div class="card-body">
					<div id="divTransportType" class="col-12"></div>
				</div>
			</div>
		</div>
		</div>
	</div>
</main>
