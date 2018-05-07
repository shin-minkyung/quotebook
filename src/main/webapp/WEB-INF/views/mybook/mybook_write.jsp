<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Add New Quote</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
$(document).ready( function() {
    //글자 byte 수 제한
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
    var result1;
    var result2;
    var result3;
    var result4;    
    $('#word1').keyup(function(){
    	var quote = $('#mqquote').val();
    	var word1 =$('#word1').val();
    	var patt= new RegExp(word1);
    	result1= patt.test(quote);
    	if(result1==false){
    		$('#word1_msg').html("<font color='red'>The word isn't in the quote</font>");
    		$('#word1').removeClass("is-valid");
    		$('#word1').addClass("is-invalid");
    	}else if(result1==true){
    		$('#word1_msg').html("<font color='#42A96C'>The word is in the quote</font>");
    		$('#word1').removeClass("is-invalid");
    		$('#word1').addClass("is-valid");
    	}
    });   
    $('#word2').keyup(function(){
    	var quote = $('#mqquote').val();
    	var word2 =$('#word2').val();
    	var patt= new RegExp(word2);
    	result2= patt.test(quote);
    	if(result2==false){
    		$('#word2_msg').html("<font color='red'>The word isn't in the quote</font>");
    		$('#word2').removeClass("is-valid");
    		$('#word2').addClass("is-invalid");
    	}else if(result2==true){
    		$('#word2_msg').html("<font color='#42A96C'>The word is in the quote</font>");
    		$('#word2').removeClass("is-invalid");
    		$('#word2').addClass("is-valid");
    	}
    });
    $('#word3').keyup(function(){
    	var quote = $('#mqquote').val();
    	var word3 =$('#word3').val();
    	var patt= new RegExp(word3);
    	result3= patt.test(quote);
    	if(result3==false){
    		$('#word3_msg').html("<font color='red'>The word isn't in the quote</font>");
    		$('#word3').removeClass("is-valid");
    		$('#word3').addClass("is-invalid");
    	}else if(result3==true){
    		$('#word3_msg').html("<font color='#42A96C'>The word is in the quote</font>");
    		$('#word3').removeClass("is-invalid");
    		$('#word3').addClass("is-valid");
    	}
    });
    $('#phrase').keyup(function(){
    	var quote = $('#mqquote').val();
    	var word4 =$('#phrase').val();
    	var patt= new RegExp(word1);
    	result4= patt.test(quote);
    	if(result4==false){
    		$('#phrase_msg').html("<font color='red'>The word isn't in the quote</font>");
    		$('#phrase').removeClass("is-valid");
    		$('#phrase').addClass("is-invalid");
    	}else if(result4==true){
    		$('#phrase_msg').html("<font color='#42A96C'>The word is in the quote</font>");
    		$('#phrase').removeClass("is-invalid");
    		$('#phrase').addClass("is-valid");
    	}
    });
    
    $('#add').click(function(){
    	if($("select[name=mqlang]").val()=="selected"){
    		alert('You must choose the language of the quote.');
    	}else if($("select[name=mqmedia]").val()=="selected"){
    		alert('You must choose the media of the source.');
    	}else if($("select[name=mqwhy]").val()=="selected"){
    		alert("You must choose why the meaning of the quote isn't clear to you.");
    	}else if($("select[name=syear]").val()=="selected"){
    		$("select[name=syear]").val("");
    	}else if(result1==false){
    		alert("Check 'word1'");
    	}else if(result2==false){
    		alert("Check 'word2'");
    	}else if(result3==false){
    		alert("Check 'word3'");
    	}else if(result4==false){
    		alert("Check 'phrase/clause'");
    	}else if($('#stitle').val().trim()==""){
    		alert("You must insert the title of the source. If it doesn't have title, you should make name for it ")
    	}else if($('#smaker').val().trim()==""){
    		alert("You must insert the maker/author of the source.")
    	}else if($('#mqquote').val().trim()==""){
    		alert("You must insert quote to add");
    	}else if($("#word1").val().length==0 && ($("#word2").val().length!=0 || $("#word3").val().length!=0)){
    		alert("Insert from the word1 field");    	
    	}else if($("#word1").val().length!=0 && $("#word2").val().length==0 && $("#word3").val().length!=0){
    		alert("No empty field between two fields filled");
    	}else if($("#meaning1").val().length!=0 && $("#word1").val().length==0){    		
    		alert("Insert word to add its meaning");
    		$("#word1").focus();
    	}else if($("#meaning2").val().length!=0 && $("#word2").val().length==0){
    		alert("Insert word to add its meaning");
    		$("#word2").focus();
    	}else if($("#meaning3").val().length!=0 && $("#word3").val().length==0){
    		alert("Insert word to add its meaning");
    		$("#word3").focus();
    	}else if($("#meaning4").val().length!=0 && $("#phrase").val().length==0){
    		alert("Insert word to add its meaning");
    		$("#phrase").focus();
    	}
    	else{
    		$("#addquote").trigger('submit');
    	}    		
    });
/*     $("#test").click(function(){
    	if($("#word1").val().length==0 && ($("#word2").val().length!=0 || $("#word3").val().length!=0)){
    		alert("Insert from the word1 field");
    	}else if($("#word1").val().length!=0 && $("#word2").val().length==0 && $("#word3").val().length!=0){
    		alert("No empty field between two fields filled");
    	}
    }); */
   
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
						<jsp:include page="menu.jsp"></jsp:include>
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
	     	<h2>Add New Quote</h2>
	     	<form action="${conPath }/addQuote.do" method="post" id="addquote">
	     	<input type="hidden" name="mid" value="${mid }">
		    <table>
			  <tr>
				<td colspan="3">
			</td>				
			  </tr>
			  <tr>
				<td colspan="3"><label for="quote"><h5>Quote to Add<span class="text-danger">*</span></h5></label></td>		
			  </tr>
			  <tr>
				<td colspan="3">
                <textarea class="form-control byteLimit" limitbyte="500" id="mqquote" name="mqquote" cols="120" rows="6" placeholder="less than 500byte. The part greater than limit will be removed"></textarea>
				</td>		
			  </tr>
			  <tr>
			  	<td colspan="3">
			  		<h5>Language<span class="text-danger">*</span></h5>
			  	</td>
			  </tr>
			  <tr>
			  	<td>
			  	 <select class="form-control" name="mqlang">
					<option value="selected">select language<span class="text-danger">*</span></option>
			    	<option value="English">English</option>
				    <option value="Korean">Korean</option>
				 	<option value="German">German</option>
				 	<option value="Chinese">Chinese</option>
				  </select></td>
			  	<td></td>
			  	<td></td>
			  </tr>
			  <tr>
				<td colspan="3"><h5>The original source<span class="text-danger">*</span></h5></td>					
			  </tr>
			  <tr>
				<td>
				 	<select class="form-control" name="mqmedia">
				 		<option value="selected">select category<span class="text-danger">*</span></option>
				 		<option value="webpage">web page</option>
				 		<option value="movie">movie</option>
				 		<option value="tvshow">TV show</option>				 		
				 		<option value="book">books</option>
				 	</select>
				</td>
				
				<td><label for="stitle">Title of the content</label><span class="text-danger">*</span> </td>
			 	<td><input type="text" class="form-control byteLimit" limitbyte="100" name="stitle" id="stitle" required="required"></td>
			  </tr>
			  <tr>
				<td></td>
				<td><label for="smaker">author/director/maker</label><span class="text-danger">*</span> </td>
				<td><input type="text" class="form-control byteLimit" limitbyte="100" name="smaker" id="smaker" required="required"></td>
			  </tr>
			  <tr>
				<td></td>
				<td><label for="surl">URL</label></td>
				<td><input type="text" class="form-control byteLimit" limitbyte="300" name="surl" id="surl"></td>
			  </tr>
			  <tr>
				<td></td>
				<td>Year</td>
				<td>
					<select class="form-control" name="syear">
				 	  <option value="">select production year</option>
				 	  <option value="16C">16C </option>
				 	  <option value="17C">17C </option>
				 	  <option value="18C">18C </option>
				 	  <option value="19C">19C </option>
				 	  <option value="1910's">1910's</option>
				 	  <option value="1920's">1920's</option>
				 	  <option value="1930's">1930's</option>
				 	  <option value="1940's">1940's</option>
				 	  <option value="1950's">1950's</option>
				 	  <option value="1960's">1960's</option>
				 	  <option value="1970's">1970's</option>
				 	  <option value="1980's">1980's</option>
				 	  <option value="1990's">1990's</option>
				 	  <option value="2000">2000</option>
				 	  <option value="2001">2001</option>	
				 	  <option value="2002">2002</option>	
				 	  <option value="2003">2003</option>	
				 	  <option value="2004">2004</option>	
				 	  <option value="2005">2005</option>	
				 	  <option value="2006">2006</option>	
				 	  <option value="2007">2007</option>	
				 	  <option value="2008">2008</option>
				 	  <option value="2009">2009</option>	
				 	  <option value="2010">2010</option>	
				 	  <option value="2011">2011</option>	
				 	  <option value="2012">2012</option>	
				 	  <option value="2013">2013</option>
				 	  <option value="2014">2014</option>
				 	  <option value="2015">2015</option>
				 	  <option value="2016">2016</option>
				 	  <option value="2017">2017</option>
				 	  <option value="2018">2018</option>						 	  
				 	</select>
				</td>
			  </tr>	
			  <tr>
				<td colspan="3"><h5>I want to revise this quote because...</h5></td>		
			  </tr>
			  <tr>
				<td>
					<select class="form-control" name="mqwhy">
				 		<option value="selected">select why*</option>
				 		<option value="voca">unfamiliar vocabulary</option>
				 		<option value="structure">unfamiliar sentence structure</option>
				 		<option value="hard">I hardly understand it</option>
				 	</select>
				 </td>
				 <td></td>
				 <td></td>
			  </tr>
			  <tr>		  	
				 <td colspan="3">
				 	<h5>I particularly need to revise these parts:</h5>
				 	<small>you can insert three words and one phrase at most. The words and phrase must be the ones in the quote inserted above.</small><br>
				 	<small>words max <b>20</b>byte | meanings max <b>200</b>byte | phrase/clause max<b>100</b>byte</small><br>
				 	<small>The fields below are optional. You may leave them empty or unchecked. You can add later at your book.</small>
				 </td>
			  </tr>
			  <tr><!-- quote에 포함이 안되는 word가 있으면 제출안되게 -->
			  	 <td><small id="word1_msg"></small> </td>
			  	 <td><input type="text"  class="form-control byteLimit" limitbyte="20" name="word1" placeholder="word1(less than 20byte)" id="word1">
			  	 </td>
				 <td><input type="text"  class="form-control byteLimit" limitbyte="95" id="meaning1" name="meaning1" placeholder="Insert meaning here.(optional)"></td>				 		
			  </tr>
			   <tr>
			  	 <td>
			  	     <small id="word2_msg"></small>
			  	 </td>
			  	 <td><input type="text"  class="form-control byteLimit" limitbyte="20" name="word2" placeholder="word2" id="word2"></td>
				 <td><input type="text"  class="form-control byteLimit" limitbyte="95" id="meaning2" name="meaning2" placeholder="Insert meaning here.(optional)"></td>				 		
			  </tr>
			  <tr>
			  	 <td>
			  		<small id="word3_msg"></small>
			  	 </td> 
			  	<td><input type="text"  class="form-control byteLimit" limitbyte="20" name="word3" placeholder="word3" id="word3"></td>
				 <td><input type="text"  class="form-control byteLimit" limitbyte="95" id="meaning3" name="meaning3" placeholder="Insert meaning here.(optional)"></td>					 		
			  </tr>
			  <tr>
				<td> <small id="phrase_msg"></small></td>
				<td><input type="text"  class="form-control byteLimit" limitbyte="100" name="phrase" placeholder="phrase/clause(less than 100byte)" id="phrase"></td>
				<td><input type="text"  class="form-control byteLimit" limitbyte="95"  id="meaning4" name="meaning4" placeholder="Insert meaning here.(optional)"></td>
			  </tr>
			  <!-- test btn -->
			 <!--  <tr>
			  	<td colspan="3">
			  	  <button type="button" id="test">go</button>
			  	</td>
			  </tr>	 -->		
			  <!-- test btn ends --> 
			  <tr>
				<td colspan="3"><h5>Note</h5></td>
			  </tr>
			  <tr>
				<td colspan="3">
					<textarea  class="form-control byteLimit" limitbyte="500"  name="mqnote" rows="6" placeholder="less than 500byte. The part greater than limit will be removed"></textarea>
				</td>		
			  </tr>
			  <tr>
			  	<td colspan="3">
			  	<div class="custom-control custom-checkbox">
			  	   <input type="checkbox" class="custom-control-input" name="mqimportant" id="mqimportant" value="1">
                   <label class="custom-control-label" for="mqimportant">This quote is important. Make it remarkable.</label>
                 </div>
			  	</td>
			  </tr>
			  <tr>
				<td colspan="3">
					<button type="button" class="btn btn-primary btn-lg btn-block" id="add">Add to My Book</button>
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
