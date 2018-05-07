<!DOCTYPE html>
<%@page import="java.nio.channels.SeekableByteChannel"%>
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
<title>My Profile</title>
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
	var startRow1 =0;
	var startRow2 =0;
	var startRow3 =0;
	$('.mypost.back').click(function(){
		//alert('this');
		startRow1-=5;
		if(startRow1<0){
			startRow1=0;
		}
		$.ajax({
			url : '${conPath}/mypost.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow1,
			success : function(data, status) {
				$("#mypostTable tr:nth-child(1)").nextAll().remove();
				$("#mypostTable tr:nth-child(1)").after(data);				
			}	
		});		
	});
	$('.mypost.for').click(function(){
		//alert('that');
		startRow1+=5;
		$.ajax({
			url : '${conPath}/mypost.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow1,
			success : function(data, status) {
				if(data.trim().length!=0){
					$("#mypostTable tr:nth-child(1)").nextAll().remove();
					$("#mypostTable tr:nth-child(1)").after(data);
				}else{
					alert('no more data');
					startRow1-=5;
				}				
			}	
		});		
	});
	$('.mycomment.back').click(function(){
		//alert('this');
		startRow2-=5;
		if(startRow2<0){
			startRow2=0;
		}
		$.ajax({
			url : '${conPath}/mycomment.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow2,
			success : function(data, status) {
				$("#commentTable tr:nth-child(1)").nextAll().remove();
				$("#commentTable tr:nth-child(1)").after(data);				
			}	
		});		
	});
	$('.mycomment.for').click(function(){
		//alert('that');
		startRow2+=5;
		$.ajax({
			url : '${conPath}/mycomment.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow2,
			success : function(data, status) {
				if(data.trim().length!=0){
					$("#commentTable tr:nth-child(1)").nextAll().remove();
					$("#commentTable tr:nth-child(1)").after(data);
				}else{
					alert('no more data');
					startRow2-=5;
				}				
			}	
		});		
	});
	$('.ilike.back').click(function(){
		//alert('this');
		startRow3-=5;
		if(startRow3<0){
			startRow3=0;
		}
		$.ajax({
			url : '${conPath}/ilikedpost.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow3,
			success : function(data, status) {
				$("#ilikeTable tr:nth-child(1)").nextAll().remove();
				$("#ilikeTable tr:nth-child(1)").after(data);				
			}	
		});		
	});
	$('.ilike.for').click(function(){
		//alert('that');
		startRow3+=5;
		$.ajax({
			url : '${conPath}/ilikedpost.do',
			type : 'post',
			datatype : 'html',
			data : 'startRow='+startRow3,
			success : function(data, status) {
				if(data.trim().length!=0){
					$("#ilikeTable tr:nth-child(1)").nextAll().remove();
					$("#ilikeTable tr:nth-child(1)").after(data);
				}else{
					alert('no more data');
					startRow3-=5;
				}				
			}	
		});		
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
					<h2>Alarm History</h2>
				</div>
			</div>
		</div>
	
	  <div class="row">
	    <div class="col-lg-12">
	      <div class="section_container">
	       <h2></h2>
	        <table id="mypostTable" class="table">
		 	<tr>
			 <th></th>
			 <th>activity</th>			
			 <th>date</th>		
			</tr>
		<c:if test="${fn:length(alarmlist)==0}">
		    <td colspan="3" class="text-center">
		      <h2>No list to show</h2>
		      <img src="${conPath }/img/x-face.png" width="90">
		    </td>
		</c:if>
		<c:if test="${fn:length(alarmlist)!=0}">			
		<c:forEach var="al" items="${alarmlist }" varStatus="s">
		   <c:if test="${al.chkname!=mname }">
		      <tr style="white-space:nowrap;" class="${al.alchk==0? 'unchk':'' }">
			   <td>
			     <img src="${myUrl }/profile/${al.chkphoto}" width="43px">
			   </td>			  
		    <c:if test="${al.myidtype=='PBID' && al.chkidtype=='PBCID'}">
		        <td>			 
			 	 <span>${al.chkname } left a comment on your post</span> 			
	    	   </td>
	    	</c:if>
			<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBCID'}">
			   <td>			  
			 	 <span>${al.chkname } left a comment on your post</span> 			
	    	   </td>
			</c:if>
			<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBID' && al.almsg=='giveHeart'}">
			   <td>
			   	  <span>${al.chkname } gave a heart on your comment</span> 
			   </td>
			</c:if>
			<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBID' && al.almsg=='takeHeart'}">
			   <td>
			      <span>${al.chkname } took a heart back from your comment</span> 
			   </td>
			</c:if>
			<c:if test="${al.almsg=='MsgReceived'}">
				<td>
					 <span>${al.chkname } sent a message to you</span> 
				</td>
			</c:if>
			<c:if test="${al.almsg=='LikedYourPost'}">
				<td>
					 <span>${al.chkname } liked your post</span> 
				</td>
			</c:if>
			<c:if test="${al.almsg=='VisitedYourPage'}">
				<td>
					<span>${al.chkname } visited your profile page</span>
				</td>
			</c:if>
			 	<td>
				 	 <jsp:useBean id="now" class="java.util.Date"/>
					<fmt:parseDate value="${al.aldate}" var="aldate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:parseNumber var="aldate_M" value="${aldate.time/(1000*60) }"></fmt:parseNumber>
					<fmt:parseNumber var="now_M" value="${now.time/(1000*60) }"></fmt:parseNumber>
					<fmt:parseNumber var="aldate_H" value="${aldate.time/(1000*60*60) }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="now_H" value="${now.time/(1000*60*60) }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="aldate_D" value="${aldate.time/(1000*60*60*24) }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="now_D" value="${now.time/(1000*60*60*24) }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="min" value="${now_M-aldate_M }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="hour" value="${now_H-aldate_H }" integerOnly="true"></fmt:parseNumber>
					<fmt:parseNumber var="day" value="${now_D-aldate_D }" integerOnly="true"></fmt:parseNumber>
					<c:if test="${min<1 }">
					<span class="time">now</span>
					</c:if>
					<c:if test="${min>=1 && min<2}" >
					<span class="time">a minute ago</span>
					</c:if>
					<c:if test="${min>=2 && min<60}">
					<span class="time">${min } minutes ago</span>
					</c:if>
					<c:if test="${min>=60 && min<120 }">
					<span class="time">a hour ago</span>
					</c:if>
					<c:if test="${min>=120 && min<1440 }">
					<span class="time">${hour } hours ago</span>
					</c:if>		
					<c:if test="${min>=1440 && hour<48}">
						<span class="time">a day ago</span>						
					</c:if>
					<c:if test="${hour>=48 && hour<72 }">
						<span class="time">${day } days ago</span>			
					</c:if>
					<c:if test="${hour>=72 }">						
					</c:if>
					<span class="time">
						<fmt:formatDate value="${aldate }" pattern="HH:mm" />
						<fmt:formatDate value="${aldate }" pattern="d" />
						<fmt:formatDate var="month" value="${aldate }" pattern="MM" />						
					  <c:choose>
					    <c:when test="${month==1 }"> 
					      <c:out value="Jan"></c:out>
					    </c:when>
					     <c:when test="${month==2 }"> 
					      <c:out value="Feb"></c:out>
					    </c:when>
					     <c:when test="${month==3 }"> 
					      <c:out value="March"></c:out>
					    </c:when>
					    <c:when test="${month==4 }"> 
					      <c:out value="April"></c:out>
					    </c:when>
					     <c:when test="${month==5 }"> 
					      <c:out value="May"></c:out>
					    </c:when>
					     <c:when test="${month==6 }"> 
					      <c:out value="June"></c:out>
					    </c:when>
					     <c:when test="${month==7 }"> 
					      <c:out value="July"></c:out>
					    </c:when>
					     <c:when test="${month==8 }"> 
					      <c:out value="Aug"></c:out>
					    </c:when>
					     <c:when test="${month==9 }"> 
					      <c:out value="Sep"></c:out>
					    </c:when>
					     <c:when test="${month==10 }"> 
					      <c:out value="Oct"></c:out>
					    </c:when>
					     <c:when test="${month==11 }"> 
					      <c:out value="Nov"></c:out>
					    </c:when>
					     <c:when test="${month==12 }"> 
					      <c:out value="Dec"></c:out>
					    </c:when>					
					  </c:choose>
					  <fmt:formatDate value="${aldate }" pattern="yyyy" />
					</span>
			 	</td>			
			  </tr>			
		  </c:if> <!-- if chkname is different from loginname -->                 
		</c:forEach>
		</c:if>
           </table>
             <div class="paging">	    
	    	 <ul class="pagination">
				<c:if test="${paging.startPage>paging.blockSize }">
					<li class="page-item disabled">
					  <a class="page-link" href="${conPath }/alarmHistory.do?pageNum=${paging.startPage-1}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${paging.currentPage == i }">
						<li class="page-item active">
						  <a class="page-link"><b>${i }</b></a>
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
						<li class="page-item">
						  <a class="page-link" href="${conPath }/alarmHistory.do?pageNum=${i}">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<li class="page-item">
					  <a class="page-link" href="${conPath }/alarmHistory.do?pageNum=${paging.endPage+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
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
