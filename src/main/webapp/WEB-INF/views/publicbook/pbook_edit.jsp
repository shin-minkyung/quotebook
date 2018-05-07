<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Ask Question with my Quote</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${conPath }/js/reload.js"></script>
<script async src="${conPath }/js/ga.js"></script>
<script>
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-23019901-1' ]);
	_gaq.push([ '_setDomainName', "bootswatch.com" ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.byteLimit').blur(function(){                     
	    var thisObject = $(this);         
	    var limit = thisObject.attr("limitbyte"); //제한byte를 가져온다.
	    var str = thisObject.val();
	    var strLength = 0;
	    var strTitle = "";
	    var strPiece = "";
	    var check = false;                 
	    for (i = 0; i < str.length; i++){
	        var code = str.charCodeAt(i);
	        var ch = str.substr(i,1).toUpperCase();
	        //체크 하는 문자를 저장
	        strPiece = str.substr(i,1)             
	        code = parseInt(code);             
	        if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
	            strLength = strLength + 3; //UTF-8 3byte 로 계산
	        }else{
	            strLength = strLength + 1;
	        }             
	        if(strLength>limit){ //제한 길이 확인
	            check = true;
	            break;
	        }else{
	            strTitle = strTitle+strPiece; //제한길이 보다 작으면 자른 문자를 붙여준다.
	        }             
	    }         
	    if(check){
	        alert("The string greater than "+limit+"byte will be removed");
	    }         
	    thisObject.val(strTitle);         
	}); 

	$("#ask").click(function(){		
		if($("#pbtitle").val().trim()==""){
			alert("Insert Title");	
			$("#pbtitle").focus();
		}else if($("#pbcontent").val().trim()==""){
			alert("Fill the question form");
			$("#pbcontent").focus();
		}else{
			$("#writepost").trigger('submit');
		}	
	});	
});
</script>
</head>
<body>
	<!-- Navbar -->
	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- ======================-->
	<div class="page_container">
		<div class="row">
			<div class="col-lg-2 no-padding" id="left_side_section">
					<div class="row">
						<div class="col-lg-12">
							<div class="empty-space-70"></div>
						</div>
					</div>
					<div class="row">
					</div>
			</div>	
	<!-- left_side_section ends -->
	
	<div class="col-lg-9" id="right_side_setion">
	   <div class="row">
	   	<div class="col-lg-12">
	   	   <div class="empty-space-20"></div>
	   	</div>
	   </div>	
	   <div class="row">
	     <div class="col-lg-12">
	     <div class="md-margin-section">
	     	<h2>Ask about my Quote</h2>
	     	<form action="editPB.do" method="post" id="writepost">
	     	 <input type="hidden" name="pbid" value="${pbook.pbid }">
	     	<%--<input type="hidden" name="mqid" value="${quote.mqid }"> --%>
		    <table>
			  <tr>
				<td colspan="3">				
				</td>				
			  </tr>
			  <tr>
				<td colspan="3"><label for="mqquote"><h5>Quote to Ask</h5></label></td>		
			  </tr>
			  <tr>
				<td colspan="3">
                <textarea class="form-control" id="mqquote" name="mqquote" cols="120" rows="3" readonly="readonly">${pbook.mqquote }</textarea>
				</td>		
			  </tr>
			 
			  <tr>
				<td colspan="3"><label for="pbtitle"><h5>My Question about the Quote above is...</h5></label></td>		
			  </tr>
			  <tr>
			    <td colspan="3">
			       <input type="text" class="form-control byteLimit" name="pbtitle" id="pbtitle" limitbyte="150" placeholder="Insert the title of your question" value="${pbook.pbtitle!=null? pbook.pbtitle:'' }">
			    </td>
			  </tr>
			  <tr>
				 <td colspan="3">
				   <textarea class="form-control byteLimit" limitbyte="1000" name="pbcontent" id="pbcontent" rows="16" placeholder="less than 1000 byte. The text this form can contain without scrollbar is 1000 byte.(in English)  The part greater than limit will be removed">${pbook.pbcontent!=null? pbook.pbcontent:'' }
				   </textarea>
				 </td>				
			  </tr>		 
			  <tr>
				<td colspan="3">
					<button type="button" id="ask" class="btn btn-primary btn-lg btn-block">Ask away</button>
				</td>
			  </tr>
		  </table>
		  </form>
	     </div>
	   </div>
	  </div>	<!-- right_section_ends -->
	 </div>
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
