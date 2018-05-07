<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	$(document).ready(function() {
		$('.dropdown-item').click(function(){
			var alid=$(this).next('.time').next('.alid').val();
			//alert("alid : "+alid);
			  $.ajax({
					url:'${conPath}/chkAlarm.do',	
					type:'get',
					datatype:'html',
					data:'alid='+alid,
					success:function(data,status){
						if(data.trim()==1){
							
						}
					}
				 });  
			
		});
	});
</script>
</head>

<c:if test="${fn:length(alarmlist)!=0 }">
	<c:forEach var="al" items="${alarmlist }">
	  <c:if test="${al.chkname!=mname }">
		<c:if test="${al.myidtype=='PBID' && al.chkidtype=='PBCID'}">
			<a class="dropdown-item" href="contentView.do?pbid=${al.myid }">			 
			   <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			   <span>${al.chkname } left a comment on your post</span> 
			   </a>
		</c:if>
		<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBCID'}">
			<a class="dropdown-item" href="commentView.do?pbcid=${al.myid }">
				 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
				 <span>${al.chkname } left a comment on your comment</span> 
			</a>
		</c:if>
		<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBID' && al.almsg=='giveHeart'}">
			<a class="dropdown-item" href="commentView.do?pbcid=${al.myid }">
			 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			 <span>${al.chkname } gave a heart on your comment</span> 
			</a>
		</c:if>
		<c:if test="${al.myidtype=='PBCID' && al.chkidtype=='PBID' && al.almsg=='takeHeart'}">
			<a class="dropdown-item" href="commentView.do?pbcid=${al.myid }">
			 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			 <span>${al.chkname } took a heart back from your comment</span> 
			</a>
		</c:if>
		<c:if test="${al.almsg=='MsgReceived'}">
			<a class="dropdown-item" href="msgView.do">
			 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			 <span>${al.chkname } sent a message to you</span> 
			</a>			
		</c:if>
		<c:if test="${al.almsg=='LikedYourPost'}">
			<a class="dropdown-item" href="msgView.do"> 
			 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			 <span>${al.chkname } liked your post</span> 
			</a>		
		</c:if>
		<c:if test="${al.almsg=='VisitedYourPage'}">
			<a class="dropdown-item" href="#"> 
			 <img src="${myUrl }/profile/${al.chkphoto}" width="33px">
			 <span>${al.chkname } visited your profile page</span> 
			</a>			
		</c:if>
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
			<span class="time">a day ago <fmt:formatDate value="${aldate }" pattern="HH:mm dd-MM"/></span>
		</c:if>
		<c:if test="${hour>=48 && hour<72 }">
			<span class="time">${day } days ago <fmt:formatDate value="${aldate }" pattern="HH:mm dd-MM"/></span>			
		</c:if>
		<c:if test="${hour>=72 }">
			<span class="time"><fmt:formatDate value="${aldate }" pattern="yy-MM-dd"/></span>
		</c:if>
		 <input type="hidden" class="alid" value="${al.alid }">
		<div class="dropdown-divider"></div>
	  </c:if>
	</c:forEach>	
	 <a class="normal-link text-center" href="alarmHistory.do">
	   <c:forEach begin="1" end="15">
	   &nbsp;
	   </c:forEach>	   
	   see all 
	 </a>
	

</c:if>
<c:if test="${fn:length(alarmlist)==0 }">
	<a class="dropdown-item text-center" href="#">
	No alarm list
	</a>
</c:if>
</html>
