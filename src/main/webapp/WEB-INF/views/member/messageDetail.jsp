<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>

<html lang="en">
<head>
<meta charset="utf-8">
<title>My Message</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<link rel="stylesheet" href="${conPath }/css/paging.css">
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
</head>
<body>
<c:if test="${param.sendResult==1 }">
	<script>
		alert("Your message has been sent successfully");
	</script>	
</c:if>
	<!-- Navbar -->
	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- ======================-->
	<div class="page_container">
		<div class="row">
			<div class="col-lg-2 no-padding" id="left_side_section">
				<jsp:include page="menu.jsp"></jsp:include>	
			</div>
	<!-- left_side_section ends -->
	
	<div class="col-lg-9" id="right_side_setion">
		<div class="section_container">
		    <div class="row">
		       <div class="col-lg-12">
		       		<div class="empty-space-20"></div>
		       </div>
		    </div>
			<div class="row">
				<div class="col-lg-12">
					<h2>Message Detail</h2>
				</div>
			</div>
		</div>
		<div class="bs-component">
			<div class="row">
				<div class="col-lg-12">
					<div class="lg-margin-section">	
						<div class="bs-component">
  	     				  <ul class="nav nav-tabs">
  	     			 		 <li class="nav-item">
  	     			  			<a class="nav-link active" data-toggle="tab">Message Detail</a>
  	     			  		</li>
  	     			  		 <li class="nav-item">
  	     			  			<a class="nav-link" href="msgView.do?tome=${tome }">back to list</a>
  	     			  		</li> 	     			  		  	     			  	
  	     				</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			   <div class="relative-msg bottom-line">
  	     			    <div class="left_container">
  	     			  	  <img src="${myUrl }/profile/${msg.mphoto}" width="70" style="display:block;">
  	     			  	  <small>${tome==1? 'from':'to'} ${msg.mname }</small>   	     			  	     
  	     			  	</div>
						<div class="left-margin">
						  ${msg.msgcontent }
						</div> 
						<div class="right_bottom_container_close">
						  ${msg.msgdate }
						</div> 	     			  	   
  	     			  	   
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
