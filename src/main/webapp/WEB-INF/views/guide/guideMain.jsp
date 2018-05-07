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
	$("#c1").carousel("pause");
	$("#c2").carousel("pause");
	$("#c3").carousel("pause");
	$("#c4").carousel("pause");
	$("#c5").carousel("pause");
	 
	 var key='${param.key}';
	 if(key==null || key==""){
		 key=1;
	 }
	 $(".guide").css("display","none");
	 $(".img_"+key).css("display","block");
	

	 setInterval(function(){
	 var first_active1 = $("#howtouseqbook div:first-child").hasClass("active");
	 var last_active1 = $("#howtouseqbook div:last-child").hasClass("active");
		 if(first_active1==true){
			 $("#pre1").css("display","none");		 
		 }else{			
			 $("#pre1").css("display","-webkit-box");
		 }
		 if(last_active1==true){
			 $("#nex1").css("display","none");	
		 }else{			
			 $("#nex1").css("display","-webkit-box");
		 }
	 }, 10);
	 setInterval(function(){
		 var first_active2 = $("#howtousepbook div:first-child").hasClass("active");
		 var last_active2 = $("#howtousepbook div:last-child").hasClass("active");
		
			 if(first_active2==true){
				 $("#pre2").css("display","none");		 
			 }else{			
				 $("#pre2").css("display","-webkit-box");
			 }
			 if(last_active2==true){
				 $("#nex2").css("display","none");	
			 }else{			
				 $("#nex2").css("display","-webkit-box");
			 }
		 }, 10);
	 setInterval(function(){
		 var first_active3 = $("#levelandpoint div:first-child").hasClass("active");
		 var last_active3 = $("#levelandpoint div:last-child").hasClass("active");
	
			 if(first_active3==true){
				 $("#pre3").css("display","none");		 
			 }else{			
				 $("#pre3").css("display","-webkit-box");
			 }
			 if(last_active3==true){
				 $("#nex3").css("display","none");	
			 }else{			
				 $("#nex3").css("display","-webkit-box");
			 }
		 }, 10);
	
	 setInterval(function(){
		 var first_active4 = $("#register div:first-child").hasClass("active");
		 var last_active4 = $("#register div:last-child").hasClass("active");
		 
			 if(first_active4==true){
				 $("#pre4").css("display","none");		 
			 }else{			
				 $("#pre4").css("display","-webkit-box");
			 }
			 if(last_active4==true){
				 $("#nex4").css("display","none");	
			 }else{			
				 $("#nex4").css("display","-webkit-box");
			 }
		 }, 10);
	 
	 setInterval(function(){
		 var first_active5 = $("#community div:first-child").hasClass("active");
		 var last_active5 = $("#community div:last-child").hasClass("active");		
			 if(first_active5==true){
				 $("#pre5").css("display","none");		 
			 }else{			
				 $("#pre5").css("display","-webkit-box");
			 }
			 if(last_active5==true){
				 $("#nex5").css("display","none");	
			 }else{			
				 $("#nex5").css("display","-webkit-box");
			 }
		 }, 10);
	 
  });
</script>
<style type="text/css">

</style>
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
				  <div class="guide img_1"><img src="${conPath }/img/1_ko.png"></div>
				  <div class="guide img_2">
				  <div id="c1" class="carousel slide">
	  				<ol class="carousel-indicators">
	    			<li data-target="#c1" data-slide-to="0" class="active"></li>
	    			<li data-target="#c1" data-slide-to="1"></li>
	    			<li data-target="#c1" data-slide-to="2"></li>
	    			<li data-target="#c1" data-slide-to="3"></li>
	    			<li data-target="#c1" data-slide-to="4"></li>
	    			<li data-target="#c1" data-slide-to="5"></li>	    			
	  				</ol>
			  			<div id="howtouseqbook" class="carousel-inner" style="height:710px;">
			  			  <div class="carousel-item active">
			      			<img class="d-block" src="${conPath }/img/4_ko.png" alt="slide1">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/2_ko.png" alt="slide2">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/3_ko.png" alt="slide3">
			    		  </div>
			    		   <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/5_ko.png" alt="slide4">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/6_ko.png" alt="slide5">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/7_ko.png" alt="slide6">
			    		  </div>				    		  
			  			</div>
		  			<a id="pre1" class="carousel-control-prev pre" href="#c1" role="button" data-slide="prev">
			    		<img src="${conPath }/img/left-arrow.png">
<!-- 			    		<span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
			    		<span class="sr-only">Previous</span>
		  			</a>
		  			<a id="nex1" class="carousel-control-next nex" href="#c1" role="button" data-slide="next">
						<img src="${conPath }/img/right-arrow.png">
