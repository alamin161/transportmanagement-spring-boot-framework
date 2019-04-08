<script type="text/javascript">

	$(document).ready(function(){
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        
       /*  $("#create-new-brands").hide();
        $("#existing-brands" ).show(); */
        /* $("#create-new-brands").addClass("hidden");
        //$("#existing-brands").addClass("hidden"); */
       
		

		funViewData();
		$("#tmpId").val(0);
		
		
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



        /* Submitting form to controller*/
        $("#btnSave").click(function(event) {

            event.preventDefault();

            if (validator()){

                var brands = {};

                brands["brandName"] = $.trim($("#brandName").val());
                brands["tmpId"] = $.trim($("#tmpId").val());//for update data
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveBrands",
                    data: JSON.stringify(brands),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewData();
                        $("#tmpId").val(0);
                        $("#btnSave").html('Save Data');
                        $("#btnDelete").addClass("hidden");

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        /*$("#submit").prop("disabled", false); */
                       alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission
        
        
        //Function for viewing existing data
        
        function funViewData(){
        	
        	$.post("viewAllBrands",function(data){
                /*table-bordered*/
                var brandsData = '<table id="tblBrand" class="table table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Brand Name</th><th style="width:17%">Actions</th></tr></thead><tbody>';
        		/*var brandsData = '<table id="tblBrand" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Brand Name</th><th></th><th></th><th></th></tr></thead><tbody>';*/
    			                    
    			for(var key in data){

                   /* brandsData += '<tr><td>' + data[key].id + '</td><td>' + data[key].brandName + '</td><td class="table-action"><a href="#"><i class="align-middle" data-feather="edit-2"></i></a><a href="#"><i class="align-middle" data-feather="trash"></i></a></td></tr>';*/
    				brandsData += '<tr><td>' + data[key].id + '</td><td>' + data[key].brandName + '</td><td ><a href="#"><button class="btn btn-outline-danger btnn-action"><i class="far fa-fw fa-trash-alt"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-outline-warning btnn-action"><i class="far fa-fw fa-edit"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-outline-success btnn-action"><i class="far fa-fw fa-eye"></i></button></a></td></tr>';
                    /*brandsData += '<tr><td>' + data[key].id + '</td><td>' + data[key].brandName + '</td><td style="float: none;"><a href="#"><button class="btn btn-danger"><i class="far fa-fw fa-trash-alt"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-warning"><i class="far fa-fw fa-edit"></i></button></a>&nbsp;&nbsp;<a href="#"><button class="btn btn-success"><i class="far fa-fw fa-eye"></i></button></a></td></tr>';*/
    				/*brandsData += '<tr><td>' + data[key].id + '</td><td>' + data[key].brandName + '</td><td><a href="#"><button class="btn btn-danger"><i class="far fa-fw fa-trash-alt"></i> Delete</button></a></td><td><a href="#"><button class="btn btn-warning"><i class="far fa-fw fa-edit"></i> Success</button></a></td><td><a href="#"><button class="btn btn-success"><i class="far fa-fw fa-eye"></i> Success</button></a></td></tr>';*/
    			}                 
						    			
    			brandsData += '</tbody></table>';
    		
        		
        		$("#divBrands").html(brandsData);
        		$("#tblBrand").DataTable();
        		
        		//updating data start
        		
					$('#tblBrand tbody').on('dblclick', 'tr', function () {
        			
        			var tableData = $(this).children("td").map(function() {
    			        return $(this).html();    			        
    			    }).get();
        			
        			 
        			 //$("#btnSave").prop('value', 'Update Data');
        			 $("#btnSave").html("Update");
        			 $("#btnDelete").removeClass("hidden");
        			        			
        			 $("#tmpId").val(tableData[0]);
        			 $("#brandName").val(tableData[1]);
        			
        		});	//updating data end
        		
        		
        	});
        }
        
        
        
    //show not show function
    $( "#btnAddNewBrand" ).click(function() {

    	$("#create-new-brands").show();
        $("#existing-brands" ).hide();

    });
	
	}); //end of document ready function 
	
	function funDeleteBrands(){
		
		 var r = confirm("Are you sure you want to delete this?");
   	    if (r == true) {

                   
   	    	   
	        	$.post("delete-brand", {id: $("#tmpId").val()}, function(data){
	        		$("#successMessage").html(data);
                     funViewData();
	        		 
	        	}); 
	        	
	        	
	        	
   	    } else {
   	    	return false;
   	    }
   	
	}
	
</script>


<main class="content">
	<div class="container-fluid p-0">
	<div class="clearfix">
		<form class="form-inline float-right mt--1 d-none d-md-flex">
			<button id="btnAddNewBrand" class="btn btn-primary"><i data-feather="plus"></i>&nbsp;Add Brands</button>
		</form>
		<h1 class="h3 mb-3">Brands</h1>
	</div>	
	<div class="row">
		<div id="create-new-brands" class="col-12"><!--  col-md-6 -->
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Create New Brands</h5>
					<h6 class="card-subtitle text-muted">This table is for all brand information</h6>
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
								<label class="col-md-4 control-label" for="brandName">Brand Name</label>
								<div class="col-md-12">
									<input id="brandName" name="brandName" placeholder="Enter Brand Name" class="form-control" required="Brand filled can not be nulled" type="text">
								</div>
							</div>
					
							<!-- Button -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="btnSave"></label>
								<div class="col-md-6">
									<input type="button" id="btnDelete" name="btnDelete" class="btn btn-danger hidden"  onclick="funDeleteBrands()" value="Delete">
									<button id="btnSave" name="btnSave" class="btn btn-primary">Save Brand</button>
									<button id="btnReset"name="btnReset" class="btn btn-warning" type="reset" value="Reset">Reset</button>
								</div>
							</div>
					
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- //// -->
		<div id="existing-brands" class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">Existing Brands</h5>
					<h6 class="card-subtitle text-muted">This table is for all brand information</h6>
				</div>
				<div class="card-body">
					<div id="divBrands" class="col-12 table-responsive"></div>
				</div>
			</div>
		</div>
		</div>
	</div>
</main>

