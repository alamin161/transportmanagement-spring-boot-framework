<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title><tiles:insertAttribute name="title" /></title>

    <link rel="stylesheet" href="/css/app.css">
    <link rel="stylesheet" href="/css/custom-design.css">
    
    <!-- /*****************************************/ -->
    
   <!--  <!-- <!-- Bootstrap core CSS -->    
    <!-- link href="/plugins/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/lib/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"> -->

    <!-- Custom styles for this template -->
    <!-- link href="/css/custom.style.css" rel="stylesheet">
    <link href="/plugins/css/software-main.css" rel="stylesheet">
    <link href="/plugins/css/dataTables.bootstrap4s.min.css" rel="stylesheet">
    <link href="/css/jquery.dataTables.min.css" rel="stylesheet"> --><!-- //last commented
    <link href="/plugins/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="/plugins/css/easy-autocomplete.min.css" rel="stylesheet">
    <link href="/plugins/css/easy-autocomplete.themes.min.css" rel="stylesheet">
    <link href="/plugins/css/jquery-ui.min.css" rel="stylesheet">
    <link href="/plugins/css/toastr.css" rel="stylesheet">
    <link href="/plugins/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="/plugins/css/jquery.ui.timepicker.css" rel="stylesheet">
    <link href="/plugins/css/custom.footer.css" rel="stylesheet">
    <link href="/css/custom.table.css" rel="stylesheet">
    <link href="/css/custom-css/jquery-confirm.min.css" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet"> -->
    
    
    
    <script src="/plugins/js/jquery-3.1.1.min.js"></script>
    <!--<script src="/js/jquery-3.3.1.js"></script>
    <script src="/plugins/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/plugins/js/jquery.dataTables.min.js"></script>  
    <script src="/js/dataTables.bootstrap4.min.js"></script>   
    <script src="/plugins/js/dataTables.bootstrap.min.js"></script>
    <script src="/plugins/js/myCustomJsFunctions.js"></script>
    <script src="/plugins/js/bootstrap-select.min.js"></script>
    <script src="/plugins/js/jquery.easy-autocomplete.min.js"></script>
    <script src="/plugins/js/jquery.form.min.js"></script>
    <script src="/plugins/js/canvasjs.min.js"></script>
    <script src="/plugins/js/jquery-ui.min.js"></script>    
    <script src="/plugins/js/jspdf.min.js"></script>
    <script src="/plugins/js/from_html.js"></script>
    <script src="/plugins/js/split_text_to_size.js"></script>
    <script src="/plugins/js/standard_fonts_metrics.js"></script>
    <script src="/plugins/js/canvas.js"></script>
    <script src="/plugins/js/xdate.js"></script>
    <script src="/plugins/js/moment.js"></script>
    <script src="/plugins/js/toastr.js"></script>
    <script src="/plugins/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/plugins/js/jquery.ui.timepicker.js"></script>
    <script src="/js/custom-js/jquery-confirm.min.js"></script>
	<script src="/plugins/js/custom-js/time-format-converter.js"></script> -->
    
    
   <!--  /*****************************************/ -->



</head>
<body>
    <div class="wrapper">
        <div class="d-flex">
            <tiles:insertAttribute name="aside" />
            <div class="main">
                <tiles:insertAttribute name="header" />
                <tiles:insertAttribute name="content" />
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
    </div>
    <!-- BEGIN BASE JS -->

    <script src="/js/app.js"></script>
    <script src="/js/charts.js"></script>
    <script src="/js/forms.js"></script>
    <script src="/js/maps.js"></script>
    <script src="/js/tables.js"></script>
    <!-- <script src="/js/jquery-3.1.1.min.js"></script> -->
 
</body>
</html>