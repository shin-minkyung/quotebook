<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="<%=request.getContextPath()%>" />
<html lang="en">
<head>
<meta charset="utf-8">
<title>My Quote Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<link rel="stylesheet" href="${conPath }/css/paging.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${conPath }/js/jquery.her.js"></script>
<script async src="${conPath }/js/ga.js"></script>
<script src="${conPath }/js/reload.js"></script>


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
	$(document).ready(function() {
		$(document).on('blur','.byteLimit',function(){                     
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
		var mqid;
		var wordsCnt;
		$('.addNote').click(function() {//db에 null아닌 word 몇개인지 체크하고 3미만일때만 실행되게하기
			wordsCnt = parseInt($(this).children(".wordsCnt").val());		
			mqid = $(this).children(".mqid").val();
			var tag = "<div class='addQuote_msg'></div><form action='addQuoteAjax.do' class='form-inline my-2 my-lg-0'><input type='hidden' name='mqid' value='"+mqid+"'><input type='hidden' name='wordsCnt' value='"+wordsCnt+"'><input type='text' class='form-control byteLimit wordtxt' limitbyte='20' name='word"+(wordsCnt+1)+"' placeholder='word'><textarea cols='70' rows='1' class='byteLimit form-control meaningtxt' limitbyte='95' name='meaning"+(wordsCnt+1)+"' placeholder='meaning'></textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left-sm addquoteBtn'><span class='glyphicon glyphicon-pencil'></span></button></form>";
			//$('.text-info').after($(tag));		
			if(wordsCnt==3){
				alert("You can insert three words maximum");
			}else{
				$(this).css("display","none");		
				$(this).closest('.qwrap').children(".quote").last().after($(tag));
			}
		});	
		
		$('.meaningWrap').one('click',function(){
			var meaning = $(this).children(".meaning").text();
			var no = $(this).children(".meaningNo").val();
			var modifyMqid= $(this).closest('.qwrap').children('.mqid').val();
			var meaningform ="<form action='${conPath}/meaningModify.do' class='form-inline my-2 my-lg-0'><input type='hidden' class='no' name='no' value='"+no+"'><input type='hidden' class='mqid' name='mqid' value='"+modifyMqid+"'><textarea cols='95' rows='1' class='byteLimit meaningtxt form-control' limitbyte='95' name='meaning"+no+"' placeholder='meaning'>"+meaning+"</textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left-sm modifyBtn'><span class='glyphicon glyphicon-pencil'></span></button></form>";
			$(this).append($(meaningform));
			//alert('meaning : '+meaning);
			//alert('meaning'+no+' mqid '+modifyMqid);
		});
		$(document).on('click','.modifyBtn',function(){
			if($(this).siblings('.meaningtxt').val().trim()==''){
				alert('The meaning field is empty');				
			}else{
				var no = $(this).siblings('.no').val();
				var mqid = $(this).siblings('.mqid').val();
				var meaning = $(this).siblings('.meaningtxt').val();
				//alert('no :'+no+' mqid :'+mqid+' meaning :'+meaning);
				//$(this).closest('form').trigger('submit');
				 $.ajax({
					url : '${conPath}/meaningModify.do',
					type : 'post',
					datatype : 'html',
					data : 'no='+no+'&mqid='+mqid+'&meaning'+no+'='+meaning,
					context: this,
					success : function(data, status) {
						var trimdata= data.trim();
						var result = parseInt(trimdata);
						if(result==1){							
							var meaning=trimdata.substring(trimdata.indexOf(',')+1,trimdata.length);
							//$('.meaning').append(meaning);
							$(this).closest('.meaningWrap').children('.meaning').html(meaning);
							$(this).closest('form').remove();							
							//alert(meaning);
						}						
					}
				});
			}
		});
		$(".deleteQuote").click(function(){
			var removingMqid =$(this).closest('.qwrap').children('.mqid').val();
			var sure = confirm('Are you sure? The data will be removed permanently');
			if(sure==true){
				//alert('mqid to delete: '+removingMqid);
				$.ajax({
					url : '${conPath}/deleteQuote.do',
					type : 'post',
					datatype : 'html',
					data : 'mqid='+removingMqid,
					success : function(data, status) {
						//alert(data.trim());
						if(parseInt(data.trim())==1){							
							alert('Delete Success');
							location.reload();
						}						
					}
				});
			}else{
				//alert('remove cancelled');	
			}			
		});	
		var result;
		$(document).on('keyup','.wordtxt',function(){
			var quotetxt=$(this).closest('.qwrap').children('.quote').children('.mqquote').text(); //only direct children can be searched with class names
			var wordtxt= $(this).val();
			var patt= new RegExp(wordtxt);
			result = patt.test(quotetxt);
			if(result==false){
				$(this).closest('form').siblings('.addQuote_msg').html("<font color='red'>The word isn't in the quote</font>");
				$(this).addClass("is-invalid");
			}else{
				$(this).closest('form').siblings('.addQuote_msg').html("<font color='#42A96C'>The word is in the quote</font>");
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
			}				
			//alert('quotetxt: '+quotetxt);
			//alert('wordtxt: '+wordtxt);			
		});
		$(document).on('click','.addquoteBtn',function(){
			//alert("mqid of this "+mqid+" wordsCnt: "+wordsCnt);
			var real_mqid = $(this).closest('form').siblings('.mqid').val();
			wordsCnt = $(this).closest('form').siblings('.wordsCnt').val();
			//alert("real mqid  "+real_mqid+" wordsCnt "+wordsCnt);
			
			if($(this).siblings('.wordtxt').val().trim()==''){
				alert('The word field is empty');
			}else if($(this).siblings('.meaningtxt').val().trim()==''){
				alert('The meaning field is empty');
			}else if(result==false){
				alert('Check the word');
			}else{
				$(this).closest('form').trigger('submit');
				/* $.ajax({
					url : '${conPath}/addQuoteAjax.do',
					type : 'post',
					datatype : 'html',
					data : 'mqid='+real_mqid+'&wordsCnt='+wordsCnt,
					success : function(data, status) {
						//alert(data.trim());
												
					}
				}); */
			}
		});
		
		$(".wordcard").click(function(){
			var card_meaning=$(this).children(".card_meaning").val();
			//alert("meaning "+card_meaning);
			$(this).addClass("wordcard-clicked");
			$(this).children("div").addClass("wordcard-clicked");
			$(this).children("h3").addClass("wordcard-clicked");
			$(this).children(".card-body").children(".card-text").html(card_meaning);
		});
		$("#reset").click(function(){
			$('.wordcard').removeClass("wordcard-clicked");	
			$('.wordcard').children("div").removeClass("wordcard-clicked");
			$('.wordcard').children("h3").removeClass("wordcard-clicked");
			$('.wordcard').children(".card-body").children(".card-text").empty();
		});
		
		/* var word1=$(".word1").text();
		//alert('word1'+word1);
		$(".mqquote:contains('"+word1+"')").each(function(){
			var regex = new RegExp(word1,'gi');
			$(this).html( $(this).text().replace(regex, "<b>"+word1+"</b>") );
		}); */

	});
</script>
</head>
<body>
<c:if test="${param.insertresult==1 }">
	<script type="text/javascript">
		alert('Quote Add Success');	
	</script>
</c:if>
	<!-- Navbar -->
	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
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
				<!-- section1 ends -->
			</div>
			<!-- left_side_section ends -->
			<div class="col-lg-9" id="right_side_setion">
				<div class="section_container">
					<div class="row">
						<div class="col-lg-12">
							<div class="empty-space-20"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<h2>My Quote Book</h2>
							<!-- 검색바 -->
							<jsp:include page="searchInput.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="section_container">
							<table class="table text-center">
								<tr>
									<th>Quotes</th>
									<th>language</th>
									<th>words</th>
									<th>phrase/clause</th>
								</tr>
								<tr class="text-center">
									<td>${myQCnt }</td>
									<td>${mylangCnt }</td>
									<td>${myWordCnt }</td>
									<td>${myPhraseCnt }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<c:set var="langCnt" value="0"></c:set>
					<div class="col-lg-12">
						<div class="bs-component">
						 <ul class="nav nav-tabs">	
							 <c:if test="${fn:length(mylanglist)==0 }">
							    <li class="nav-item">
							      <a class="nav-link active" data-toggle="tab" href="#null">
							        your quote language							        
							      </a>
							    </li>
							  </c:if>								
							 <c:if test="${fn:length(mylanglist)!=0 }">					
								<c:forEach var="ml" items="${mylanglist }" varStatus="i">
									<c:forEach var="ll" items="${langlist }" varStatus="j">
										<c:if test="${langlist[j.index].lname==mylanglist[i.index].lname }">
											<c:set var="langCnt" value="${langCnt+1 }"></c:set>
											<li class="nav-item">
											  <a class="nav-link ${(langCnt==1 && param.important==null)? 'active':'' }" data-toggle="tab" href="#${langlist[j.index].lname }">
											  ${langlist[j.index].lname } <span class="badge badge-primary badge-pill">${mylanglist[i.index].langCnt }</span>
											  </a>
											</li>
										</c:if>
									</c:forEach>
								</c:forEach>	
								<c:if test="${importantQCnt!=0 }">							
								<li class="nav-item">
								   <a class="nav-link ${param.important!=null? 'active':'' }" data-toggle="tab" href="#important">important quotes <span class="badge badge-primary badge-pill">${importantQCnt }</span></a>
								</li>
								</c:if>
								<li class="nav-item">
								  <a class="nav-link" data-toggle="tab"	href="#words">word cards</a></li>
								<li class="nav-item">
								  <a class="nav-link" data-toggle="tab"	href="#quiz">Quiz</a>
								</li>
							</c:if>
							</ul>
							<div id="myTabContent" class="tab-content">
							 <c:if test="${fn:length(mylanglist)==0 }">
							   <div class="tab-pane fade show active in show" id="null" style="text-align:center; padding:30px;" >
							     <h2 style="color:gray;">Try to Add New Quotes</h2>
							     <a href="addQuoteView.do">
							     <img src="${conPath }/img/notepad.png" style="width:200px; opacity:0.5 ">
							     </a>					   
							   </div>							   
							 </c:if>												
							 <c:if test="${fn:length(mylanglist)!=0 }">
								<c:set var="langCnt2" value="0"></c:set>
								<c:forEach var="ml_tab" items="${mylanglist }" varStatus="i">
									<c:forEach var="ll_tab" items="${langlist }" varStatus="j">
										<c:if test="${langlist[j.index].lname==mylanglist[i.index].lname }">
											<c:set var="langCnt2" value="${langCnt2+1 }"></c:set>
											<c:set var="lang" value="${langlist[j.index].lname }"></c:set>
											<div class="tab-pane fade ${(langCnt2==1 && param.important==null)? 'show active in show':'' }" id="${lang }">
												<c:forEach var="q" items="${myquotelist[langCnt2-1] }">
													<div class="qwrap relative bottom-line">
														<h4>
															<small class="text-muted">words:</small> 
															<span class="word1">
															${(q.word1!=null && q.word1!='')? q.word1:'' }
															</span>
															${(q.word2!=null && q.word2!='')? ', ':'' }
															<span class="word2">
															${(q.word2!=null && q.word2!='')? q.word2:'' }
															</span>
															${(q.word3!=null && q.word3!='')? ', ':'' }
															<span class="word3">
															${(q.word3!=null && q.word3!='')? q.word3:'' }
															</span>
														</h4>
														<h4>
															<small class="text-muted">phrase/clause:</small>
															<span class="phrase">
															${q.phrase!=null? q.phrase:'' }
															</span>
														</h4>

														<div class="quote">
															<span class="mqquote">${q.mqquote }</span> 
															<small class="text-muted">from ${q.stitle!=null? q.stitle:'' } by ${q.smaker!=null? q.smaker:'' }</small>
															<c:if test="${q.surl!=null }">
																<a class="black" href="${q.surl }" target="_blank">
																<span class="glyphicon glyphicon-link"></span>
																</a>
															</c:if>
														</div>
														<div class="right_container">
															<ul>
																<li class="list-inline-item">
																<fmt:parseDate value="${q.mqdate}" var="mqdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		 														<fmt:formatDate value="${mqdate }" pattern="yyyy-MM-dd"/>
																</li>
																<li class="list-inline-item">
																  <div class="addNote">
																     <input type="hidden" class="mqid" value="${q.mqid }">
																     <input type="hidden" class="wordsCnt" value="${q.wordsCnt }">
																	 <span class="glyphicon glyphicon-plus"></span>add a word
																  </div>
																</li>
																<li class="list-inline-item">
																  <a class="black" href="${conPath }/postQuoteView.do?mqid=${q.mqid}">
																  <span class="glyphicon glyphicon-pencil"></span> ask questions</a>
																</li>
																<li class="list-inline-item deleteQuote">																 
																   <span class="glyphicon glyphicon-trash"></span>remove
																</li>
																<c:if test="${q.mqimportant==1 }">
																	<li class="list-inline-item">
																	<span class="glyphicon glyphicon-star"></span>important
																	</li>
																</c:if>
															</ul>
														</div>
														<c:forEach var="i" begin="1" end="3" varStatus="s">
														 <c:set var="idx">word${i }</c:set>
														 <c:set var="idx2">meaning${i }</c:set>
														  <c:if test="${q[idx]!=null && q[idx]!=''}">
															<div class="text-info">
																<div class="word">-<b>${q[idx]!=null? q[idx]:'' }</b>:</div>
																<div class="meaningWrap">
																  <input type="hidden" class="meaningNo" value="${i }">																
																  <div class="meaning">${q[idx2]!=null? q[idx2]:'' }</div>
																  <span class='glyphicon glyphicon-pencil'><small>modify</small></span>
																</div>
															</div>
														</c:if>
														</c:forEach>
													
														<c:if test="${q.phrase!=null && q.phrase!=''}">
															<p class="text-info">
																-<b>${q.phrase}</b>: ${q.meaning4!=null? q.meaning4:'' }
																<span class='glyphicon glyphicon-pencil'></span><small>modify</small>
															</p>
														</c:if>
														<input type="hidden" class="mqid" value="${q.mqid }">
														<input type="hidden" class="wordsCnt" value="${q.wordsCnt }">
														<input type="hidden" class="mqquote" value="${q.mqquote }">
													</div>
												</c:forEach>
												<div class="paging">
													<ul class="pagination">
														<c:if test="${paging[langCnt2-1].startPage>paging[langCnt2-1].blockSize }">
															<li class="page-item disabled">
															  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${paging.startPage-1}&mqlang=${lang}">&laquo;</a>
															</li>
														</c:if>
														<c:forEach var="i" begin="${paging[langCnt2-1].startPage }" end="${paging[langCnt2-1].endPage }">
															<c:if test="${paging[langCnt2-1].currentPage == i }">
																<li class="page-item active">
																  <a class="page-link"><b>${i }</b></a>
																</li>
															</c:if>
															<c:if test="${paging[langCnt2-1].currentPage != i }">
																<li class="page-item">
																  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${i}&mqlang=${lang }">${i }</a>
																</li>
															</c:if>
														</c:forEach>
														<c:if test="${paging[langCnt2-1].endPage<paging[langCnt2-1].pageCnt }">
															<li class="page-item">
															  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${paging[langCnt2-1].endPage+1}&mqlang=${lang }">&raquo;</a>
															</li>
														</c:if>
													</ul>
												</div><!-- paging ends -->							
											</div><!-- lang container -->
										</c:if>
									</c:forEach>
								</c:forEach>
								<div class="tab-pane fade ${(param.important!=null)? 'show active in show':''}" id="important">
								 <%-- <c:if test="${fn:length(importantlist)==0 }">								     
								     <div class="myqbook-null">
								     <h2>You have no important quote</h2>
								     <img src="${conPath }/img/x-face.png" width="180">
								     </div>
								 </c:if> --%>
								 <c:if test="${fn:length(importantlist)!=0 }">
									<c:forEach var="q" items="${importantlist}">
										<div class="qwrap relative bottom-line">
											<h4>
												<small class="text-muted">words:</small> 
												<span class="word1">
												${(q.word1!=null && q.word1!='')? q.word1:'' }
												</span>
												${(q.word2!=null && q.word2!='')? ', ':'' }
												<span class="word2">
												${(q.word2!=null && q.word2!='')? q.word2:'' }
												</span>
												${(q.word3!=null && q.word3!='')? ', ':'' }
												<span class="word3">
												${(q.word3!=null && q.word3!='')? q.word3:'' }
												</span>
											</h4>
											<h4>
												<small class="text-muted">phrase/clause:</small>
												<span class="phrase">
												${q.phrase!=null? q.phrase:'' }
												</span>
											</h4>
	
											<div class="quote">
												<span class="mqquote">${q.mqquote }</span> 
												<small class="text-muted">from ${q.stitle!=null? q.stitle:'' } by ${q.smaker!=null? q.smaker:'' }</small>
												<c:if test="${q.surl!=null }">
													<a class="black" href="${q.surl }" target="_blank">
													<span class="glyphicon glyphicon-link"></span>
													</a>
												</c:if>
											</div>
											<div class="right_container">
												<ul>
													<li class="list-inline-item">
													<fmt:parseDate value="${q.mqdate}" var="mqdate" pattern="yyyy-MM-dd HH:mm:ss"/>
														<fmt:formatDate value="${mqdate }" pattern="yyyy-MM-dd"/>
													</li>
													<li class="list-inline-item">
													  <div class="addNote">
													     <input type="hidden" class="mqid" value="${q.mqid }">
													     <input type="hidden" class="wordsCnt" value="${q.wordsCnt }">
														 <span class="glyphicon glyphicon-plus"></span>add a word
													  </div>
													</li>
													<li class="list-inline-item">
													  <a class="black" href="${conPath }/postQuoteView.do?mqid=${q.mqid}">
													  <span class="glyphicon glyphicon-pencil"></span> ask questions</a>
													</li>
													<li class="list-inline-item deleteQuote">																 
													   <span class="glyphicon glyphicon-trash"></span>remove
													</li>
													<c:if test="${q.mqimportant==1 }">
														<li class="list-inline-item">
														<span class="glyphicon glyphicon-star"></span>important
														</li>
													</c:if>
												</ul>
											</div>
											<c:forEach var="i" begin="1" end="3" varStatus="s">
											 <c:set var="idx">word${i }</c:set>
											 <c:set var="idx2">meaning${i }</c:set>
											  <c:if test="${q[idx]!=null && q[idx]!=''}">
												<div class="text-info">
													<div class="word">-<b>${q[idx]!=null? q[idx]:'' }</b>:</div>
													<div class="meaningWrap">
													  <input type="hidden" class="meaningNo" value="${i }">																
													  <div class="meaning">${q[idx2]!=null? q[idx2]:'' }</div>
													  <span class='glyphicon glyphicon-pencil'><small>modify</small></span>
													</div>
												</div>
											</c:if>
											</c:forEach>
										
											<c:if test="${q.phrase!=null && q.phrase!=''}">
												<p class="text-info">
													-<b>${q.phrase}</b>: ${q.meaning4!=null? q.meaning4:'' }
													<span class='glyphicon glyphicon-pencil'></span><small>modify</small>
												</p>
											</c:if>
											<input type="hidden" class="mqid" value="${q.mqid }">
											<input type="hidden" class="wordsCnt" value="${q.wordsCnt }">
											<input type="hidden" class="mqquote" value="${q.mqquote }">
										</div>
									</c:forEach>
									<div class="paging">
										<ul class="pagination">
											<c:if test="${paging_im.startPage>paging_im.blockSize }">
												<li class="page-item disabled">
												  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${paging.startPage-1}&important=1">&laquo;</a>
												</li>
											</c:if>
											<c:forEach var="i" begin="${paging_im.startPage }" end="${paging_im.endPage }">
												<c:if test="${paging_im.currentPage == i }">
													<li class="page-item active">
													  <a class="page-link"><b>${i }</b></a>
													</li>
												</c:if>
												<c:if test="${paging_im.currentPage != i }">
													<li class="page-item">
													  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${i}&important=1">${i }</a>
													</li>
												</c:if>
											</c:forEach>
											<c:if test="${paging_im.endPage<paging_im.pageCnt }">
												<li class="page-item">
												  <a class="page-link" href="${conPath }/myQuoteView.do?pageNum=${paging_im.endPage+1}&important=1">&raquo;</a>
												</li>
											</c:if>
										</ul>
									</div><!-- paging ends -->	
								  </c:if>
								</div>
								<div class="tab-pane fade" id="words">
								  <div class="relative">								  							  
								   <c:forEach var="wl" items="${wordlist }">
									 <div class="wordcard card bg-light mb-3" style="width:238px; height:140px; float:left; margin:5px 20px 5px 0px;">
									  <h3 class="card-header light-header">${wl.word }</h3>
									  <input type="hidden" class="card_meaning" value="${wl.meaning }">
								      <div class="card-body" style="display:contents;">
										  <p class="card-text" style="padding:0 20px;">												  
										  </p>									   
									  </div>									
							        </div>
							        </c:forEach>
							        <c:if test="${fn:length(wordlist)!=0 }">
							        	<span id="reset">
							        		<img src="${conPath }/img/refresh.png" width="90px;" style="opacity:0.5;">
							        	</span>
							        </c:if>
							        <c:if test="${fn:length(wordlist)==0 }">
							         <div class="myqbook-null">
								    	 <h2>No word cards</h2>
								    	 <h2>Add new words</h2>
								     	<img src="${conPath }/img/x-face.png" width="130">
								  	 </div>							        
							        </c:if>
							       </div> 
								</div>
								<div class="tab-pane fade" id="quiz">
								 <div class="myqbook-null">
								     <h2>Preparing</h2>
								     <img src="${conPath }/img/x-face.png" width="130">
								  </div>
								</div>
							  </c:if>
							
							</div>				
						</div>
					</div>
					<!-- myTabContent -->
				</div>
			</div>
		</div>
	</div>
	<!-- right_section_ends -->
	</div>
	<!--big row -->
	</div>
	<!-- container ends -->
<%-- 	<script src="${conPath }/js/jquery.min.js"></script> --%>
	<script src="${conPath }/js/popper.min.js"></script>
 	<script src="${conPath }/js/bootstrap.min1.js"></script>
 	<script src="${conPath }/js/custom.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var clickCnt1=0;
		var clickCnt2=0;
		var clickCnt3=0;
		var clickCnt4=0;
		var word;
		$('.word1').click(function(){
			if(clickCnt1%2==0 || clickCnt1==0){
				word=$(this).text().trim();
				//alert(word);
				$(".mqquote").her(word);
				clickCnt1+=1;
			}else{
				$(".mqquote").her();
				clickCnt2=0;
				clickCnt1=0;
				clickCnt3=0;
				clickCnt4=0;
			}
		});
		$('.word2').click(function(){
			if(clickCnt2%2==0 || clickCnt2==0){
				word=$(this).text().trim();
				//alert(word);
				$(".mqquote").her(word);
				clickCnt2+=1;
			}else{
				$(".mqquote").her();
				clickCnt2=0;
				clickCnt1=0;
				clickCnt3=0;
				clickCnt4=0;
			}
		});
		$('.word3').click(function(){
			if(clickCnt3%2==0 || clickCnt3==0){
				word=$(this).text().trim();			
				$(".mqquote").her(word);
				clickCnt3+=1;
			}else{
				$(".mqquote").her();
				clickCnt2=0;
				clickCnt1=0;
				clickCnt3=0;
				clickCnt4=0;
			}
		});
		$('.phrase').click(function(){
			if(clickCnt4%2==0 || clickCnt4==0){
				word=$(this).text().trim();			
				$(".mqquote").her(word);
				clickCnt4+=1;
			}else{
				$(".mqquote").her();
				clickCnt2=0;
				clickCnt1=0;
				clickCnt3=0;
				clickCnt4=0;
			}
		});
		
	});
	
	</script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
