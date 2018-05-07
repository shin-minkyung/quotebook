<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Settings</title>
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
	var currentPw='${mpw}';
	$("#current_mpw").keyup(function(){
		if($("#current_mpw").val()!=currentPw){
			$("#pw_msg").html("<font color='#CC5252'>Incorrect</font>");
			$('#current_mpw').addClass("is-invalid");
		}else if($("#current_mpw").val()==currentPw){
			$('#current_mpw').removeClass("is-invalid");
			$('#current_mpw').addClass("is-valid");
			$('#pw_msg').html("<font color='#4DC96F'>correct</font>");
		}
	});	
	$('#mpw, #mpw2').keyup(function(){
 		if ($("#mpw").val() != $("#mpw2").val()) {
 			$('#pw_confirm_msg').html("<font color='#CC5252'>not identical. Check again.</font>");
	        $('#mpw').removeClass("is-valid");
    		$('#mpw').addClass("is-invalid");
    		$('#mpw2').removeClass("is-valid");
	    	$('#mpw2').addClass("is-invalid");
 		}else{
 			if($('#mpw').val().length<=6){
 				$('#pw_confirm_msg').html("<font color='#CC5252'>Password must be longer than 6 letters</font>");
 			}else{
 				$('#pw_confirm_msg').html("<font color='#4DC96F'>You may use this password</font>");
		    	$('#mpw').removeClass("is-invalid");
	    		$('#mpw').addClass("is-valid");
	    		$('#mpw2').removeClass("is-invalid");
	    		$('#mpw2').addClass("is-valid");
 			}	 			
 		}
 	});
	$("#pwBtn").click(function(){
		if($("#current_mpw").val()==""){
			alert("Insert your current password");
		}else if($("#current_mpw").val()!=currentPw){
			alert("Incorrect current password");
		}else if($("#mpw").val()==""){
			alert("Insert new password");
		}else if($("#mpw2").val()==""){
			alert("Insert new password confirm");
		}else if($("#mpw").val()!=$("#mpw2").val()){
			alert("The password and its confirm are not identical");
			$("#mpw").val("");
            $("#mpw2").val("");
            $("#mpw").focus();
		}else if($("#mpw").val().length<=6){
			alert('Password must be longer than 6 letters');
		}else{
			$("#changePwForm").submit();
		}
	});	
	
	$("#dropBtn").click(function(){
		if($("#current_mpw1").val()==""){
			alert("Insert your password to proceed");
		}else if($("#current_mpw1").val()!=currentPw){
			alert("Incorrect current password");
		}else if($("input:checkbox[id='agree']").is(":checked")==false){
        	alert("Please read the notice carefully and if you want to proceed, click the checkbox");
        }else{
        	$("#dropForm").submit();
        }		
	});	
});
</script>
</head>
<body>
<c:if test="${param.modifyResult==1 }">
 <script>
 	alert("Password Change Success");
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
			</div> <!-- left_side_section ends -->
	
	<div class="col-lg-9" id="right_side_setion">
		<div class="section_container">
		    <div class="row">
		       <div class="col-lg-12">
		       		<div class="empty-space-20"></div>
		       </div>
		    </div>
			<div class="row">
				<div class="col-lg-12">
					<h2>Settings</h2>
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
  	     			  			<a class="nav-link active" data-toggle="tab" href="#p_movie">Password Setting</a>
  	     			  		</li>
  	     			  		 <li class="nav-item">
  	     			  			<a class="nav-link" data-toggle="tab" href="#p_show">Delete Account</a>
  	     			  		</li> 
  	     			  		<li class="nav-item">
  	     			  			<a class="nav-link" data-toggle="tab" href="#privacy">Privacy</a>
  	     			  		</li>  	     			  	
  	     				</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			  <div class="tab-pane fade show active in show" id="p_movie">
  	     			  <div class="relative-msg">
  	     			  <form action="changePw.do" method="post" id="changePwForm">
  	     			  <input type="hidden" name="mid" value="${mid }">
  	     			  	<div class="form-group">
                    	  <label for="current_mpw">Current Password</label>
                     	  <input type="password" class="form-control" name="current_mpw" id="current_mpw" placeholder="Password">
                     	   <small id="pw_msg" class="form-text text-muted"></small>                     	  
                  		</div>
  	     			  	<div class="form-group">
                    	  <label for="mpw">New Password</label>
                     	  <input type="password" class="form-control" name="mpw" id="mpw" placeholder="Password">                     	  
                  		</div>
                  		<div class="form-group">
                     	  <input type="password" class="form-control" name="mpw2" id="mpw2" placeholder="Password Confirm">
                     	  <small id="pw_confirm_msg" class="form-text text-muted"></small>                     	  
                     	</div> 
                     	<div class="top-margin">
              				<button type="button" id="pwBtn" class="btn btn-primary btn-lg btn-block">Change Password</button>
            			</div>
            			</form>   
            			</div>              			         
  	     			  </div>
  	     			  
  	     			  <div class="tab-pane fade" id="p_show">
  	     			    <div class="relative-msg">
  	     			    <h3><span class="glyphicon glyphicon-exclamation-sign"></span> Notice</h3>
  	     			    <p>After deleting your account, you lose accessibility to the data you uploaded.
  	     			    Some of your data referenced by other users will not be deleted even after you delete this account.
  	     			    <br>Are you sure you want to quit using our service and delete your account?
  	     			    </p>
  	     			    <form action="drop.do" method="post" id="dropForm">	
  	     			      <input type="hidden" name="mid" value="${mid }">    
  	     			       <input type="hidden" name="mphoto" value="${mphoto }">  			    
	  	     			  	<div class="custom-control custom-checkbox">
	                    	  <input type="checkbox" class="custom-control-input" id="agree">
	                    	  <label class="custom-control-label" for="agree"><span class="text-danger">I want to delete my account and I fully understand what is written above</span></label>
	                  		</div>
	                  		<p></p>
	                  		 <div class="form-group">
	                    	  <label for="current_mpw">Current Password</label>
	                     	  <input type="password" class="form-control" name="current_mpw" id="current_mpw1" placeholder="">                     	  
	                  		</div> 
	                        <div class="top-margin">
	              				<button type="button" id="dropBtn" class="btn btn-primary btn-lg btn-block">Delete my account</button>
	            			</div>
            			</form>
            			</div>          		
  	     			  </div>
  	     			 
  	     			   <div class="tab-pane fade" id="privacy">
  	     			   <div class="relative-msg much-padding" style="opacity:0.6;">
  	     			     <div class="little-padding" style="opacity:0.6;">
  	     			   	 <img src="${conPath }/img/x-face.png" width="50" style="float:left;">
  	     			     <h2>This is mock-up. It doesn't work</h2>
  	     			     </div>
  	     			  	<div class="custom-control custom-radio">  	     			  	
                          <input type="radio" id="r1" name="privacy" class="custom-control-input" checked>
                          <label class="custom-control-label" for="r1">Allow members to see my profile </label>
                          <p> </p>                          
                        </div>
                        <div class="custom-control custom-radio">
                          <input type="radio" id="r2" name="privacy" class="custom-control-input">
                          <label class="custom-control-label" for="r2"><b>Do not</b> allow members to see my profile</label>
                          <p> </p>
                        </div>
                        <div class="top-margin">
              				<button type="button" class="btn btn-primary btn-lg btn-block">Set </button>
            			</div>
            			</div>            			
                        </div>                        
  	     			  </div>   	     			 
  	     			</div>
  	     		  </div>		
				</div>
			</div>
		 </div>
	   </div>  <!-- right_section_ends -->
	  </div>	<!--big row -->
	 </div><!-- container ends -->		
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
