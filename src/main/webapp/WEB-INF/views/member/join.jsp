<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async src="${conPath }/js/ga.js"></script>
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
	 var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	 var regNickname= /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	 var emailres;
	 var emailok=0;
	 var nickok=0;
	 var code="";
	 	$('#mId').keyup(function(){
	 		if(!regEmail.test($('#mId').val())){
	 			$('#mId_msg').html("<font color='#CC5252'>invalid form of email</font>");
	 			$('#mId').addClass("is-invalid");
	 			emailres=0;
	 		}else{
	 			$('#mId_msg').html("<font color='#4DC96F'>valid form of email</font>");
	 			$('#mId').removeClass("is-invalid");
	 			$('#mId').addClass("is-valid");
	 		 	$.ajax({
					url:'${conPath}/idChk.do',
					type:'get',
					datatype:'html',
					data:'mId='+$('input[name="mId"]').val(),
					success:function(data,status){						
						if(data.trim()==1){
							$('#mId').addClass("is-invalid");
							$('#mId_msg').html("<font color='#CC5252'>You've already registered</font>");
							emailres=0;
						}else if(data.trim()==0){
							$('#mId').removeClass("is-invalid");
							$('#mId').addClass("is-valid");
							$('#mId_msg').html("<font color='#4DC96F'>You may use this e-mail. Now please validate your e-mail.</font>");
							emailres=1;
						}												
					}//function
				}); 
	 		}
	 	});
	 	$('#mPw1, #mPw2').keyup(function(){
	 		if ($("#mPw1").val() != $("#mPw2").val()) {
	 			$('#pw_msg').html("<font color='#CC5252'>not identical. Check again.</font>");
		        $('#mPw1').removeClass("is-valid");
	    		$('#mPw1').addClass("is-invalid");
	    		$('#mPw2').removeClass("is-valid");
		    	$('#mPw2').addClass("is-invalid");
	 		}else{
	 			if($('#mPw1').val().length<=6){
	 				$('#pw_msg').html("<font color='#CC5252'>Password must be longer than 6 letters</font>");
	 			}else{
	 				$('#pw_msg').html("<font color='#4DC96F'>You may use this password</font>");
			    	$('#mPw1').removeClass("is-invalid");
		    		$('#mPw1').addClass("is-valid");
		    		$('#mPw2').removeClass("is-invalid");
		    		$('#mPw2').addClass("is-valid");
	 			}	 			
	 		}
	 	});
		
	    $('#mPhoto').blur(function(){
	    	if($('#mPhoto').val()!=""){
	    		if($('#mPhoto').val().slice($('#mPhoto').val().lastIndexOf(".")+1).toLowerCase()!="gif" && $('#mPhoto').val().slice($('#mPhoto').val().lastIndexOf(".")+1).toLowerCase()!="jpg" && $('#mPhoto').val().slice($('#mPhoto').val().lastIndexOf(".")+1).toLowerCase()!="png"){
		    		alert('The file format must be .gif, .jpg or .png');
		    		$('#mPhoto').val("");
		    	}else{		    		
		    	}
	    	}	    	
	    });  		
		
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
		 
		 	$("#sendConfirm").click(function(){
		 		var mId = $('input[name="mId"]').val();
		 		var mName=$("#mName").val();
		 		emailok=0;
		 		$("#sendConfirm").text("Check your E-mail Inbox");
		 		$("#sendConfirm").addClass("disabled");
		 		$.ajax({
					url:'${conPath}/confirmRequest.do',
					type:'post',
					datatype:'html',
					data:'mId='+mId+'&mName='+mName,
					success:function(data,status){
						code = data.trim();
						$("#codeInput").keyup(function(){
					 		var codeInput=$("#codeInput").val();
					 		if(codeInput==code){
					 			emailok=1;
					 			$('#codeInput').removeClass("is-invalid");
					 			$('#codeInput').addClass("is-valid");
					 			$("#code_msg").html("<font color='#4DC96F'>correct code</font>");					 			
					 		}else{
					 			emailok=0;
					 			$('#codeInput').addClass("is-invalid");
					 			$("#code_msg").html("<font color='#CC5252'>invalid code</font>");					 			
					 		}
					 	});
													
					}//function
				});
		 	});
		 	if(code==""){
		 		$("#codeInput").keyup(function(){
		 			$("#code_msg").html("<font color='#CC5252'>You must send the code first</font>");	
		 		});
		 	}
		 	$("#mName").keyup(function(){		 	
		          var firstLetter= $("#mName").val().charAt(0);
		          //$("#name_msg").html(firstLetter+isNaN(firstLetter));
		          if(!isNaN(firstLetter)){
		        	  $("#name_msg").html("<font color='#CC5252'>The first letter of nickname must be character</font>");
		        	  $(this).addClass("is-invalid");
		          }else{
		        	  $(this).removeClass("is-invalid");
		        	  $(this).addClass("is-valid");
		        	  $.ajax({
							url:'${conPath}/nameChk.do',
							type:'get',
							datatype:'html',
							data:'mName='+$('input[name="mName"]').val(),
							success:function(data,status){						
								if(data.trim()==1){
									$('#mName').addClass("is-invalid");
									$('#name_msg').html("<font color='#CC5252'>The nickname has already been using</font>");
									nickok=0;
								}else if(data.trim()==0){
									$('#mName').removeClass("is-invalid");
									$('#mName').addClass("is-valid");
									$('#name_msg').html("<font color='#4DC96F'>You may use this nickname</font>");
									nickok=1;
								}												
							}//function
						});       	  
		          }	    		 		
		 	});		 	
		 	$('#go').click(function(){
				//alert(emailres);
				if($('#mId').val()==""){
					alert("You must insert email");
					$('#mId').focus();				
				}else if(!regEmail.test($('#mId').val())){
					alert("Invalid form of email");	
				}else if($('#mPw1').val()==""){
					alert("You must insert password");
				}else if($('#mPw2').val()==""){
					alert("You must insert password confirm");
				}else if($('#mPw2').val()!=$('#mPw1').val()){
					alert("The password and its confirm are not identical");
					$("#mPw1").val("");
		            $("#mPw2").val("");
		            $("#mPw1").focus();
				}else if($("#mPw1").val().length<=6){
					alert('Password must be longer than 6 letters');
					//$("#pw_msg").html($("#mPw1").val().length);
				}else if ($("#mName").val() == "") {
		            alert("You must insert nickname for your account");
		            $("#mName").focus();
		        }else if(nickok==0){
		        	alert("Invalid Form of Nickname");	
		        }else if($("input:checkbox[id='agree']").is(":checked")==false){
		        	alert("You must agree to the terms of service and privacy policy before registering");
		        }else if(!regNickname.test($('#mName').val())){
		        	alert("Nicknames must be 2~20 letters");
		        }else if(emailres==0){
		        	alert("Check the email");
		        }else if(emailok==0){
		        	alert('E-Mail Validation Unfinished');
		        }else{
		        	$("#signup").submit();
		        }
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
					<div class="row">
						<div class="col-lg-12">
							<div class="empty-space-70"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
						 <ul class="list-group">
             			   <li class="list-group-item d-flex justify-content-between align-items-center">
                  			Terms of Service
                  		   </li>
            			   <li class="list-group-item d-flex justify-content-between align-items-center">
                  			Privacy Police
                			</li>               		
              			</ul>						
						</div>
					</div>					
						<!-- section1 ends -->
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
					<h2>Sign Up</h2>
				</div>
			</div>
		</div>
		<div class="bs-component">
			<div class="row">
				<div class="col-lg-12">
					<div class="lg-margin-section">
						<form action="${conPath }/join.do" enctype="multipart/form-data" method="post" name="signup" id="signup">
						<div class="form-group">
                   		  <label for="mId">Email address</label>
                    	  <input type="email" class="form-control" name="mId" id="mId" placeholder="Enter email">
                          <small id="mId_msg" class="form-text text-muted">email confirm message</small>
                  		 </div>
                  		 <label for="codeInput">Email Confirm  </label>
                  		 <small id="code_msg">Copy and Paste the Code in this Form</small>  
                  		<div class="form-group">
                  			<input type="text" id="codeInput" class="form-control" style="width:200px; display:inline-block">
                  		  	  <button type="button" id="sendConfirm" class="btn btn-primary">Send Code</button>                  		  	           	
                  		</div>                  		 	  
                  		 <div class="form-group">
                    	  <label for="mPw1">Password</label>
                     	  <input type="password" class="form-control" name="mPw1" id="mPw1" placeholder="Password">                     	  
                  		</div>
                  		<div class="form-group">
                     	  <input type="password" class="form-control" name="mPw2" id="mPw2" placeholder="Password Confirm">
                     	  <small id="pw_msg" class="form-text text-muted">password confirm message</small>                     	  
                     	</div>
                  		<div class="form-group">
                   		  <label for="mName">Nickname</label>
                    	  <input type="text" class="form-control" name="mName" id="mName" placeholder="Nickname">
                          <small id="name_msg" class="form-text text-muted">Nickname confirm message</small>
                  		</div>
                  		<div class="form-group">
                    	  <label for="file">Profile Photo</label>
                    	  <input type="file" class="form-control-file" id="mPhoto" name="mPhoto">
                          <small id="mphoto_msg" class="form-text text-muted">Image File Only</small>
                  		</div>
                  		<div class="form-group">
                  		  <label for="aboutme">About me</label>
                  		  <textarea rows="2" cols="75" class="form-control byteLimit" limitbyte="500" id="aboutme" name="aboutme" placeholder="less than 500 byte(optional)"></textarea>
                  		</div>                 		
                  	
                  		<div class="custom-control custom-checkbox">
                    	  <input type="checkbox" class="custom-control-input" id="agree">
                    	  <label class="custom-control-label" for="agree">I agree to the terms of service and privacy policy</label>
                  		</div>
                  		<div class="top-margin">
              				<button type="button" id="go" class="btn btn-primary btn-lg btn-block">Create an Account</button>
            			</div>            			
            			</form>
					</div>
				<!-- test upload -->
					<%-- <div class="lg-margin-section">
					<form action="${conPath }/testUpload.do" enctype="multipart/form-data" method="post" name="test" id="test">
					<label for="file">TEST UPLOAD</label>					
						<div class="form-group">                    	  
                    	  <input type="file" class="form-control-file" id="testfile" name="testfile" style="width:200px; display:inline-block">
                    	   <button type="submit" id="testUpload" class="btn btn-primary">test upload</button>                                                     
                  		</div>
                  		 <small id="test_msg" class="form-text text-muted">anyfile</small>
                  	</form>
					</div> --%>		
				<!-- test upload ends -->		
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
