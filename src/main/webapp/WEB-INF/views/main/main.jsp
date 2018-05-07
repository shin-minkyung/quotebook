<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>quote book - main page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
    <link rel="stylesheet" href="${conPath }/css/custom.min.css">
    <link rel="stylesheet" href="${conPath }/css/glyphicon.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script async src="${conPath }/js/ga.js"></script>
<!-- 아래 스크립트는 modal기능수행에 ga.js와 충돌해서 주석처리 -->
<!--     <script src="js/bootstrap.js"></script>   -->
<!--     <script src="js/bootstrap.min.js"></script>  -->
<!--      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    <script>

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();     

    </script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$('#signin').click(function(){
  			$.ajax({
  				url:'${conPath}/loginChk.do',
  				type:'post',
  				datatype:'html',
  				data:'mid='+$('input[name="mid"]').val()+'&mpw='+$('input[name="mpw"]').val(),  			
  				success:function(data, status){
  					//alert(data.trim());
  					if(data.trim()==1){
  						$('form[name="memberlogin"]').trigger('submit');
  					}else if(data.trim()==0){
  						$('#loginmsg').html("<font color='#CC5252'>Incorrect Password</font>");
  					}else if(data.trim()==-1){
  						$('#loginmsg').html("<font color='#CC5252'>No Matching ID</font>");
  					}else if(data.trim()==-2){
  						$('#loginmsg').html("<font color='#CC5252'>Deleted Account</font>");
  					}	
  				}  				
  			});
  		});
  		$('.carousel').carousel({
  		  interval: 5000,
  		  ride:true
  		})
  		if(${mid!=null }){
  			//alert('mid in session');
  			location.href="${conPath}/memberMain.do";
  		}
  	});
  </script>   
  </head>
  <body>

 <c:if test="${param.joinResult==-1 }">
  	<script>
  	 alert("You've already registered");
  	</script>
  </c:if>
  <c:if test="${param.joinResult==1 }">
  	<script>
  	 alert("Congratulation. Register Success");
  	</script>
 </c:if>
  <c:if test="${param.dropResult==1 }">
  	<script>
  	 alert("Your account has been deleted successfully. Thank you for having used our service.");
  	</script>
 </c:if>

  <!-- Navbar -->
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
        <jsp:include page="header.jsp"></jsp:include> 
    </div>

<!-- ======================-->

  <div class="page_container">
  	<div class="row">
  	  <div class="col-lg-8" id="left_side_section">
  	  	<jsp:include page="localmemo.jsp"></jsp:include>     	  
  	    <jsp:include page="toplist.jsp"></jsp:include>  
  	
  	</div><!-- left_side_section ends --> 
  	
  <div class="col-lg-4" id="right_side_setion">
  	<div class="section_container">
  	  <div class="row">
  	      <div class="col-lg-12">
            <div class="card bg-light mb-3" style="max-width: 20rem;">
              <h3 class="card-header light-header">Login</h3>
                <div class="card-body">          
                    <p>테스트 계정 ID: catgirl@naver.com</p>
                    <p>비밀번호 1234567</p>
                  <form action="${conPath }/login.do" method="post" name="memberlogin">
                	<div class="form-group">
                      <label for="mid">Email address</label>
                      <input type="email" class="form-control" name="mid" id="mid" placeholder="Enter email">
	                </div>
 					<div class="form-group">
                      <label for="mpw">Password</label>
                      <input type="password" class="form-control" name="mpw" id="mpw" placeholder="Password">                      
                    </div>
                    <div id="loginmsg"></div>
                    <button type="button" id="signin" class="btn btn-primary btn-lg btn-block">Sign In</button>                                        
                  </form>                	
                </div>
              </div>
          </div>  
  	  </div>
  	 </div>
  	 <div class="section_container">
  	  <div class="row">
  	    <div class="col-lg-12">
  	     	 <div class="bs-component">
              <div class="card mb-3">
                <h3 class="card-header">
                  <a class="normal-link" href="joinView.do">
                	지금 가입하세요
                  </a>
                </h3>
    		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  				<ol class="carousel-indicators">
    			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
  				</ol>
		  			<div class="carousel-inner">
		    		  <div class="carousel-item active">
		    		   <a href="guide.do">
		    		    <img class="d-block w-100" src="${conPath }/img/4.png" alt="slide1">		      			
		      		   </a>
		    		  </div>
		    		  <div class="carousel-item">
		    		    <a href="guide.do">
		      			<img class="d-block w-100" src="${conPath }/img/picture4.png" alt="slide2">
		      			</a>
		    		  </div>
		    		  <div class="carousel-item">
		    		    <a href="guide.do">
		      			<img class="d-block w-100" src="${conPath }/img/5.png" alt="slide5">
		      			</a>
		    		  </div>
		    		  <div class="carousel-item">
		    		    <a href="guide.do">
		      			<img class="d-block w-100" src="${conPath }/img/picture6.png" alt="slide3">
		      			</a>
		    		  </div>
		    		  <div class="carousel-item">
		    		    <a href="guide.do">
		      			<img class="d-block w-100" src="${conPath }/img/picture5.png" alt="slide4">
		      			</a>
		    		  </div>		    		  
		  			</div>
  			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    		<span class="sr-only">Previous</span>
  			</a>
  			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    		<span class="sr-only">Next</span>
  			</a>
			</div>             
              <div class="card-body">
                  <a href="joinView.do" class="card-link normal-link">가입하기
                    <span class="glyphicon glyphicon-user"></span>
                  </a>
                  <a href="guide.do" class="card-link normal-link">What's quote book?</a>
              </div>
              </div>         
            </div>
  	     </div>  	    
  	   </div>
  	  </div>
  	 </div> <!-- right_section_ends -->   
  	</div> 	<!--big row -->        	  
  </div><!-- container ends -->
    <script src="${conPath }/js/jquery.min.js"></script>
    <script src="${conPath }/js/popper.min.js"></script>
    <script src="${conPath }/js/bootstrap.min1.js"></script>
    <script src="${conPath }/js/custom.js"></script>
   </body>
   
   <footer>
   <jsp:include page="footer.jsp"></jsp:include>   
   </footer>
</html>
