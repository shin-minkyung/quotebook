<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
	<div class="row">
		<div class="col-lg-12">
			<div class="empty-space-70"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<ul class="list-group">
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					<h4>Questions from Quotes in</h4>
				</li>
				<c:forEach items="${langlist }" varStatus="s">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a class="normal-link"
						href="${conPath }/list.do?mqlang=${langlist[s.index].lname}">${langlist[s.index].lname }</a>
					</li>
				</c:forEach>
			</ul>
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
				
			</div>
		</div>
	</div>
	<!--  section3 ends -->
