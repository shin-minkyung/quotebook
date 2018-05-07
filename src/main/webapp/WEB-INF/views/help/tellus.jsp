<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Tell us</title>
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
					<h2>Tell us</h2>
					<small>We will always listen to your voices</small>
				</div>
			</div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="empty-space-20"></div>
		     <h4 class="left-margin-little">Category</h4>
		     <div class="lg-margin-section relative left-margin">		      
		        <table>
		          <tr>
		            <td><b>inquiry</b></td>
		            <td>Ask anything you'd like to know about our service.</td>		            
		          </tr>
		          <tr>
		            <td><b>inconvenience</b></td>
		            <td>Tell us about anything inconvenient using our service</td>
		          </tr>
		          <tr>
		            <td><b>etc</b></td>
		            <td>Tell us freely what you'd like to</td>
		          </tr>
		        </table>     
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
  	     			  			<a class="nav-link active" data-toggle="tab" href="#received">Tell us</a>
  	     			  		</li>
  	     			  		 <li class="nav-item">
  	     			  			<a class="nav-link" data-toggle="tab" href="#claim">Claims Undone</a>
  	     			  		</li> 	     	  		  	     			  	
  	     				</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			  <div class="tab-pane fade show active in show" id="received">
  	     			  	  <div class="relative bottom-line" style="opacity:0.7;">
  	     			  	     <div class="little-padding" style="opacity:0.6;">
  	     			   	 	<img src="${conPath }/img/x-face.png" width="50" style="float:left;">
  	     			     	<h2>This is mock-up. It doesn't work</h2>
  	     			     	</div>
  	     			  	    <div class="form-group">
                   		     <label for="title">Title</label>
                    	     <input type="text" class="form-control" name="title" id="title" placeholder="title of your message">
                             <small id="name_msg" class="form-text text-muted">Nickname confirm message</small>
                  		    </div>
                  		    <select class="form-control" name="unknown">
				 			 <option selected="selected">select category*</option>
				 			 <option value="voca">inquiry</option>
				 			 <option value="syntax">inconvenience</option>
				 			 <option value="complex">etc</option>
				 			</select>
                  		    <div class="form-group">
                  		     <label for="aboutme">Message</label>
                  		     <textarea rows="3" cols="75" class="form-control" id="aboutme" name="aboutme" placeholder="less than 500 letters"></textarea>
                  		 	</div>
                  		 	<div class="top-margin">
              				<button type="button" class="btn btn-primary btn-lg btn-block">Send</button>
            			    </div>
  	     			  	  </div>         
  	     			  </div>
  	     			  <div class="tab-pane fade" id="claim" style="opacity:0.7;">
  	     			    <div class="little-padding" style="opacity:0.6;">
  	     			   	 	<img src="${conPath }/img/x-face.png" width="50" style="float:left;">
  	     			     	<h2>This is mock-up. It doesn't work</h2>
  	     			     </div>
  	     			    <small>When your claim is done with your consent, it is removed from the list.</small>
  	     			  	  <div class="relative bottom-line">
  	     			  		<h5>└Answer from Administrator</h5>
  	     			  		   <h6 class="left-margin-little">Login Problem</h6>
  	     			  		Hello, user A. We're trying to fix the problem, but still it will take more time. 
  	     			  		We're very sorry to say that you have to wait more. We'll try our best to solve the problem. Thank you.
  	     			  		 <div class="right_bottom_container">
		             		  <ul>
		             		   <li class="list-inline-item"><em>2018/01/18</em></li>
  	     			  		   <li class="list-inline-item">Category: inconvenience</li>
  	     			  		  </ul>
		           		     </div>
		           		     <div class="right_container">		           		     
                  			  <button type="button" class="btn btn-primary btn-sm">make it done</button>
                  			  <button type="button" class="btn btn-primary btn-sm">further inquiry</button>
		           		     </div>
  	     			  	  </div> 
  	     			  	  <div class="relative bottom-line">
  	     			  	    <h5>Your Previous Message</h5>
  	     			  	     <h6 class="left-margin-little">Login Problem</h6>
  	     			  	    Hi. I have problem with login. It doesn't work sometimes. Although I put the correct email and password, it keeps saying 'check your password'.
  	     			  	    <p>Do you know why?</p>
  	     			  	     <div class="right_bottom_container">
		             		  <ul>
		             		   <li class="list-inline-item"><em>2018/01/18</em></li>
  	     			  		   <li class="list-inline-item">Category: inconvenience</li>
  	     			  		  </ul>
		           		     </div>
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
