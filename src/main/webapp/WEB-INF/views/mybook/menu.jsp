<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<body>
	<div class="col-lg-12">
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center">
				<a class="normal-link" href="${conPath }/myQuoteView.do">My Quote Book</a>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center">
				<a class="normal-link" href="${conPath }/addQuoteView.do">Add New Quote</a>
			</li>
		</ul>
	</div>
</body>
</html>