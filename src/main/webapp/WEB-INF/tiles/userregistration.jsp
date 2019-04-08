<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">

    $(document).ready(function(){

        function validator(){

            var fullName	= $.trim($("#fullName").val());
            var email	    = $.trim($("#email").val());
            var password	= $.trim($("#password").val());
            var rePassword	= $.trim($("#rePassword").val());
            var companyName	= $.trim($("#companyName").val());

            if(fullName == ""){
                $("#errorMessage").html("!! Please enter your full name");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            } else if (password == "") {
                $("#errorMessage").html("!! Please enter a password");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            } else if (password != rePassword) {
                $("#errorMessage").html("!! Password doesn't matched. Please retype password");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            } else if (!validateEmail(email)) {
                $("#errorMessage").html("!! Please enter a valid email address");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            } else if (companyName == "") {
                $("#errorMessage").html("!! Please enter a company name");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }

            return true;
        }


        /* Submitting form to controller*/
        $("#submit").click(function(event) {

            event.preventDefault();

            if (validator()){

                /*var data = {};
                data["email"] = $("#email").val();
                data["password"] = $("#password").val(); //companyName fullName

                alert(JSON.stringify(data));*/

                var fullName	= $.trim($("#fullName").val());
                var email	    = $.trim($("#email").val());
                var password	= $.trim($("#password").val());
                var rePassword	= $.trim($("#rePassword").val());
                var companyName	= $.trim($("#companyName").val());

                $.ajax({
                    type: "POST",
                    url: "saveUser",
                    data: {fullName: fullName, email: email, password: password, companyName: companyName},
                    //contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                        alert("User Created Successfully");
                        //viewData();
                        //$("#submit").prop("disabled", false);
                        //$("#successMessage").html(successData);
                        //$("#successMessage").removeClass("hidden");
                        //$("#errorMessage").addClass("hidden");

                    },
                    error: function (error) {
                        /* $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#submit").prop("disabled", false); */
                       alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission


    }); // End of document ready()

    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
    /*function viewData(){
        $.post("showAllUser", function(data){
           // alert(JSON.stringify(data));
            var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Activation</th></tr>';

            for(var key in data){
                dataTable += '<tr><td>' + data[key].id + '</td><td>' + data[key].userName + '</td><td>' + data[key].enabled + '</td></tr>';
            }

            dataTable += '</table>';

            $("#divDataTable").html(dataTable);
        })
    }*/

   /* function funSearchEmployee(){



        $.post("showEmployeeById", {empId: $("#empSearch").val()}, function(data){

            $("#divDataTable").html("");
            var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Address</th></tr>';



            dataTable += '<tr><td>' + data["id"] + '</td><td>' + data["name"] + '</td><td>' + data["address"] + '</td></tr>';


            dataTable += '</table>';

            $("#divDataTable").html(dataTable);
        })
    } */
</script>
<main class="app-main">
    <div class="wrapper">
        <div class="page">
<div class="page-inner">
    <header class="page-title-bar">
        <!--nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">
                    <a href="form-basic.html#">
                        <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Forms</a>
                </li>
            </ol>
        </nav-->
        <legend>User Registration</legend>
        <div></div></header>
    <div class="page-section">
        <div class="section-deck">

            <section class="card card-fluid">
                <div class="card-body">
                    <form id="frmEmployee">
                        <fieldset>
                            <div class="d-none alert alert-success alert-dismissible fade show">
                                <button type="button" class="close" data-dismiss="alert">x</button>
                                <strong id="successMessage" align="center">Well done!</strong>
                            </div>
                            <div id="errorMessage" align="center" class="d-none alert alert-danger alert-dismissible fade show"></div>

                            <div class="form-group">
                                <label class="control-label requiredField" for="fullName">Full Name</label>
                                <div class="form-group">
                                    <input id="fullName" name="fullName" placeholder="Enter your full name" class="form-control" type="text" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label requiredField" for="email">Email Address</label>
                                <div class="form-group">
                                    <input id="email" name="email" placeholder="Enter your email" class="form-control" type="text" />
                                </div>
                            </div>

                            <%--<div class="form-group">
                                <label class="control-label requiredField" for="password">Password</label>
                                <div class="form-group">
                                    <input id="password" name="password" placeholder="Enter Password" class="form-control" type="password" />
                                </div>
                            </div>--%>

                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="password">Password</label>
                                    <input id="password" name="password" placeholder="Enter Password" class="form-control" type="password" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="rePassword">Re-type Password</label>
                                    <input id="rePassword" name="rePassword" placeholder="Re-type Password" class="form-control" type="password" />
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="control-label requiredField" for="companyName">Company Name</label>
                                <div class="form-group">
                                    <input id="companyName" name="companyName" placeholder="Enter company name" class="form-control" type="text" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="submit"></label>
                                <div class="col-md-12" align="right">

                                        <a href="${pageContext.request.contextPath}/login" class="btn btn-warning circle">Back to Login
                                            <i class="fa fa-arrow-left ml-2"></i>
                                        </a>
                                    <%--<a href="javascript:void(0)" id="submit" name="submit" class="btn btn-primary circle">Register for User
                                        <i class="fa ml-2"></i>
                                    </a>--%>

                                    <button id="submit" name="submit" class="btn btn-primary circle">Register for User</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>

            </section>
            <section class="card card-fluid">
                <div class="card-body">

                </div>
            </section>
        <%--</section>--%>
    </div>
</div>
        </div>
        </div>
    </div>
</main>
