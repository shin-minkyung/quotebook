<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>quote book - guide</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script async src="${conPath }/js/ga.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-23019901-1' ]);
	_gaq.push([ '_setDomainName', "bootswatch.com" ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
<script type="text/javascript">
  $(document).ready(function(){
	 $("#sec1_title").click(function(){
		 $("#section1").slideToggle("slow");
	 });
	 $("#sec2_title").click(function(){
		 $("#section2").slideToggle("slow");
	 });
	 $("#sec3_title").click(function(){
		 $("#section3").slideToggle("slow");
	 });
	 $("#sec4_title").click(function(){
		 $("#section4").slideToggle("slow");
	 });
	 
	 $("#copy_sec1_title").click(function(){
		 $("#copy_section1").slideToggle("slow");
	 });
	 $("#copy_sec2_title").click(function(){
		 $("#copy_section2").slideToggle("slow");
	 });
	 $("#copy_sec3_title").click(function(){
		 $("#copy_section3").slideToggle("slow");
	 });
	 $("#copy_sec4_title").click(function(){
		 $("#copy_section4").slideToggle("slow");
	 });
  });
</script>
</head>
<body>
	<!-- Navbar -->
	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- ======================-->
	<div class="page_container">
		<div class="row">
			<div class="col-lg-2 no-padding" id="left_side_section">
				<jsp:include page="menu.jsp"></jsp:include>	
			</div> 	<!-- left_side_section ends -->
	
	<div class="col-lg-9" id="right_side_setion">
		<div class="section_container">
		    <div class="row">
		       <div class="col-lg-12">
		       		<div class="empty-space-20"></div>
		       </div>
		    </div>
			<div class="row">
				<div class="col-lg-12">
					<h2>Guide for Visitors</h2>
					<small>Let us introduce our service</small>
				</div>
			</div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="empty-space-20"></div>			     
		   </div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="lg-margin-section fixed-height-700">
				<img src="${conPath }/img/what_en.png">
  	     		</div>	
			</div>
		</div>
			
	</div>
	</div>	<!-- right_section_ends -->
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
