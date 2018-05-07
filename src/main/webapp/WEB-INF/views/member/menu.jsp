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
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="empty-space-70"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<ul class="list-group">
				<li	class="list-group-item d-flex justify-content-between align-items-center">
					<a class="normal-link" href="${conPath }/editprofile.do">Edit
						Profile</a>
				</li>
				<li	class="list-group-item d-flex justify-content-between align-items-center">
					<a class="normal-link" href="${conPath }/settings.do">Settings</a>
				</li>
				<li	class="list-group-item d-flex justify-content-between align-items-center">
					<a class="normal-link" href="${conPath }/myprofile.do">My
						Profile</a>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					<a class="normal-link" href="${conPath }/msgView.do">Message</a>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					<a class="normal-link" href="${conPath }/alarmHistory.do">Alarm History</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>