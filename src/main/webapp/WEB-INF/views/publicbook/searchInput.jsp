<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<script>
$(document).ready(function(){
	$("#searchBtn").click(function(){
		var cate = $("select[name='cate']").val()
		if(isNaN(cate)){
			alert('Select Type');
		}else if($("input[name='keyword']").val()==''){
			alert('Insert Keyword');
		}else{
			$("#searchForm").trigger("submit");
		}
	});	
});
</script>
<div class="right_container">
	<form id="searchForm" action="${conPath }/searchPB.do" class="form-inline my-2 my-lg-0">
		<select class="form-control" name="cate">
			<option selected="selected">condition</option>
			<option value="1">title</option>
			<option value="2">quotes</option>
			<option value="3">content</option>
			<option value="4">nickname</option>
		</select> 
		<input class="form-control mr-sm-2" type="text" name="keyword" style="width:260px;"	placeholder="Search from all languages">
		<button type="button" class="btn btn-primary my-2 my-sm-0 btn-input-left-sm" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>
		</button>
	</form>
</div>