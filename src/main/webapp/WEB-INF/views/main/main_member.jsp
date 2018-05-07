<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>quote book - main page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="css/qb.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css">
    <link rel="stylesheet" href="css/glyphicon.css">
    <script async src="js/ga.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    <!-- 스크립트 로그인 페이지 전환제어는 nullpointer 예외에 취약 -->
  
  </head>
 <body>
  
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
  	<div class="section_container">  
  	  <div class="row">
  	    <div class="col-lg-12">
  	      <h2>Rankings Top3</h2>
  	    </div>
  	  </div>	
  	  <div class="row">
		 <div class="col-lg-12">
		    <table class="table text-center">
					<tr>
						<th>No.</th>
						<th>Member</th>
						<th>Level</th>
						<th>Point</th>
						<th>Quotes</th>
						<th>Hearts</th>
					</tr>
					<c:forEach var="t" items="${top5 }" begin="0" end="2" varStatus="s">
					<tr class="text-center">
						<td><h5>${s.count }</h5></td>
						<td>
						  <div class="profile_ranking_wrap">
						<c:if test="${mid!=null }">
						<a class="normal-link" href="memberProfileView.do?mid=${t.mid }" data-toggle="tooltip" title="profile">
						</c:if>
						<img src="${myUrl }/profile/${t.mphoto}" class="profile center">
						<c:choose>
                  	 	  <c:when test="${t.mlevel==1 }">
        			 		 <img class="level1-ranking" src="${conPath }/img/new.png">
                 	 	  </c:when>
                  		  <c:when test="${t.mlevel==2 }">
                     		 <img class="level2-ranking" src="${conPath }/img/pencil.png">
                  	 	  </c:when>
                   	 	  <c:when test="${t.mlevel==3 }">
                      	     <img class="level3-ranking" src="${conPath }/img/medal.png">
                  		  </c:when>
                   	 	  <c:when test="${t.mlevel==4 }">
                     		 <img class="level4-ranking" src="${conPath }/img/crown.png">
                  	 	  </c:when>
                    	</c:choose>
						${t.mname }
					<c:if test="${mid!=null }">
						</a>
					</c:if>
						  </div>
						</td>
						<td>${t.mlname }</td>
						<td class="highlight_2">${t.mpoint }</td>
						<td class="highlight_2">${t.quoteCnt }</td>
						<td class="highlight_2">${t.heartCnt }</td>
					</tr>
					</c:forEach>                 
                 </table>
		 </div>
	   </div>
	  </div><!-- section4 ends -->	
  	</div><!-- left_side_section ends --> 
  <div class="col-lg-4" id="right_side_setion">
  	<div class="section_container">
  	  <div class="row">
  	      <div class="col-lg-12">
  	      <c:if test="${mid!=null }">
            <div class="card bg-light mb-3" style="max-width: 20rem;">
              <h3 class="card-header light-header">My Profile </h3>
               <div class="right_container">
                <c:choose>
                  <c:when test="${loginmember.mlevel==1 }">
                    <img class="level1-main" src="${conPath }/img/new.png">
                  </c:when>
                  <c:when test="${loginmember.mlevel==2 }">
                    <img class="level2-main" src="${conPath }/img/pencil_big.png">
                  </c:when>
                   <c:when test="${loginmember.mlevel==3 }">
                    <img class="level3-main" src="${conPath }/img/medal_big.png">
                  </c:when>
                   <c:when test="${loginmember.mlevel==4 }">
                    <img class="level4-main" src="${conPath }/img/crown_big.png">
                  </c:when>
                </c:choose>
                 <img class="img-round" src="${myUrl }/profile/${mphoto}" width="100" height="100">
               </div>
                <div class="card-body">
                  <h4 class="card-title"></h4>
                   <p class="card-text">My Quotes: <b>${myQCnt }</b></p>
                  <p class="card-text">Publicbook Posts: <b>${loginmember.postCnt }</b></p>                 
                    <p class="card-text">POINT: <span class="highlight_1">${loginmember.mpoint }</span> 
                    <p class="card-text">LEVEL: <span class="highlight_1">${loginmember.mlname }  ( ${loginmember.mlevel } )</span></p>