<!-- 			    		<span class="carousel-control-next-icon" aria-hidden="true"></span> -->
			    		<span class="sr-only">Next</span>
		  			</a>
				  </div>
				 </div>
				 <div class="guide img_3">
				  <div id="c2" class="carousel slide">
	  				<ol class="carousel-indicators">
	    				<li data-target="#c2" data-slide-to="0" class="active"></li>
	    				<li data-target="#c2" data-slide-to="1"></li>
	    				<li data-target="#c2" data-slide-to="2"></li>
	    				<li data-target="#c2" data-slide-to="3"></li>	    			
	  				</ol>
			  			<div id="howtousepbook" class="carousel-inner" style="height:710px;">
			  			  <div class="carousel-item active">
			      			<img class="d-block" src="${conPath }/img/10_ko.png" alt="slide1">
			    		  </div>
			  			  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/8_ko.png" alt="slide2">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/9_ko.png" alt="slide3">
			    		  </div>
			    		  	  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/11_ko.png" alt="slide4">
			    		  </div>				    		  
			  			</div>
		  			<a id="pre2" class="carousel-control-prev pre" href="#c2" role="button" data-slide="prev">
			    		<img src="${conPath }/img/left-arrow.png">
			    		<span class="sr-only">Previous</span>
		  			</a>
		  			<a id="nex2" class="carousel-control-next nex" href="#c2" role="button" data-slide="next">
						<img src="${conPath }/img/right-arrow.png">
			    		<span class="sr-only">Next</span>
		  			</a>
				  </div>
				 </div>
				 <div class="guide img_4">
				  <div id="c3" class="carousel slide">
	  				<ol class="carousel-indicators">
	    				<li data-target="#c3" data-slide-to="0" class="active"></li>
	    				<li data-target="#c3" data-slide-to="1"></li>	    					    			
	  				</ol>
			  			<div id="levelandpoint" class="carousel-inner" style="height:710px;">
			  			  <div class="carousel-item active">
			      			<img class="d-block" src="${conPath }/img/12_ko.png" alt="slide1">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/13_ko.png" alt="slide2">
			    		  </div>	  			  
			    		 			    		  
			  			</div>
		  			<a id="pre3" class="carousel-control-prev pre" href="#c3" role="button" data-slide="prev">
			    		<img src="${conPath }/img/left-arrow.png">
			    		<span class="sr-only">Previous</span>
		  			</a>
		  			<a id="nex3" class="carousel-control-next nex" href="#c3" role="button" data-slide="next">
						<img src="${conPath }/img/right-arrow.png">
			    		<span class="sr-only">Next</span>
		  			</a>
				  </div>
				 </div>
				  <div class="guide img_5">
				  <div id="c4" class="carousel slide">
	  				<ol class="carousel-indicators">
	    				<li data-target="#c4" data-slide-to="0" class="active"></li>
	    				<li data-target="#c4" data-slide-to="1"></li>	    					    			
	  				</ol>
			  			<div id="register" class="carousel-inner" style="height:710px;">
			  			  <div class="carousel-item active">
			      			<img class="d-block" src="${conPath }/img/14_ko.png" alt="slide1">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/15_ko.png" alt="slide2">
			    		  </div>	  			  
			    		 			    		  
			  			</div>
		  			<a id="pre4" class="carousel-control-prev pre" href="#c4" role="button" data-slide="prev">
			    		<img src="${conPath }/img/left-arrow.png">
			    		<span class="sr-only">Previous</span>
		  			</a>
		  			<a id="nex4" class="carousel-control-next nex" href="#c4" role="button" data-slide="next">
						<img src="${conPath }/img/right-arrow.png">
			    		<span class="sr-only">Next</span>
		  			</a>
				  </div>
				 </div>
				 <div class="guide img_6">
				  <div id="c5" class="carousel slide">
	  				<ol class="carousel-indicators">
	    				<li data-target="#c5" data-slide-to="0" class="active"></li>
	    				<li data-target="#c5" data-slide-to="1"></li>
	    				<li data-target="#c5" data-slide-to="2"></li> 
	    				<li data-target="#c5" data-slide-to="3"></li> 			    			
	  				</ol>
			  			<div id="community" class="carousel-inner" style="height:710px;">
			  			  <div class="carousel-item active">
			      			<img class="d-block" src="${conPath }/img/16_ko.png" alt="slide1">
			    		  </div>
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/17_ko.png" alt="slide2">
			    		  </div>  			  
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/18_ko.png" alt="slide3">
			    		  </div> 
			    		  <div class="carousel-item">
			      			<img class="d-block" src="${conPath }/img/19_ko.png" alt="slide3">
			    		  </div> 		    		  
			  			</div>
		  			<a id="pre5" class="carousel-control-prev pre" href="#c5" role="button" data-slide="prev">
			    		<img src="${conPath }/img/left-arrow.png">
			    		<span class="sr-only">Previous</span>
		  			</a>
		  			<a id="nex5" class="carousel-control-next nex" href="#c5" role="button" data-slide="next">
						<img src="${conPath }/img/right-arrow.png">
			    		<span class="sr-only">Next</span>
		  			</a>
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
