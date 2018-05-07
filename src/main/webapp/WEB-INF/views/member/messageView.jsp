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
<title>My Message</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<link rel="stylesheet" href="${conPath }/css/paging.css">
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
</head>
<body>
<c:if test="${param.sendResult==1 }">
	<script>
		alert("Your message has been sent successfully");
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
					<h2>Message</h2>
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
  	     			  			<a class="nav-link ${(tome==1||tome==null)? 'active':'' }" data-toggle="tab" href="#received">Inbox</a>
  	     			  		</li>
  	     			  		 <li class="nav-item">
  	     			  			<a class="nav-link ${tome==0? 'active':'' }" data-toggle="tab" href="#sent">Sent</a>
  	     			  		</li> 	     			  		  	     			  	
  	     				</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			  <div class="tab-pane fade ${(tome==1||tome==null)? 'show active in show':'' }" id="received">
  	     			  	<!-- received message -->  	     			  	
  	     			  	<c:if test="${msgIgotCnt==0 }">
  	     			  	 <div class="relative-msg much-padding text-center">
  	     			  	     <h4>You have no message received</h4>		  	  
  	     			  	  </div>
  	     			  	  </c:if>
  	     			  	 <c:forEach items="${msgIgot }" var="msg1" varStatus="s">
  	     			  	  <div class="relative-msg bottom-line">  	     			  	   
  	     			  	   <div class="left_container">
  	     			  	     <img src="${myUrl }/profile/${msg1.mphoto}" width="70" style="display:block;"><small>from ${msg1.mname }</small>
  	     			  	     <div class="inbox">
  	     			  	     <img src="${conPath }/img/inbox.png" width="36px">
  	     			  	     </div> 			  	     
  	     			  	   </div>
  	     			  	   <div class="left-margin">
  	     			  	      <c:choose>
  	     			  	       <c:when test="${fn:length(msg1.msgcontent)>60 }">
  	     			  	         <a class="normal-link" href="msgtomeContentView.do?msgid=${msg1.msgid }">
  	     			  	         <c:out value="${fn:substring(msg1.msgcontent,0,60) }" escapeXml="false"></c:out>  	     			  	         
  	     			  	         <span class="seemore">...see more>></span>
  	     			  	          <c:if test="${msg1.msgchk==0 }">
  	     			  	   	     <img src="${conPath }/img/new_1.png">
  	     			  	   	 	</c:if>
  	     			  	         </a>
  	     			  	         <input type="hidden" class="sentContent" value="${msg1.msgcontent }">
  	     			  	       </c:when>
  	     			  	       <c:otherwise>
  	     			  	       <p>
  	     			  	       <a class="normal-link" href="msgtomeContentView.do?msgid=${msg1.msgid }">
  	     			  	        ${msg1.msgcontent } 
  	     			  	        <c:if test="${msg1.msgchk==0 }">
  	     			  	   	     <img src="${conPath }/img/new_1.png">
  	     			  	   	 	</c:if>
  	     			  	   	 	</a>
  	     			  	   	 	</p>
  	     			  	       </c:otherwise>
  	     			  	     </c:choose>  
  	     			  	   	 
  	     			  	   	 
  	     			  	   </div>
  	     			  	   <div class="right_bottom_container_close">
		             		<ul>
		             		 <li class="list-inline-item"><em>
		             		 <jsp:useBean id="now" class="java.util.Date"/>
