<!DOCTYPE html>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="<%=request.getContextPath()%>" />
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>

<html lang="en">
<head>
<meta charset="utf-8">
<title>My Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<%-- 				<jsp:include page="menu.jsp"></jsp:include>
 --%>			</div>
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
							<h2>Member Profile</h2>
						</div>
					</div>
				</div>
				<div class="bs-component">
					<div class="relative">
						<c:if test="${mid!=null }">
							<div class="card bg-light mb-3" style="max-width: 25rem;">
								<h3 class="card-header light-header">${member.mname }'s Profile</h3>
								<div class="right_container">
								 <img class="img-round" src="${myUrl}/profile/${member.mphoto}" width="120" height="120">
								</div>
								<div class="card-body">
									<h4 class="card-title"></h4>
									<p class="card-text">Quotes: <span class="highlight_1">${member.quoteCnt }</span></p>
									<p class="card-text">Public Book Posts: <span class="highlight_1">${member.postCnt }</span></p>
									<p class="card-text">Hearts: <span class="highlight_1">${member.heartCnt }</span></p>
									<p class="card-text">
										POINT:  <span class="highlight_1">${member.mpoint } </span>
									<p class="card-text">
										LEVEL: <span class="highlight_1"> ${member.mlname } (${member.mlevel } ) </span>
									</p>
									<p>
									<c:if test="${member.mid!=mid }">
								    <div class="right_bottom_container">								    
								     <button type="button" class="btn btn-hidden" data-toggle="modal" data-target="#msg">
								      <img src="${conPath }/img/envelope2.png">
								      </button>
								    </div>
								    </c:if>
								</div>
							</div>
						</c:if>
						<c:if test="${mid==null }">
							<div class="card bg-light mb-3" style="max-width: 25rem;">
								<h3 class="card-header light-header">My Profile</h3>
								<div class="card-body">
									<p class="card-text">You can see this profile after login.</p>
								</div>
							</div>
						</c:if>
						<div class="right_container">
							<div class="card bg-light mb-3"
								style="width: 380px; height: 330px;">
								<h3 class="card-header light-header">About Me</h3>
								<div class="card-body">
									<p class="card-text"></p>
									<c:if test="${member.aboutme=='' || member.aboutme==null}">
									<p>no inserted data</p>
									</c:if>
									<p>${member.aboutme }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="section_container">
					<h2>Posts written by ${member.mname } <small>(5 recent ones)</small></h2>
					<table class="table text-center">
						<tr>
							<th>lang</th>
							<th>title</th>
							<th>quote</th>
							<th>hit</th>
							<th>date</th>							
						</tr>
						<c:forEach var="mp" items="${memberpost}" varStatus="s">
							<tr class="text-center">
							 <td>${mp.mqlang!=null? mp.mqlang:'' }</td>
							 <td>
							 <c:choose>
							 	<c:when test="${fn:length(mp.pbtitle)>25 }">
							 	<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
							 	  <c:out value="${fn:substring(mp.pbtitle,0,25) }" escapeXml="false"></c:out>...
							 	</a>
							 	</c:when>
							 	<c:otherwise>
							 	<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
							 	 ${mp.pbtitle!=null? mp.pbtitle:'' }
							 	</a>
							 	</c:otherwise>
							 </c:choose>	 			 
							 </td>
							 <td>
							 <c:if test="${fn:length(mp.mqquote)>30 }">
							   <c:out value="${fn:substring(mp.mqquote,0,30) }" escapeXml="false"></c:out>......			   
							 </c:if>
							 <c:if test="${fn:length(mp.mqquote)<=30 }">
							 ${mp.mqquote!=null? mp.mqquote:'' }
							 </c:if>
							 </td>
				  			 <td>${mp.pbhit!=null? mp.pbhit:' ' }</td>
							 <td>
							 <fmt:parseDate value="${mp.pbdate }" var="mpDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     				 <fmt:formatDate value="${mpDate }" pattern="yyyy/MM/dd"/>
							 </td>			
							</tr>                 
						</c:forEach>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="section_container">
					<h2>${member.mname }'s Comments that Received Hearts<small>(5 recent ones)</small></h2>
					<table class="table text-center">
						<tr>
							<th>heart</th>
							<th>comment</th>
							<th>date</th>
												
						</tr>
					   <c:if test="${fn:length(memberheartComments)!=0 }">
						<c:forEach var="mc" items="${memberheartComments }" varStatus="s">
							<tr class="text-center">
							 <td>
							 	<img src="${conPath }/img/heart.png" width="25" ${mc.heart==0? 'style="opacity:0.3;"':'' }>
							 </td>
							 <td> 
							   <c:choose>
								<c:when test="${fn:length(mc.pbccontent)>35 }">
								<a class="normal-link" href="contentView.do?pbid=${mc.pbid }">
								  <c:out value="${fn:substring(mc.pbccontent,0,35) }" escapeXml="false"></c:out>......
								 </a>
								</c:when>
								<c:otherwise>
								<a class="normal-link" href="contentView.do?pbid=${mc.pbid }">
								${mc.pbccontent!=null? mc.pbccontent:'&nbsp;' }
								</a>
								</c:otherwise>			   
							   </c:choose> 
							 </td>
							 <td>
							 	<fmt:parseDate value="${mc.cdate }" var="mccDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     					<fmt:formatDate value="${mccDate }" pattern="yyyy/MM/dd"/>
							 </td>
							 			 		
							</tr>                 
						</c:forEach> 
					  </c:if>
					  <c:if test="${fn:length(memberheartComments)==0 }">
					    <tr>
					      <td colspan="4"> ${member.mname } has no comments that received hearts</td>
					    </tr>
					  </c:if>
					</table>
				</div>
			</div>
		</div>


	</div> 	<!-- right_section_ends -->
   </div> <!--big row -->
  </div> <!-- container ends -->
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>

	<!-- modal -->
	
	<div class="modal fade" id="msg" role="dialog">
    <div class="modal-dialog">
    <!-- ${conPath}/claimReportWrite.do?bId=${content_view.bId }&mId=${loginId } -->
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Send a message to ${member.mname }</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <form action="sendMsg.do" method="post"> 
        <div class="modal-body">
				<input type="hidden" name="msgfrom" value="${mid }">
				<input type="hidden" name="msgto" value="${member.mid}">	
				<div class="row">				
					<div class="col-sm-12">
					<textarea class="form-control" name="msgcontent" rows="5" cols="10" style="width:450px; height:150px;" placeholder="You can check messages at My Account > Message"></textarea>
					</div>
				</div>		
          </div>
        <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Send </button>
  		 <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div> 
        </form>        
      </div>      
    </div>
  </div>
	
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
