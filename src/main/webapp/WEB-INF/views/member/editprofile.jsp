<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sign Up</title>
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
		var failedCnt=0;
		var pwCorrect=0;
		$('.byteLimit').blur(function(){                     
	        var thisObject = $(this);		         
	        var limit = thisObject.attr("limitbyte"); 
	        var str = thisObject.val();
	        var strLength = 0;
	        var strTitle = "";
	        var strPiece = "";
	        var check = false;		                 
	        for (i = 0; i < str.length; i++){
	            var code = str.charCodeAt(i);
	            var ch = str.substr(i,1).toUpperCase();
	            strPiece = str.substr(i,1)
	            code = parseInt(code);
	            if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
	                strLength = strLength + 3; 
	            }else{
	                strLength = strLength + 1;
	            }
	            if(strLength>limit){ 
	                check = true;
	                break;
	            }else{
	                strTitle = strTitle+strPiece; 
	            }             
	        }         
	        if(check){
	            alert("The string greater than "+limit+"byte will be removed");
	        }         
	        thisObject.val(strTitle);         
	    });
		$("#editBtn").click(function(){						
			 var mid = $("#mid").val();
			 var mpw = $("#mpw").val();
			 //alert("mid "+mid+" mpw"+mpw);
			 if(failedCnt<=5 && pwCorrect==0){
				 $.ajax({				
						url : '${conPath}/loginChk.do',
						type : 'post',
						datatype : 'html',
						data : 'mid='+mid+'&mpw='+mpw,
						success : function(data, status) {					
							if(data.trim()!=1){	
								//alert("Incorrect Password");
								pwCorrect=0;
								failedCnt+=1;
								if(failedCnt<=5){
									$("#pw_msg").html("<font color='red'>Incorrect password: fail count "+failedCnt+"</font>");
								}else if(failedCnt>5){
									$("#pw_msg").html("<font color='red'>Access Denied. Try it later.</font>");
								} 
							}else{
								pwCorrect=1;
								//alert("pwCorrect: "+pwCorrect);
								$("#editForm").submit();
							}						
						}
				});//ajax 
			 }else if(failedCnt>5 && pwCorrect==0){
				 alert("Access Denied. Try later");
			 }else if(pwCorrect==1){
			   $("#editForm").submit();
			  // alert("done");
			 }		
			 
		});//click
		
	});
</script>
</head>
<body>
<c:if test="${param.modifyResult==1 }">
 <script>
 	alert("Profile Edit Success");
 </script>
</c:if>

	<!-- Navbar -->
	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- ======================-->
<c:if test="${mid!=null }">
	<div class="page_container">
		<div class="row">
			<div class="col-lg-2 no-padding" id="left_side_section">
			  <jsp:include page="menu.jsp"></jsp:include>
			</div>	<!-- left_side_section ends -->		
	
	<div class="col-lg-9" id="right_side_setion">
		<div class="section_container">
		    <div class="row">
		       <div class="col-lg-12">
		       		<div class="empty-space-20"></div>
		       </div>
		    </div>
			<div class="row">
				<div class="col-lg-12">
					<h2>Edit Profile</h2>
				</div>
			</div>
		</div>
		<div class="bs-component">
			<div class="row">
				<div class="col-lg-12">
					<div class="lg-margin-section">
						<form action="modifyMember.do" enctype="multipart/form-data" id="editForm"  method="post">
						 <input type="hidden" name="current_mphoto" value="${loginmember.mphoto }">
						  <input type="hidden" name="current_aboutme" value="${loginmember.aboutme }">
						<div class="form-group">
                   		  <label for="mid">Email address</label>
                    	  <input type="email" class="form-control" name="mid" id="mid" placeholder="${mid }" value="${mid }" readonly="readonly">
                          <small id="emailHelp" class="form-text text-muted">
                          </small>
                  		 </div>                  		
                  		<div class="form-group">
                   		  <label for="mname">Nickname</label>
                    	  <input type="text" class="form-control" name="mname" id="mname" placeholder="${mname }" value="${mname }"  readonly="readonly">
                          <small id="name_msg" class="form-text text-muted"></small>
                  		</div>
                  		<div class="form-group">
                    	  <label for="mpw">Current Password</label>
                     	  <input type="password" class="form-control" name="mpw" id="mpw" placeholder="Insert your current password">
                     	  <small id="pw_msg" class="form-text text-muted"></small>                     	  
                  		</div>
                  		  <label for="file">Profile Photo</label>
                  		<div class="form-group">                    	
                    		  <img src="${myUrl }/profile/${loginmember.mphoto}" width="120"> ${loginmember.mphoto }
                    	  <input type="file" class="form-control-file" id="mphoto" name="mphoto">
                          <small id="mphoto_msg" class="form-text text-muted">Image file only. It is recommended to use a 1:1 ratio(w:h) image </small>
                  		</div>
                  		<div class="form-group">
                  		  <label for="aboutme">About me</label>
                  		  <textarea rows="3" cols="75" class="form-control byteLimit" limitbyte="300" id="aboutme" name="aboutme" placeholder="less than 300 bytes">${loginmember.aboutme }</textarea>
                  		</div>                     		              		
                  		<div class="top-margin">
              				<button type="button" id="editBtn" class="btn btn-primary btn-lg btn-block">Edit Profile</button>
            			</div>
            			</form>
					</div>
				</div>
			</div>
		</div>
	</div>	<!-- right_section_ends -->
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	
</c:if>
<c:if test="${mid==null }">
  <div class="page_container">
   <div class="row">
     <div class="col-lg-3">
     </div>
     <div class="col-lg-9">
    <h1>Invalid Access: You need to login see this page.</h1>
     </div>
   </div>
  </div>
</c:if>
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
