<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobify</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" >
<link href="${pageContext.request.contextPath}/resources/css/default-blue-white.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/modernizr/modernizr.js"></script>
<style>
   .dev-page{visibility: hidden;}            
</style>
</head>
<body>
   <div class="dev-page">
	<div class="dev-page-header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="dev-page-container">
		<tiles:insertAttribute name="menu" />
        <tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/jquery/jquery.min.js"></script>       
    <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>
        
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/moment/moment.js"></script>
        
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/knob/jquery.knob.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>
        
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/datatables/jquery.dataTables.min.js"></script>
        
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/sortable/sortable.min.js"></script>
	<script>
var datatables = {
	    init: function(){
	        
	        if($(".table-sortable").length > 0){
	            /* init default sortable table */
	            $(".table-sortable").DataTable({
	                "fnInitComplete": function() {
	                    $(".dataTables_wrapper").find("select,input").addClass("form-control");
	                }
	            });            
	            /* ./init default sortable table */
	            
	            /* udate page content on page change */
	            $(".table-sortable").on('page.dt',function() {
	                setTimeout(function(){
	                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
	                },100);                
	            });
	            /* ./udate page content on page change */                
	            
	            /* update page content on search */
	            $(".table-sortable").on( 'search.dt', function() {
	                setTimeout(function(){
	                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
	                },200);                
	            });
	            /* ./update page content on search */
	            
	            /* uppdate page content on change length */
	            $('.table-sortable').on('length.dt', function() {
	                setTimeout(function(){
	                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
	                },100);                
	            });
	            /* ./uppdate page content on change length */
	        }
	        
	    }
	};
	
$(function(){
	datatables.init();
});
</script>
</body>
</html>