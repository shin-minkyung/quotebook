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
<title>Public Quote Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<link rel="stylesheet" href="${conPath }/css/paging.css">
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
	 
 });
 $(document).ready(function(){
	    $('[data-toggle="popover"]').popover(); 
	    $('[data-toggle="tooltip"]').tooltip();   
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
					<h2>Public Quote Book</h2>
					<small class="text-muted"> you can ask questions here about your quotes </small>
				  <!-- 검색바 -->
					 <jsp:include page="searchInput.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div class="row">
		 <div class="col-lg-12">
		 	<!-- <p class="highlight-big">Result Count "3", Keyword "What"</p> -->
		 </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		    <div class="relative">
		    <div class="right_container">
		      <ul>
		       <li class="list-inline-item more-padding">
		       	  <a class="normal-link" href="myQuoteView.do" data-toggle="tooltip" title="You can ask questions with your quotes">
		           <span class="shadow-btn"><span class="glyphicon glyphicon-pencil"></span> Ask a question</span>
		          </a>
		       </li>		       
		      </ul>		     
		    </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		  	<table class="caption_bar">
		  	  <tr>	
		  	  	<td></td><td><h5>Questions from ${mqlang } Quotes</h5></td>
		  	  </tr>
		  	</table>		     
		  </div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="section_container"> 
		    <c:if test="${pblist!=null }">
		     <c:forEach var="pb" items="${pblist }">
		        <div class="relative bottom-line">
		          <div class="left_container">
		            <div class="profile_wrap">
		          <c:if test="${mid!=null }">
		          <a class="normal-link" href="memberProfileView.do?mid=${pb.mid }" data-toggle="tooltip" title="profile">
		          </c:if>
		           <img src="${myUrl }/profile/${pb.mphoto }" class="profile">${pb.mname }
		          <c:if test="${mid!=null }">
		          </a>
		          </c:if>
		            <c:choose>
                  	 <c:when test="${pb.mlevel==1 }">
        			  <img class="level1" src="${conPath }/img/new.png">
                 	 </c:when>
                  	 <c:when test="${pb.mlevel==2 }">
                       <img class="level2" src="${conPath }/img/pencil.png">
                  	 </c:when>
                   	 <c:when test="${pb.mlevel==3 }">
                       <img class="level3" src="${conPath }/img/medal.png">
                  	 </c:when>
                   	 <c:when test="${pb.mlevel==4 }">
                      <img class="level4" src="${conPath }/img/crown.png">
                  	 </c:when>
                    </c:choose>
		            </div>
		           </div>
		           <div class="left-margin"> 
		          	 <p class="lead"><a class="normal-link" href="${conPath}/contentView.do?pbid=${pb.pbid}">${pb.pbtitle }</a></p>
		         	 <p>"${pb.mqquote }"</p> 
		           </div>
		           <div class="right_bottom_container">
		             <ul>
		             	<li class="list-inline-item"><em>${pb.pbdate }</em></li>
  	     			  	<li class="list-inline-item"><img src="${conPath}/img/eye.png" style="width:25px; opacity:0.6;"><span class="highlight2"> ${pb.pbhit }</span></li>
  	     			  	<li class="list-inline-item"><img src="${conPath}/img/comment.png" style="height:27px;"><span class="highlight2"> ${pb.commentCnt }</span></li>
  	     			  	<li class="list-inline-item"><img src="${conPath }/img/heart.png" style="width:25px; opacity:${pb.heartCnt==0? '0.3;':'0.9;'}"><span class="highlight2"> ${pb.heartCnt }</span></li>
  	     			  </ul>
		           </div>		        		         
		        </div>
		      </c:forEach>
		       <div class="paging">
  	     	   	<ul class="pagination">
  	     	   	 <c:if test="${paging.startPage>paging.blockSize }">
                	<li class="page-item disabled">
                 	 <a class="page-link" href="${conPath }/list.do?mqlang=${mqlang }&pageNum=${paging.startPage-1}">&laquo;</a>
                     </li>
                 </c:if>
                <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
                <c:if test="${i==pageNum }">
                	<li class="page-item active">
                   		<a class="page-link" href="#">${i }</a>
                	</li>
                </c:if>
                <c:if test="${i!=pageNum }">
                	<li class="page-item">
                	 <a class="page-link" href="${conPath }/list.do?mqlang=${mqlang }&pageNum=${i}">${i }</a>
                  	</li>
                 </c:if>                			   
                 </c:forEach> 
                <c:if test="${paging.endPage<paging.pageCnt }">
                  	<li class="page-item">
                    	<a class="page-link" href="${conPath }/list.do?mqlang=${mqlang }&pageNum=${paging.endPage-1}">&raquo;</a>
                  	</li>
                  </c:if>
                </ul>		
  	     		</div>		      	
		      </c:if>		     	             		      		        
             </div>  
		   </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">		  
  	     	
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
