<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
${result },
<c:if test="${result==-1}">
<span style="color:red;">등록되지 않은 아이디입니다.</span>
</c:if>
<c:if test="${result==0}">
<span style="color:red;">비밀번호가 맞지 않습니다.</span>
</c:if>
<c:if test="${result==1}">
</c:if>