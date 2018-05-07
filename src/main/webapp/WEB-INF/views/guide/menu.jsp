<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<script type="text/javascript">
$(document).ready(function(){
	 
});
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="empty-space-70"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div id="sec1_title" class="padding-top-bottom">Guide in English</div>
			<div id="section1" class="hide">
				<ul>
				  <li class="list-items">
				  What's quote book?
				  </li>
				  <li class="list-items">
				  What's public book?</li>
				  <li class="list-items">
				  How to join</li>
				  <li class="list-items">
				  level system</li>				  	
				</ul>					
			</div>
			<div id="sec2_title" class="padding-top-bottom">한국어 설명서</div>
			<div id="section2">
				<ul>
				  <li class="list-items">
				  	<a class="normal-link" href="guide.do?key=5">
					  가입방법
				  	</a>
				  </li>
				  <li class="list-items">
				   <a class="normal-link" href="guide.do?key=1">
				  "quote book(쿼트북)"이 뭐예요?
				   </a>
				  </li>
				  <li class="list-items">
				   <a class="normal-link" href="guide.do?key=2">
				  	쿼트북 사용하기
				   </a>
				  </li>
				  <li class="list-items">
				  <a class="normal-link" href="guide.do?key=3">
				 	 "public book(퍼블릭북)"은 뭐죠?
				  </a>
				  </li>				
				  <li class="list-items">
				  	<a class="normal-link" href="guide.do?key=4">
				  		레벨과 포인트
				  	</a>
				  </li>
				  <li class="list-items">
				  	<a class="normal-link" href="guide.do?key=6">
				  		커뮤니티 기능
				  	</a>
				  </li>				  
				</ul>
			</div>		
		
		</div>
	</div>
</body>
</html>

