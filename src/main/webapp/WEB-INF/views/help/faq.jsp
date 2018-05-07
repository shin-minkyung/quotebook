<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>FAQ</title>
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
					<h2>FAQ</h2>
					<small>Check the Frequently Asked Questions</small>
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
				  <div class="bs-component">
  	     				  <ul class="nav nav-tabs">
  	     			 		 <li class="nav-item">
  	     			  			<a class="nav-link active" data-toggle="tab" href="#received">User Management</a>
  	     			  		</li>
  	     			  		 <li class="nav-item">
  	     			  			<a class="nav-link" data-toggle="tab" href="#copyright">Copyright</a>
  	     			  		</li> 	     			  		  	     			  	
  	     				</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			  <div class="tab-pane fade show active in show" id="received">
  	     			    <div id="sec1_title" class="top-bottom-lined padding-top-bottom">Can I Change My Email?</div>
 						<div id="section1" class="hide">
 							Sorry. Emails are like id. You can't change after once you joined with the email.  					
 						</div>
 						<div id="sec2_title" class="top-bottom-lined padding-top-bottom">Can I Change My Nickname? </div>
 						<div id="section2" class="hide">Sorry. We allow users to use an unique nickname each and can't change after inserted once.</div>
 						<div id="sec3_title" class="top-bottom-lined padding-top-bottom">Do I need to pay for service here?</div>
 						<div id="section3" class="hide">No. Our service is completely free. Anyone can join and have his own quote book. We hope you will enjoy learning languages with help of our service.</div>
 						<div id="sec4_title" class="top-bottom-lined padding-top-bottom">When users are eliminated?</div>
 						<div id="section4" class="hide">Users who constantly violated the rules may be eliminated. Elimination will never be done for our convenience. It will be done only when it is necessary. You don't need to concern about elimination if you don't offend many users frequently or violate copyright.</div>  	     			          
  	     			  </div>
  	     			 
  	     			  <div class="tab-pane fade" id="copyright">
  	     				<div id="copy_sec1_title" class="top-bottom-lined padding-top-bottom">How much text can I save per a quote?</div>
 						<div id="copy_section1" class="hide">
 							We provide 500 bytes per a quote. The greater part will be removed automatically.  					
 						</div>
 						<div id="copy_sec2_title" class="top-bottom-lined padding-top-bottom">How many quotes can I save? </div>
 						<div id="copy_section2" class="hide">
 						    No limit for saving quotes. You can save quotes as much as you can.
 						</div>
 						<div id="copy_sec3_title" class="top-bottom-lined padding-top-bottom">What shouldn't be written in "Public Book"?</div>
 						<div id="copy_section3" class="hide">
 							You should provide credit when you want to share contents. Simply citing from books, movie or TV show is OK but sharing intellectual property in large amount is forbidden.
 						
 						</div>
 						<div id="copy_sec4_title" class="top-bottom-lined padding-top-bottom">Icons and illustrations on this site are made by artists from www.flaticon.com</div>
 						<div id="copy_section4" class="hide">
 						<a class="normal-link" href="https://www.flaticon.com" target="blank">https://www.flaticon.com</a>
 						<br>
 						Images used on this site are mostly from flaticon.com
 						</div> 
  	     			  </div> 
  	     			</div>   	     			 
  	     		  </div>
				
					

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
