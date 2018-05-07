<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach var="mp" items="${postlist }" varStatus="s">
	<tr class="text-center" style="white-space: nowrap;">
		<td>${mp.mqlang }</td>
		<td><c:choose>
				<c:when test="${fn:length(mp.pbtitle)>20 }">
				<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
					<c:out value="${fn:substring(mp.pbtitle,0,20) }"></c:out>...
				</a>
			 	</c:when>
				<c:otherwise>
				<a class="normal-link" href="contentView.do?pbid=${mp.pbid }">
			 	 ${mp.pbtitle}
			 	</a>
			 	</c:otherwise>
			</c:choose></td>
		<td><c:choose>
				<c:when test="${fn:length(mp.mqquote)>25 }">
					<c:out value="${fn:substring(mp.mqquote,0,25) }"></c:out>...
			 	</c:when>
				<c:otherwise>
			 	 ${mp.mqquote}
			 	</c:otherwise>
			</c:choose></td>
		<td>${mp.pbhit }</td>
		<td>
		 <fmt:parseDate value="${mp.pbdate}" var="mppbDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		 <fmt:formatDate value="${mppbDate }" pattern="yyyy/MM/dd"/>
		</td>
	</tr>
</c:forEach>