<!--                       <p class="card-text">your 20 answers out of 32 were given stars</p> -->
                    <p> 
                      <div class="progress">
                		<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${loginmember.progress}%" aria-valuenow="${loginmember.progress }" aria-valuemin="0" aria-valuemax="100"></div>
              		  </div>
              		</p>
                </div>
              </div><!-- profile card -->
             </c:if>
             <c:if test="${mid==null }">
               <div class="card bg-light mb-3" style="max-width: 50rem;">
				  <h3 class="card-header light-header">My Profile</h3>
				   <div class="card-body">
					 <p class="card-text">You can see your profile after login.</p>
				   </div>
			   </div> 
             </c:if>
          </div>  
  	  </div>
  	 </div>
  	 <div class="section_container">
  	  <div class="row">
  	    <div class="col-lg-12">
  	     	 <div class="bs-component">
              <div class="card mb-3">
                <h3 class="card-header">My 10 Recent Quotes</h3>
               <ul class="list-group list-group-flush">
 					<c:forEach var="myq" items="${mynew10Q}">
                  	  <li class="list-group-item ellipsis_line lightblue-bg">
                  	  <a class="normal-link" href="myQuoteView.do">${myq.mqquote }</a>
                  	  <p><small>${myq.mqdate }</small></p>
                  	  </li>
                    </c:forEach>
                	</ul>
                	<div class="card-body">
                	<c:if test="${fn:length(mynew10Q)==0 }">
                	<div style="text-align:center;">
                		<h4 style="color:gray;">The list is empty</h4>
                	 	<h4 style="color:gray;">Try to add new quotes</h4>
					    <a href="addQuoteView.do">
					    <img src="${conPath }/img/notepad.png" style="width:200px; opacity:0.5 ">
					    </a>
                	</div>
                	</c:if>
                	<c:if test="${fn:length(mynew10Q)!=0 }">
                  		<a href="${conPath }/myQuoteView.do" class="card-link normal-link">go to my quote book
                  		<span class="glyphicon glyphicon-share"></span>
                  		</a>
                  	</c:if>                  		
	                </div>    	            
              </div>        
            </div>
  	     </div>
  	    <div class="col-lg-12">
  	       <div class="bs-component">
              <div class="card mb-3">
                <h3 class="card-header">
             	 <a class="normal-link" href="guide.do">   
                	가이드 보기
                 </a>
                </h3>
  	    	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  				<ol class="carousel-indicators">
    			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>    			
  				</ol>
		  			<div class="carousel-inner">
		    		  <div class="carousel-item active">
		    		    <a href="guide.do">
		    		     <img class="d-block w-100" src="${conPath }/img/4.png" alt="slide1">		      			
		      			</a>
		    		  </div>		    		
		    		  <div class="carousel-item">
		    		    <a href="guide.do">
		      			 <img class="d-block w-100" src="${conPath }/img/picture5.png" alt="slide2">
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
                  <a href="guide.do?key=2" class="card-link normal-link">
                  	쿼트북 사용법보기
                  </a>
                  <a href="guide.do" class="card-link normal-link">쿼트북이 뭐죠?</a>
              </div>
		   </div>
		  </div>	  
		 </div>  	    
  	   </div>
  	  </div>
  	 </div> <!-- right_section_ends -->   
  	</div> 	<!--big row -->        	  
  </div><!-- container ends -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min1.js"></script>
    <script src="js/custom.js"></script>
    <script>
		$(document).ready(function(){
    		$('[data-toggle="popover"]').popover(); 
    		$('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
   </body>
    <footer>
   <jsp:include page="footer.jsp"></jsp:include>   
   </footer>
</html>
