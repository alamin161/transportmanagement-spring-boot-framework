<script type="text/javascript">

	$(document).ready(function(){
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        
        funViewVenueData();
        $("#tmpId").val(0);
        
        function validator(){

            //var brandName	= $.trim($("#username").val());
			var venueName = $.trim($("#venueName").val());
			var locationMap = $.trim($("#locationMap").val());
		
            if(venueName == ""){
                $("#errorMessage").html("Please enter a valid Venue Name"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
               }
            
            /*else if(locationMap == ""){
            	 $("#errorMessage").html("Please enter a valid Location URL"); 
                 $("#errorMessage").removeClass("hidden");
                 $("#successMessage").addClass("hidden");
                 return false;
            	
            }*/

            return true;
        }// validation end
        
        $("#saveVenue").click(function(event) {

            event.preventDefault();

            if (validator()){

                var venue = {};

                venue["venueName"] = $.trim($("#venueName").val());
                venue["locationMap"] = $.trim($("#locationMap").val());
                venue["tmpId"] = $.trim($("#tmpId").val());
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveVene",
                    data: JSON.stringify(venue),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {

                    	
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewVenueData()

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                    }
                });

            } // End of validation
        }); // End of form submission
        
        function funViewVenueData(){
        	
        	$.post("viewAllVenue",function(data){
        		
        		var VenueData = '<table id="tblVenue" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Venue Name</th><th>Location URL</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){  
    				
    				VenueData += '<tr><td>' + data[key].id + '</td><td>' + data[key].venueName + '</td><td>' + data[key].locationMap +'</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			VenueData += '</tbody></table>';
    		
        		
        		$("#divShowVenue").html(VenueData);
        		$("#tblVenue").DataTable();
        		
				//update START
				$('#tblVenue tbody').on('dblclick', 'tr', function () {
    			
    			var tableData = $(this).children("td").map(function() {
			        return $(this).html();    			        
			    }).get();
    			
    			 
    			 //$("#btnSave").prop('value', 'Update Data');
    			 $("#saveVenue").html("Update Venue");
    			// $("#btnDelete").removeClass("hidden");
    			        			
    			 $("#tmpId").val(tableData[0]);
    			 $("#venueName").val(tableData[1]);
    			 $("#locationMap").val(tableData[2]);
    			
    		});	//updating data end
        		
        		
        		
        	});
        }

	});


</script>
<div class="col-md-6">
	<legend>Existing Venue</legend>

	<div id="divShowVenue">
	</div>

</div>

<div class="col-md-6">
<form class="form-horizontal">
	<fieldset>

		<!-- Form Name -->
		<legend>Create New Venue</legend>
		
		<div class="well well-sm" id="successMessage" align="center" style="border-radius: 100px;background-color:#1D9B2A;color:#fff;"></div>
		<div class="well well-sm" id="errorMessage" align="center" style="border-radius: 100px;background-color:red;color:#fff;"></div>
		
		<!-- for edit update-->
			<input type="text"  id="tmpId" name="tmpId" value="0" readonly="readonly">
			<!--class="hidden"--> 
			<!--end-->

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="venueName">Venue
				Name</label>
			<div class="col-md-6">
				<input id="venueName" name="venueName"placeholder="Enter Venue Name" class="form-control input-md"
					type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="locationMap">Location Map(*Optional)</label>
			<div class="col-md-6">
				<input id="locationMap" name="locationMap" placeholder="Enter Location Map URL" class="form-control input-md" type="text">

			</div>
		</div>

		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="saveVenue"></label>
			<div class="col-md-8">
				<button id="saveVenue" name="saveVenue" class="btn btn-success">Save Venue</button>
				<button id="resetVenue" name="resetVenue" class="btn btn-warning" type="reset" value="reset">Reset Venue</button>
			</div>
		</div>

	</fieldset>
</form>
</div>
