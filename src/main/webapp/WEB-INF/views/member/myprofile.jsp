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
					<h2>My Profile</h2>
				</div>
			</div>
		</div>
		<div class="bs-component">
			<div class="row">
				<div class="col-lg-12">
					  <div class="relative">
					  <c:if test="${mid!=null }">					
					   <div class="card bg-light mb-3" style="max-width: 25rem;">
                        <h3 class="card-header light-header">My Profile </h3>
          			     <div class="right_container"><img class="img-round" src="${myUrl}/profile/${mphoto}" width="150"></div>
              			  <div class="card-body">
             		       <h4 class="card-title"></h4>
               			    <p class="card-text">My Quotes:<span class="highlight_1">${loginmember.quoteCnt }</span></p>
              			    <p class="card-text">Public Book Posts: <span class="highlight_1">${loginmember.postCnt }</span></p>
               			    <p class="card-text">Hearts: <span class="highlight_1">${loginmember.heartCnt }</span></p>
               		        <p class="card-text">POINT: <span class="highlight_1"> ${loginmember.mpoint }</span> 
                    		<p class="card-text">LEVEL: <span class="highlight_1">${loginmember.mlname } ( ${loginmember.mlevel } ) </span></p>
                    		<p> 
                     	  <div class="progress">
                		  <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${loginmember.progress}%" aria-valuenow="${loginmember.progress }" aria-valuemin="0" aria-valuemax="100"></div>
              		 	 </div>              	
                	   </div>
            	      </div> 
             		 </c:if>             		
              		<c:if test="${mid==null }">
              		  <div class="card bg-light mb-3" style="max-width: 25rem;">
				  	   <h3 class="card-header light-header">My Profile</h3>
				   	   <div class="card-body">
					   <p class="card-text">You can see your profile after login.</p>
				  	   </div>
			   		  </div> 
             	    </c:if>	
             	    <div class="right_container">
             	      <div class="card bg-light mb-3" style="width:380px; height:330px;">
				      <h3 class="card-header light-header">About Me</h3>
				      <div class="card-body">
					  <p class="card-text">
						<c:if test="${loginmember.aboutme==null || loginmember.aboutme==''}">
						 Introduce yourself here
						</c:if>					  
					  </p>
					   <p>${loginmember.aboutme }</p> 
					  </div>
			        </div> 
             	    </div>
             	   </div>				  
				</div>
			</div>
		</div>
	  <div class="row">
	    <div class="col-lg-12">
	      <div class="section_container">
	       <h2>My Posts</h2>
	        <table id="mypostTable" class="table text-center">
		 	<tr>
			 <th>lang</th>
			 <th>title</th>
			 <th>quote</th>
			 <th>hit</th>
			 <th>date</th>			 
			</tr>
		<c:forEach var="mp" items="${myposts }" varStatus="s">
			<tr class="text-center" style="white-space:nowrap;">
			 <td>${mp.mqlang!=null? mp.mqlang:'' }</td>
			 <td>
			 	<c:choose>
			 	<c:when test="${fn:length(mp.pbtitle)>20 }">
			 	<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
			 	  <c:out value="${fn:substring(mp.pbtitle,0,20) }" escapeXml="false"></c:out>...
			 	</a>
			 	</c:when>
			 	<c:otherwise>
			 	<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
			 	 ${mp.pbtitle!=null? mp.pbtitle:''}
			 	 </a>
			 	</c:otherwise>
			 </c:choose>
			 </td>
			 <td>
			 	<c:choose>
			 	<c:when test="${fn:length(mp.mqquote)>25 }">
			 	  <c:out value="${fn:substring(mp.mqquote,0,25) }" escapeXml="false"></c:out>...
			 	</c:when>
			 	<c:otherwise>
			 	 ${mp.mqquote!=null? mp.mqquote:''}
			 	</c:otherwise>
			 </c:choose>
			 </td>
  			 <td>${mp.pbhit!=null? mp.pbhit:'' }</td>
			 <td>
			 <fmt:parseDate value="${mp.pbdate }" var="mppbDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     <fmt:formatDate value="${mppbDate }" pattern="yyyy/MM/dd"/>
			 </td>			
			</tr>                 
		</c:forEach>
           </table>
             <div class="paging">	    
	    	  <button type="button" class="btn btn-primary mypost back">&laquo;</button>
	    	  <button type="button" class="btn btn-primary mypost for">&raquo;</button>
	         </div>
           </div>
	    </div>	     
	  </div>
	  
	  <div class="row">
	    <div class="col-lg-12">
	     <div class="section_container">
	      <h2>My Comments</h2>
	       <table id="commentTable" class="table text-center" style="white-space:nowrap;">
			<tr>
			 <th>heart</th>
			 <th>comment</th>
			 <th>date</th>	
					
			</tr>
			<c:forEach var="mc" items="${mycomments }" begin="0" end="4" varStatus="s">
			<tr class="text-center">
			 <td>	   
			 	<img src="${conPath }/img/heart.png" width="25" ${mc.heart==0? 'style="opacity:0.3;"':'' }>
			 </td>
			 <td> 
			   <c:choose>
				<c:when test="${fn:length(mc.pbccontent)>60 }">
				 <a class="normal-link" href="contentView.do?pbid=${mc.pbid }">
				  <c:out value="${fn:substring(mc.pbccontent,0,60) }" escapeXml="false"></c:out>......
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
           </table>
              <div class="paging">
          		<button type="button" class="btn btn-primary mycomment back">&laquo;</button>
	   			<button type="button" class="btn btn-primary mycomment for">&raquo;</button>
	   		  </div>           
           </div>
	    </div>    
	    	    
	  </div>
	  
	  <div class="row">
	    <div class="col-lg-12">
	     <div class="section_container">
	      <h2>My Favorite Posts</h2>
	       <table id="ilikeTable" class="table text-center" style="white-space:nowrap;">
			<tr>
			 <th>lang</th>
			 <th>title</th>
			 <th>quote</th>
			 <th>hit</th>
			 <th>date</th>			 
			</tr>
			<c:forEach var="like" items="${ilikedposts }" varStatus="s">
			<tr class="text-center">
			 <td>${like.mqlang!=null? like.mqlang:'' }</td>
			 <td>
			 <c:choose>
			 	<c:when test="${fn:length(like.pbtitle)>25 }">
			 	<a class="normal-link" href="contentView.do?pbid=${like.pbid }">
			 	  <c:out value="${fn:substring(like.pbtitle,0,25) }" escapeXml="false"></c:out>...
			 	</a>
			 	</c:when>
			 	<c:otherwise>
			 	<a class="normal-link" href="contentView.do?pbid=${like.pbid }">
			 	 ${like.pbtitle!=null? like.pbtitle:'' }
			 	</a>
			 	</c:otherwise>
			 </c:choose>	 			 
			 </td>
			 <td>
			 <c:if test="${fn:length(like.mqquote)>30 }">			 
			   <c:out value="${fn:substring(like.mqquote,0,30) }" escapeXml="false"></c:out>......						   
			 </c:if>
			 <c:if test="${fn:length(like.mqquote)<=30 }">
			 ${like.mqquote!=null? like.mqquote:'' }
			 </c:if>
			 </td>
  			 <td>${like.pbhit!=null? like.pbhit:' ' }</td>
			 <td>			 
			 <fmt:parseDate value="${like.pbdate }" var="likepbDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     <fmt:formatDate value="${likepbDate }" pattern="yyyy/MM/dd"/>
			 </td>			
			</tr>                 
		</c:forEach>                 
           </table>
            <div class="paging">
             <button type="button" class="btn btn-primary ilike back">&laquo;</button>
	    	 <button type="button" class="btn btn-primary ilike for">&raquo;</button>
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
