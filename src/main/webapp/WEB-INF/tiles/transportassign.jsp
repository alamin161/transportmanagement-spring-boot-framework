<script type="text/javascript">
    viewRequisition();

    function viewRequisition(){
        $.post("viewTransportRequisition",function(data){

            var requisitionCard;

            for(var key in data){

                requisitionCard += '<div class="col-12 col-md-6 col-lg-4"><div class="card"><div class="card-header"><h6>Requested By: &nbsp;&nbsp;<span class=" text-muted">'+ data[key].id + '</span></h6><h6>Travel Date: &nbsp;&nbsp;<span class="text-muted">' + '02/12/2018-03/12/2-18' + '</span></h6><h6>Time: &nbsp;&nbsp;<span class="text-muted">' + '10:00 PM - 11:00 PM' + '</span></h6><h6>Traveller: &nbsp;&nbsp;<span class="text-muted">' +'Local'+'</span></h6><h6>Purpose: &nbsp;&nbsp;</h6><h6 class="text-muted">' + data[key].purpose +'</h6></div><div class="card-body"><form><select class="custom-select form-control input-md"></select><br><br><button class="btn btn-block btn-primary"> Assign Now</button></form></div></div></div></div>'

            }//end of for loop

            $("#showRequisitionCard").html(requisitionCard);
        });
    }
</script>
<%--<script>
	document.addEventListener("DOMContentLoaded", function(event) {
		// Select2
		$('.select2').each(function() {
			$(this)
				.wrap('<div class="position-relative"></div>')
				.select2({
					placeholder: 'Select Transport',
					dropdownParent: $(this).parent()
				});
		})

	});
</script>--%>
<style>
.card:hover {
    -ms-transform: scale(1.03); /* IE 9 */
    -webkit-transform: scale(1.03); /* Safari 3-8 */
    transform:scale(1.03); 
    transition: .5s;
}
</style>
<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">Transport Assign</h1>

        <div id="showRequisitionCard" class="row"></div>


    </div>
</main>