<%-- 							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a hh:mm" />
								<fmt:formatDate value="${now}" pattern="yyyyMMdd" /> --%>
		             		 <fmt:parseDate value="${msg1.msgdate }" var="mdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		             		 <fmt:formatDate value="${mdate }" pattern="yyyy/MM/dd"/>		            
		             		  </em></li>
  	     			  		 <li class="list-inline-item">
  	     			  		 <button type="button" class="btn btn-hidden" data-toggle="modal" data-target="#msg${s.count }">
  	     			  		 <span class="glyphicon glyphicon-pencil"></span>Reply
  	     			  		 </button>
  	     			  		 </li>
  	     			  		 <li class="list-inline-item"><span class="glyphicon glyphicon-trash"></span>Delete</li>
  	     			  		 <li class="list-inline-item">
  	     			  		 <button type="button" class="btn btn-hidden" data-toggle="modal" data-target="#report${s.count }">
  	     			  		 <span class="glyphicon glyphicon-exclamation-sign"></span>Report
  	     			  		 </button>
  	     			  		 </li>
  	     			  		</ul>
		           		   </div>
  	     			  	  </div> 
  	     			  	  </c:forEach>       
  	     			  	  <div class="paging">
							<ul class="pagination">
								<c:if test="${paging1.startPage>paging1.blockSize }">
									<li class="page-item disabled">
									  <a class="page-link" href="${conPath }/msgView.do?pageNum=${paging.startPage-1}&tome=1">&laquo;</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${paging1.startPage }" end="${paging1.endPage }">
									<c:if test="${paging1.currentPage == i }">
										<li class="page-item active">
										  <a class="page-link"><b>${i }</b></a>
										</li>
									</c:if>
									<c:if test="${paging1.currentPage != i }">
										<li class="page-item">
										  <a class="page-link" href="${conPath }/msgView.do?pageNum=${i}&tome=1">${i }</a>
										</li>
									</c:if>
								</c:forEach>
								<c:if test="${paging1.endPage<paging1.pageCnt }">
									<li class="page-item">
									  <a class="page-link" href="${conPath }/msgView.do?pageNum=${paging1.endPage+1}&tome=1">&raquo;</a>
									</li>
								</c:if>
							</ul>
						</div><!-- paging ends --> 	  
  	     			  </div>
  	     			  
  	     			  <div class="tab-pane fade ${tome==0? 'show active in show':'' }" id="sent">
  	     			  	<!-- sent message -->
  	     			  	<c:forEach items="${msgIsent }" var="msg2">
  	     			  	  <div class="relative-msg bottom-line">
  	     			  	   <div class="left_container">
  	     			  	     <img src="${myUrl }/profile/${msg2.mphoto}" width="70" style="display:block;"><small>to ${msg2.mname }</small>
  	     			  	     <div class="inbox">
  	     			  	      <img src="${conPath }/img/outbox.png" width="36px">
  	     			  	     </div> 	   	     			  	     
  	     			  	   </div>
  	     			  	   <div class="left-margin msgcontent">  	     			  	     
  	     			  	     <c:choose>
  	     			  	       <c:when test="${fn:length(msg2.msgcontent)>60 }">
  	     			  	         <a class="normal-link" href="msgfrommeContentView.do?msgid=${msg2.msgid }">
  	     			  	         <c:out value="${fn:substring(msg2.msgcontent,0,60) }" escapeXml="false"></c:out>  	     			  	         
  	     			  	         <span class="seemore">...see more</span>
  	     			  	         </a>
  	     			  	         <input type="hidden" class="sentContent" value="${msg2.msgcontent }">
  	     			  	       </c:when>
  	     			  	       <c:otherwise>
  	     			  	       <p>${msg2.msgcontent }</p>
  	     			  	       </c:otherwise>
  	     			  	     </c:choose>  	     			  	   	 
  	     			  	   </div>
  	     			  	    <script type="text/javascript">
  	     			  	    	$(document).ready(function(){
  	     			  	    		$(".seemore").click(function(){
  	     			  	    			var msgcontent =$(this).siblings(".sentContent").val();
  	     			  	    			$(this).closest(".msgcontent").html(msgcontent);
  	     			  	    		});
  	     			  	    	});
  	     			  	    </script>
  	     			  	   <div class="right_bottom_container_close">
		             		<ul>
		             		 <li class="list-inline-item"><em>
		             		 <fmt:parseDate value="${msg2.msgdate }" var="mdate2" pattern="yyyy-MM-dd HH:mm:ss"/>
		             		 <fmt:formatDate value="${mdate2 }" pattern="yyyy/MM/dd"/>
		             		 </em></li>
  	     			  		 <li class="list-inline-item">  	     			  		 
  	     			  		 <span class="${msg2.msgchk==0? 'glyphicon glyphicon-unchecked':'glyphicon glyphicon-check' }"></span> 
  	     			  		 ${msg2.msgchk==0? 'unread':'read'}
  	     			  		 </li>  	     			  		 
  	     			  		</ul>
		           		   </div>
  	     			  	  </div> 
  	     			  	 </c:forEach>
  	     			  	 <div class="paging">
							<ul class="pagination">
								<c:if test="${paging2.startPage>paging2.blockSize }">
									<li class="page-item disabled">
									  <a class="page-link" href="${conPath }/msgView.do?pageNum=${paging.startPage-1}&tome=0">&laquo;</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${paging2.startPage }" end="${paging2.endPage }">
									<c:if test="${paging2.currentPage == i }">
										<li class="page-item active">
										  <a class="page-link"><b>${i }</b></a>
										</li>
									</c:if>
									<c:if test="${paging2.currentPage != i }">
										<li class="page-item">
										  <a class="page-link" href="${conPath }/msgView.do?pageNum=${i}&tome=0">${i }</a>
										</li>
									</c:if>
								</c:forEach>
								<c:if test="${paging2.endPage<paging2.pageCnt }">
									<li class="page-item">
									  <a class="page-link" href="${conPath }/msgView.do?pageNum=${paging2.endPage+1}&tome=0">&raquo;</a>
									</li>
								</c:if>
							</ul>
						</div><!-- paging ends --> 	   
  	     			  </div> 
  	     			</div>   	     			 
  	     		  </div>
  	     		</div>				
                  		    
                  		
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

	<!-- Message modal -->
  <c:forEach var="msg" items="${msgIgot }" varStatus="s">
	<div class="modal fade" id="msg${s.count }" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Send a message to ${msg.mname }</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <form action="sendMsg.do" method="post"> 
        <div class="modal-body">        	
				<input type="hidden" name="msgfrom" value="${mid }">
				<input type="hidden" name="msgto" value="${msg.msgfrom}">					
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
</c:forEach>
<!-- Report Modal -->
 <c:forEach var="msg" items="${msgIgot }" varStatus="s">
  <div class="modal fade" id="report${s.count }" role="dialog">
    <div class="modal-dialog">
    <!-- ${conPath}/claimReportWrite.do?bId=${content_view.bId }&mId=${loginId } -->
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"><span class="glyphicon glyphicon-exclamation-sign"></span> Report Inappropriate Contents</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div class="modal-body">
        	<form action="#" method="post"> 
				<input type="hidden" name="mid" value="${mid }">
				<input type="hidden" name="msgfrom" value="${msg.msgfrom}">
				<div class="row">
					<div class="col-sm-4">reporter</div>
					<div class="col-sm-8">${mname }</div>
				</div>									
				<div class="row">
					<div class="col-sm-4"><strong></strong></div>
					<div class="col-sm-8"></div>
				</div>			
				<div class="row">
					<div class="col-sm-4">content</div>
					<div class="col-sm-8">${msg.msgcontent }</div>
				</div>	
				<div class="row">
					<div class="col-sm-12"></div>
				</div>
				<div class="row">
					<div class="col-sm-4" style="white-space:nowrap;">why it is inappropriate:</div>
					<div class="col-sm-8">
						<select class="form-control" name="" style="width:200px;">
						 <option>Offensive Expression</option>
						 <option>Illegal Contents Share</option>
						 <option>etc</option>
						</select>
					</div>
				</div>
			</form> 		
          </div>
        <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Report</button>
  		 <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>        
      </div>      
    </div>
  </div>	
</c:forEach>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
