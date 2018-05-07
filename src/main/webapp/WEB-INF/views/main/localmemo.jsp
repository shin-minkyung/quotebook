<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<html>
<script type="text/javascript">
$(document).ready(function(){
	var memo=localStorage.getItem('localmemo');
	var source=localStorage.getItem('localsource');
	$("#localmemo").html(memo);
	$("#localsource").val(source);
	
	$("#save").click(function(){
		var localmemo=$("#localmemo").val();
		var localsource=$("#localsource").val();			
		if(localmemo!=""){
			localStorage.setItem('localmemo',localmemo);			
		}
		if(localsource!=""){
			localStorage.setItem('localsource',localsource);
		}
		alert("메모가 저장되었습니다");
	});	
	
	$("#remove").click(function(){
		localStorage.clear();
		alert("메모가 삭제되었습니다");
		location.reload();
	});
});
</script>
<div class="section_container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card bg-light mb-3" style="max-width: 50rem;">
				<h3 class="card-header light-header">
				 <img src="${conPath }/img/notepad.png" width="60px;">
				쿼트북 임시메모</h3>
				<!-- <div class="right_container">
				접기
				</div> -->
				<div class="card-body">
					<p class="card-text">로그인하지 않고 메모를 저장할 수 있습니다.  데이터는 브라우저를 닫아도 저장됩니다.</p>
					<textarea class="form-control" rows="5" style="margin:10px auto;" placeholder="외국어 학습 중 반복학습하고 싶은 문장을 입력해주세요" id="localmemo"></textarea>
					
					<input type="text" class="form-control" style="margin:10px auto;" placeholder="문장의 출처를 입력해주세요. 드라마/책 제목 또는 웹페이지 URL 등" id="localsource">
					<button type="button" class="btn btn-primary btn-lg btn-block" style="width:48.3%; float:left; margin-right:10px;" id="remove">
						지우기
					</button>
					<button type="button" class="btn btn-primary btn-lg btn-block" style="width:48.8%" id="save">
						임시저장
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
</html>