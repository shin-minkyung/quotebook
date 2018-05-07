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
<title>My Quote Book</title>
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
												
						</div>
					</div>
					
						<!-- section1 ends -->
	<div class="section_container">
		<div class="row">
			<div class="col-lg-12">
				<h2></h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div>
	</div>
	<!-- section2 ends -->
	<div class="section_container">
		<div class="row">
			<div class="col-lg-12">
				<!-- <div class="card bg-light mb-3" style="max-width: 50rem;">
					<h3 class="card-header light-header">Card Header</h3>
					<div class="card-body">
						<p class="card-text"></p>
					</div>
				</div> -->
			</div>
		</div>
	</div>
	<!--  section3 ends -->
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
					<h2>Rankings Top5</h2>	
					<small class="text-muted">The list of members who used our service and help others most.</small>
				</div>
			</div>
		</div>
		<div class="row">
		 <div class="col-lg-12">
		   <div class="relative">
		     <div class="right_container">
		     </div>
		   </div>
		 </div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="section_container">	     
                 <table class="table text-center">
					<tr>
						<th>No.</th>
						<th>Member</th>
						<th>Level</th>
						<th>Point</th>
						<th>Quotes</th>
						<th>Hearts</th>
					</tr>
					<c:forEach var="t" items="${top5 }" varStatus="s">
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
						<span>${t.mname }</span>
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
		</div>		     		
	</div>	<!-- right_section_ends -->
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover(); 
	    $('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
	
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
