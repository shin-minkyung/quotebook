<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<c:forEach var="mc" items="${mycomment }" varStatus="s">
	<tr class="text-center">
		<td>
		 <img src="${conPath }/img/heart.png" width="25" ${mc.heart==0? 'style="opacity:0.3;"':'' }>
		</td>
		<td><c:choose>
				<c:when test="${fn:length(mc.pbccontent)>60 }">
				 <a class="normal-link" href="contentView.do?pbid=${mc.pbid }">
					<c:out value="${fn:substring(mc.pbccontent,0,60) }"></c:out>......
				 </a>
				</c:when>
				<c:otherwise>
				 <a class="normal-link" href="contentView.do?pbid=${mc.pbid }">
				${mc.pbccontent!=null? mc.pbccontent:'&nbsp;' }
				</a>
				</c:otherwise>
			</c:choose></td>
		<td>
		<fmt:parseDate value="${mc.cdate}" var="mccdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		 <fmt:formatDate value="${mccdate }" pattern="yyyy/MM/dd"/>
		</td>
		
	</tr>
</c:forEach>
