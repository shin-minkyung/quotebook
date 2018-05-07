<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8");%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<html>
<head>
<meta charset="utf-8">
<title>Public Quote Book</title>
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
var mname;
var cindent;
var tag;
var tag2;
var pbcid;
var content;
$(document).ready(function(){
	  $(".reply").click(function(){		 
		 pbcid = $(this).closest('.cwrap').children('.pbcid').val();
		 mname=$(this).closest('.cwrap').children('.mname').val();
		 //alert('pbcid of this '+pbcid+' mname '+mname);
		 cindent=$(this).closest('.cwrap').children('.cindent').val();
		 tag="<div class='media tag'><div class='media-left'><span class='empty-space-45'></span></div><div class='media-body relative-only'><textarea rows='3' style='width:570px; float:left;' cols='60' class='form-control pbccontent' placeholder='Leave a comment to "+mname+"'></textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left insertStep1'>Write <span class='glyphicon glyphicon-pencil'></span></button></div></div></div>";
		 tag2="<div class='media tag'><div class='media-left'></div><div class='media-body relative-only'><textarea rows='3' style='width:560px; float:left;' cols='60' class='form-control pbccontent' placeholder='Leave a comment to "+mname+"'></textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left insertStep1'>Write <span class='glyphicon glyphicon-pencil'></span></button></div></div></div>";
		 if(cindent==0){
			 $(this).closest('.media').after($(tag));
		 }else if(cindent==1){
			 $(this).closest('.media').after($(tag2));
		 }
		 $(this).css("display","none");
		 $(this).siblings(".fold").css("display","block");	 
	 });
	 
	 $(".modifyComment").click(function(){		 
		pbcid = $(this).closest('.cwrap').children('.pbcid').val();
		cindent=$(this).closest('.cwrap').children('.cindent').val();
		content=$(this).closest('.cwrap').children('.pbccontent').val();
		content=content.replace(/<br>/g,'\n');
		// alert('pbcid of this '+pbcid);
		tag="<div class='media tag'><div class='media-left'></div><div class='media-body relative-only'><textarea rows='3' style='width:570px; float:left;' cols='60' class='form-control pbccontent'>"+content+"</textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left editBtn commentBtn'>Edit <span class='glyphicon glyphicon-pencil'></span></button></div></div></div>";
		tag2="<div class='media tag'><div class='media-body relative-only'><textarea rows='3' style='width:500px; float:left;' cols='60' class='form-control pbccontent'>"+content+"</textarea><button type='button' class='btn btn-primary my-2 my-sm-0 btn-input-left editBtn commentBtn'>Edit <span class='glyphicon glyphicon-pencil'></span></button></div></div></div>";
		 if(cindent==0){
			// $(this).closest('.media').after($(tag));			
			 $(this).closest('.cwrap').children(".commentContent").after($(tag));
			 //$(this).closest('.cwrap').children(".commentContent").remove();
		 }else if(cindent==1){
			 //$(this).closest('.media').after($(tag2));			 
			 $(this).closest('.cwrap').children(".commentContent").after($(tag2));
			 //$(this).closest('.cwrap').children(".commentContent").remove();
		 }
		 $(this).css("display","none");
		 $(this).siblings(".fold").css("display","block");	
	 });
	 
	 $(".fold").css("display","none");	 
	 $(".fold").click(function(){
		 $(this).closest('.right_container').siblings(".tag").remove();
		 $(this).closest('.media').siblings(".tag").remove();
		 $(this).siblings(".reply").css("display","block");
		 $(this).siblings(".modifyComment").css("display","block");
		 $(this).css("display","none");
	 });
	 
	 $(".deleteComment").click(function(){
		pbcid=$(this).closest('.cwrap').children('.pbcid').val();
		//alert("pbcid "+pbcid);
		$.ajax({
			url : '${conPath}/deleteComment.do',
			type : 'post',
			datatype : 'html',
			data : 'pbcid='+pbcid,
			success : function(data, status) {
				//alert(data.trim());
				if(data.trim()==1){
					location.reload();
		    		self.close();  
				}						
			}
		});	
	 });
	 
	 $(document).on('click','.editBtn',function(){
		 pbcid=$(this).closest('.tag').closest('.cwrap').children('.pbcid').val();
		 pbccontent=$(this).siblings('.pbccontent').val();
		 //alert('pbcid:'+pbcid+' pbccontent:'+pbccontent);
		 $.ajax({
				url : '${conPath}/editComment.do',
				type : 'post',
				datatype : 'html',
				data : 'pbcid='+pbcid+'&pbccontent='+pbccontent,
				success : function(data, status) {
					//alert(data.trim());
					if(data.trim()==1){
						location.reload();
			    		self.close();  
					}						
				}
			});		 
	 });
	 $("#insertStep0").click(function(){
		 var pbid='${pbook.pbid}';
		 var mid='${mid}';
		 var mname='${mname}';
		 var mphoto='${mphoto}';
		 var pbccontent=$(this).siblings('.pbccontent').val();
		 //alert('pbid: '+pbid+' mid:'+mid+' mphoto:'+mphoto+' pbccontent:'+pbccontent);
		 $.ajax({
				url : '${conPath}/insertStep0.do',
				type : 'post',
				datatype : 'html',
				data : 'pbid='+pbid+'&mid='+mid+'&mname='+mname+'&mphoto='+mphoto+'&pbccontent='+pbccontent,
				success : function(data, status) {
					//alert(data.trim());
					if(data.trim()==1){							
						//alert('Comment Insert Success');
						//location.reload();
						location.reload();
			    		self.close();  
					}						
				}
			});
	 });
	 
	 $(document).on('click','.insertStep1',function(){
		 var rcid=$(this).closest('.tag').prev('.media').children('.cwrap').children('.pbcid').val();
		 var pbid='${pbook.pbid}';
		 var mid='${mid}';
		 var mname='${mname}';
		 var mphoto='${mphoto}';
		 var pbccontent=$(this).siblings('.pbccontent').val();
		 var cgroup =$(this).closest('.tag').prev('.media').children('.cwrap').children('.cgroup').val();
		// alert('cgroup: '+cgroup+' rcid: '+rcid+' pbid: '+pbid+' mid:'+mid+' mphoto:'+mphoto+' pbccontent:'+pbccontent);
		    $.ajax({
				url : '${conPath}/insertStep1.do',
				type : 'post',
				datatype : 'html',
				data : 'cgroup='+cgroup+'&rcid='+rcid+'&pbid='+pbid+'&mid='+mid+'&mname='+mname+'&mphoto='+mphoto+'&pbccontent='+pbccontent,
				success : function(data, status) {
					//alert(data.trim());
					if(data.trim()==1){							
						//alert('Comment Insert Success');						
						location.reload();
			    		self.close();  
					}						
				}
			});   
	 });
	 
	 $(".thanks").click(function(){
		 pbcid = $(this).closest('.cwrap').children('.pbcid').val();		
		 $.ajax({
				url : '${conPath}/giveHeart.do',
				type : 'post',
				datatype : 'html',
				data : 'pbcid='+pbcid,
				success : function(data, status) {					
					if(data.trim()==1){	
						location.reload();
			    		self.close();  
					}						
				}
			});
	 });
	 
	 $(".unthanks").click(function(){
		 pbcid=$(this).closest('.cwrap').children('.pbcid').val();
		
		 $.ajax({
				url : '${conPath}/takeHeart.do',
				type : 'post',
				datatype : 'html',
				data : 'pbcid='+pbcid,
				success : function(data, status) {				
					if(data.trim()==1){	
						location.reload();
			    		self.close();  
					}						
				}
			});
	 });
	 
	 $.ajax({
			url : '${conPath}/checkifliked.do',
			type : 'post',
			datatype : 'html',
			data : 'pbid='+'${pbook.pbid}'+'&mid='+'${mid}',
			success : function(data, status) {				
				if(data.trim()==1){	
					$(".like").css("display","none");
					$(".unlike").css("display","block");
				}else if(data.trim()==0){
					$(".like").css("display","block");
					$(".unlike").css("display","none");
				}else{
					alert("ifliked Check Error"+data.trim());
				}				
			}
		});     	 
	 
	 
	 $(".like").click(function(){				         	
     	 pbid = '${pbook.pbid}';   
     	 $.ajax({
				url : '${conPath}/like.do',
				type : 'post',
				datatype : 'html',
				data : 'pbid='+pbid,
				success : function(data, status) {				
					if(data.trim()==1){	
						location.reload();
			    		self.close();  
					}						
				}
			});  	 
	 });
	 
	 $(".unlike").click(function(){
		 pbid = '${pbook.pbid}';
     	 $.ajax({
				url : '${conPath}/unlike.do',
				type : 'post',
				datatype : 'html',
				data : 'pbid='+pbid,
				success : function(data, status) {				
					if(data.trim()==1){	
						location.reload();
			    		self.close();  
					}						
				}
			});  
	 });
	 
	 $(".deletePB").click(function(){
		 var pbid='${pbook.pbid}';		 
		 var mqlang='${pbook.mqlang}';
			 
		 var sure = confirm('Are you sure you want to delete post?');
		 if(sure==true){
			 $.ajax({
					url : '${conPath}/deletePB.do',
					type : 'post',
					datatype : 'html',
					data : 'pbid='+pbid,
					success : function(data, status) {
						//alert(data.trim());
						if(data.trim()==1){							
							alert('Delete Success');
							location.href='list.do?mqlang='+mqlang;
						}						
					}
				});
		 }else{
			 
		 }
	 });
	 
	 $(".editPB").click(function(){
		var pbid='${pbook.pbid}';
		var mqid='${pbook.mqid}';
		location.href='editPBView.do?pbid='+pbid+'&mqid='+mqid;
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
						<jsp:include page="menu.jsp"></jsp:include>					
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
					<h2>Public Quote Book</h2>
					<small class="text-muted"> you can ask questions here about your quotes </small>
				  <!-- 검색바 -->
				  <jsp:include page="searchInput.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		    <div class="relative">
		    <div class="right_container">
		      <ul>
		       <li class="list-inline-item more-padding"> 
		       <a class="normal-link" href="list.do?mqlang=${pbook.mqlang }">
		       <span class="shadow-btn"><span class="glyphicon glyphicon-backward"></span> Back to List</span>
		       </a>
		       </li>		      
		       <li class="list-inline-item more-padding">
		        <a class="normal-link" href="myQuoteView.do" data-toggle="tooltip" title="You can ask questions with your quotes">
		        <span class="shadow-btn">
		       <span class="glyphicon glyphicon-pencil"></span> Ask a question</span>
		       </a>
		       </li>		       
		      </ul>		     
		    </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		  	<table class="caption_bar">
		  	  <tr>	
		  	  	<td></td><td><h5>Questions from ${pbook.mqlang } Quotes</h5></td>
		  	  </tr>
		  	</table>		     
		  </div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="section_container"> 
		        <div class="relative bottom-line">
		          <div class="left_container">
		          <c:if test="${mid!=null }">
		           <a class="normal-link" href="memberProfileView.do?mid=${pbook.mid }" data-toggle="tooltip" title="profile">
		          </c:if>
		            <img src="${myUrl }/profile/${pbook.mphoto}" width="50" style="display:block;">${pbook.mname }
		          <c:if test="${mid!=null }">
		           </a>
		          </c:if>
		          </div>
		           <div class="left-margin"> <!-- space for photo -->
		          	 <p class="lead">${pbook.pbtitle }</p>
		         	 <h6>Quote from writer:</h6>
		         	 <p class="quote">${pbook.mqquote }
		         	  <small><em>${pbook.stitle }</em>, ${pbook.smaker } <a class="normal-link" href="${pbook.surl }" target="_blank"><span class="glyphicon glyphicon-link"></span></a></small>
		         	 </p>
		         	
		         	 <h6>Question from writer:</h6> 
		         	 <p>${pbook.pbcontent }</p>
		         	 <p></p>
		         	 
		         <c:if test="${mid!=null}"> <!-- like button -->
		         	 <div class="right_bottom_container_close">
		         	  <div class="like">
		         	     <button type="button" class="form-control" style="height:47px; line-height:20px;">
		         	 		<img id="like_img" src="${conPath }/img/like.png" style="width:22px;">		         	
		         	 		Like  ${pbook.pblike }
		         	 	</button>
		         	  </div>
		         	   <div class="unlike">
		         	     <button type="button" class="form-control" style="height:47px; line-height:20px;">
		         	 		<img id="like_img" src="${conPath }/img/like.png" style="width:22px;">		         	
		         	 		Unlike  ${pbook.pblike }
		         	 	</button>
		         	  </div>		         	
		         	 </div>
		         </c:if>
		           </div>
		           <div class="right_container">
		             <ul>
		                <li class="list-inline-item"><em>
		                <fmt:parseDate value="${pbook.pbdate }" var="pbDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     			<fmt:formatDate value="${pbDate }" pattern="yyyy/MM/dd HH:mm"/>
		                </em></li>		              
  	     			  	<li class="list-inline-item"><span class="glyphicon glyphicon-eye-open"></span> ${pbook.pbhit }</li>
  	     			  
  	     			  <c:if test="${mid==pbook.mid }">
		             	<li class="list-inline-item deletePB">												 
						  <span class="glyphicon glyphicon-trash"></span>remove
						</li>						
						<li class="list-inline-item editPB">												 
						  <span class="glyphicon glyphicon-pencil"></span>edit
						</li>		             
		              </c:if>
  	     			  	
  	     			  <c:if test="${mid!=null && mid!=pbook.mid }">
  	     			  	<li class="list-inline-item">
  	     			  	<button type="button" style="width:25px;" class="btn btn-hidden" data-toggle="modal" data-target="#report" ><span class="glyphicon glyphicon-exclamation-sign"></span>  report </button>
  	     			  	</li>
  	     			  </c:if>    			  	
  	     			  							  	     			  	   			
  	     			  </ul>
		           </div>		        		         
		        </div>
		        <div class="relative bottom-line">
		        <h4>Comment ${commentCnt }  <img src="${conPath}/img/comment.png"></h4>
		        <c:if test="${mid==null }">
		        	<p style="text-align:center"><span class="highlight_2">You can write comments after login</span></p>
		        </c:if>
		    <c:if test="${commentCnt!=0 }">		       
		     <div class="commentContainer">
		      <c:forEach var="step0" items="${commentlist }" varStatus="status">
		       <!-- step0 -->
		        <c:if test="${step0.cgroup==step0.pbcid}">
		      	 <div class="media">
		      	 	<div class="media-left"> <!-- photo -->
		      	 	   <c:if test="${step0.cdel==0 }">
		      	 		<img src="${myUrl }/profile/${step0.mphoto}" class="media-object" style="width:45px">
		      	 	   </c:if>
		      	 	   <c:if test="${step0.cdel==1 && step0.cgroupCnt>0}">
		      	 	    <img src="${conPath }/img/x-button.png" style="opacity:0.3;">    
		      	 	   </c:if>
		      	 	</div>
		      	 	<div class="media-body relative-only cwrap"> <!-- comment -->
		      	 	 <input type="hidden" class="pbcid" value="${step0.pbcid }">
		      	 	 <input type="hidden" class="cgroup" value="${step0.cgroup }">
		      	     <input type="hidden" class="mname" value="${step0.mname }">
		      	     <input type="hidden" class="cindent" value="${step0.cindent }">
		      	     <input type="hidden" class="pbccontent" value="${step0.pbccontent}">
		      	 	   <c:if test="${step0.cdel==0 }">
		      	 		<h4 class="media-heading">${step0.mname }</h4>
		      	 		<small><i>${step0.cdate }</i></small>
		      	 		<p class="commentContent">${step0.pbccontent }</p>
		      	 		 <div class="right_container">
		      	 		 	<ul>
		      	 		 	  <c:if test="${step0.heart==1 &&mid!=pbook.mid}">
		      	 		 	    <span data-toggle="tooltip" title="helpful comment">
		      	 		 	    <img src="${conPath }/img/heart.png" style="width:28px;"><br>
		      	 		 	    <small>Thanks!</small>
		      	 		 	    </span>		      	 		 	 
		      	 		 	  </c:if>
		      	 		 	  <c:if test="${mid!=null && mid!=step0.mid }">
		      	 		 	  <li class="list-inline-item">
		      	 		 	    <span class="reply" data-toggle="tooltip" title="Reply"><img src="${conPath }/img/plus_trans.png"></span>
		      	 		 	    <span class="fold"  data-toggle="tooltip" title="The content in the field will not be saved unless you click the 'Write/Edit' button"><img src="${conPath }/img/multiply.png"> </span> 
		      	 		 	  </li>		      	 		 	
		      	 		 	  </c:if>
		      	 		 	  <c:if test="${mid!=null && mid==step0.mid }">
		      	 		 	   <li class="list-inline-item">
		      	 		 	    <span class="modifyComment" data-toggle="tooltip" title="Edit"> <img src="${conPath }/img/modify.png"></span>
		      	 		 	     <span class="fold"  data-toggle="tooltip" title="The content in the field will not be saved unless you click the 'Write/Edit' button"><img src="${conPath }/img/multiply.png"></span>		      	 		 	  
		      	 		 	  </li>
		      	 		 	   <c:if test="${step0.heart==0 }">
		      	 		 	  <li class="list-inline-item">
		      	 		 	   <span class="deleteComment" data-toggle="tooltip" title="Delete">
		      	 		 	   <img src="${conPath }/img/rubbish-bin.png">
		      	 		 	   </span>
		      	 		 	  </li>
		      	 		 	   </c:if>
		      	 		 	  </c:if>
		      	 		 	  <c:if test="${mid==pbook.mid && mid!=step0.mid}">
		      	 		 	  <li class="list-inline-item">
		      	 		 	  <c:if test="${step0.heart==0 }">
		      	 		 	   <span class="thanks" data-toggle="tooltip" title="give hearts to helpful comments">
		      	 		 	    <img style="opacity:0.5;" src="${conPath }/img/heart.png">
		      	 		 	   </span>
		      	 		 	   </c:if>
		      	 		 	   <c:if test="${step0.heart==1 }">
		      	 		 	   <span class="unthanks"  data-toggle="tooltip" title="take heart back">
		      	 		 	     <img src="${conPath }/img/heart.png">
		      	 		 	    </span>
		      	 		 	   </c:if>    	 		 	  			
		      	 	     		</li>
		      	 		 	  </c:if>
		      	 		 	</ul>
		      	 		 </div>		      	 		
		      	 	   </c:if>
		      	 	   <c:if test="${step0.cdel==1 && step0.cgroupCnt>0}">
		      	 		<div class="height-70">  		      	 			  
		      	 			<h4 style="color:gray;">(Deleted Comment)</h4>
		      	 		</div>	      	 	   
		      	 	   </c:if>
		      	 	<!-- step1 -->
		      	 		<c:forEach var="step1" items="${commentlist }">		      	 		     	 		
		      	 		  <c:if test="${ step0.cgroup== step1.cgroup && step1.cindent==1 }">		      	 		       	 		  
		      	 		     <div class="media">
		      	 			   <div class="media-left">
		      	 			     <c:if test="${step1.cdel==0 }">
		      	 			     <img src="${myUrl }/profile/${step1.mphoto}" class="media-object" style="width:45px">
		      	 			     </c:if>
		      	 			     <c:if test="${step1.cdel==1 && step1.cgroupCnt>0}">
		      	 			       <img src="${conPath }/img/x-button.png" style="opacity:0.3;">      
		      	 			     </c:if>
		      	 			   </div>
		      	 			 <div class="media-body relative-only cwrap">
		      	 			   <input type="hidden" class="pbcid" value="${step1.pbcid }">
		      	 			   <input type="hidden" class="cgroup" value="${step1.cgroup }">
		      	 			   <input type="hidden" class="mname" value="${step1.mname }">
		      	 			   <input type="hidden" class="cindent" value="${step1.cindent }">
		      	 			   <input type="hidden" class="pbccontent" value="${step1.pbccontent}">
		      	 			  <c:if test="${step1.cdel==0 }">		      	 			    
		      	 			    <h4 class="media-heading">${step1.mname }</h4>
  		      	 			     <small><i>${step1.cdate }</i></small><br>
  		      	 			     <span class="toWhom">@${step1.toWhom }</span>
		      	 			     <p class="commentContent">${step1.pbccontent }</p>
		      	 			     <div class="right_container">
		      	 		 			<ul>
		      	 		 			  <c:if test="${step1.heart==1 &&mid!=pbook.mid}">
		      	 		 	    		<span data-toggle="tooltip" title="helpful comment" style="text-align:center;">
		      	 		 	    		<img src="${conPath }/img/heart.png" style="width:28px;"><br>		      	 		 	    		    	 		 	    		
		      	 		 	    		<small>Thanks!</small>
		      	 		 	    		</span>		      	 		 	 
		      	 		 	  		</c:if>
		      	 		 	  		  <c:if test="${mid!=null && mid!=step1.mid }">
		      	 		 	  			<li class="list-inline-item">
				      	 		 	  	<span class="reply" data-toggle="tooltip" title="Reply"><img src="${conPath }/img/plus_trans.png"></span>
		      	 		 	    		<span class="fold" data-toggle="tooltip" title="The content in the field will not be saved unless you click the 'Write/Edit' button"><img src="${conPath }/img/multiply.png"> </span> 
					     	 		 	</li>					     	 		 						     	 		 	  
		      	 				 	  </c:if>
		      	 		 			  <c:if test="${mid!=null && mid==step1.mid }">
		      	 		 	   			 <li class="list-inline-item">
		      	 		 	  			  <span class="modifyComment" data-toggle="tooltip" title="Edit"><img src="${conPath }/img/modify.png"></span>
		      	 		 	   			   <span class="fold"  data-toggle="tooltip" title="The content in the field will not be saved unless you click the 'Write/Edit' button"><img src="${conPath }/img/multiply.png"></span>
		      	 		 	 			 </li>
		      	 		 	 			 <c:if test="${step1.heart==0 }">
		      	 		 			    <li class="list-inline-item">
		      	 		 	  			 <span class="deleteComment" data-toggle="tooltip" title="Delete">
		      	 		 	  			 <img src="${conPath }/img/rubbish-bin.png">
		      	 		 			    </span>
		      	 		 			  </li>
		      	 		 			    </c:if>
		      	 		 	  		 </c:if>
		      	 		 	  		 <c:if test="${mid==pbook.mid && mid!=step1.mid}">
		      	 		 	  			<li class="list-inline-item">
		      	 		 	  			  <c:if test="${step1.heart==0 }">
		      	 		 	 			  <span class="thanks" data-toggle="tooltip" title="give hearts to helpful comments">
		      	 		 	    			<img style="opacity:0.5;" src="${conPath }/img/heart.png">
		      	 		 	   			  </span>
		      	 		 	  			  </c:if>
		      	 		 			   <c:if test="${step1.heart==1 }">
		      	 		 			     <span class="unthanks" data-toggle="tooltip" title="take heart back">
		      	 		 	     		<img src="${conPath }/img/heart.png">
		      	 		 	     		</span>
		      	 		 	  		   </c:if>     	 		 	  			
		      	 		 	    		</li>
		      	 		 	  		 </c:if>
		      	 		 			</ul>
		      	 		 		</div>			      	 			     
		      	 			  </c:if>
		      	 			  <c:if test="${step1.cdel==1 && step1.cgroupCnt>0}">
		      	 			    <div class="height-70">  		      	 			  
		      	 			     <h4 style="color:gray;">(Deleted Comment)</h4>
		      	 			    </div>
		      	 			  </c:if> 			
		      	 		 </div>
		      	 	    </div><!-- step1 media -->
		      	 	  </c:if>		      	 		 
		      	 	</c:forEach>
		      	 <!-- step1 ends -->		      	 			      	 		
		      	 </div>
		      	</div><!-- step0 media -->
		      </c:if>
		  	</c:forEach>  			  	
		 <!-- step0 ends -->
	   </div>
	   </c:if>   		
			   <c:if test="${mid!=null }">
			   <img src="${myUrl }/profile/${mphoto}" style="width:65px; margin-right:15px; float:left;">
			   	<form class="form-inline my-2 my-lg-0"> 
				  <textarea rows="3" cols="72" class="form-control pbccontent" name="pbccontent" placeholder="Leave a comment to ${pbook.mname }"></textarea>
				  <button type="button" class="btn btn-primary my-2 my-sm-0 btn-input-left commentBtn" id="insertStep0">Write <span class="glyphicon glyphicon-pencil"></span></button>
				</form>
			   </c:if>
	
		     </div>       
            </div>  
		  </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		  
 	     		
		  </div>
		</div> 	     		
	</div>	<!-- right_section_ends -->
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>

<!-- Modal -->
  <div class="modal fade" id="report" role="dialog">
    <div class="modal-dialog">
    <!-- ${conPath}/claimReportWrite.do?bId=${content_view.bId }&mId=${loginId } -->
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"><span class="glyphicon glyphicon-exclamation-sign"></span> Report Inappropriate Contents</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div class="modal-body">
        	<form action="#" method="post"> 
				<input type="hidden" name="mid" value="${mid }">
				<input type="hidden" name="pbid" value="${pbook.pbid}">
				<div class="row">
					<div class="col-sm-4">reporter</div>
					<div class="col-sm-8">${mname }</div>
				</div>									
				<div class="row">
					<div class="col-sm-4"><strong></strong></div>
					<div class="col-sm-8"></div>
				</div>			
				<div class="row">
					<div class="col-sm-4"><strong>content</strong></div>
					<div class="col-sm-8">${pbook.pbcontent }</div>
				</div>	
				<div class="row">
					<div class="col-sm-12">Select why it is inappropriate:</div>
				</div>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<select class="form-control" name="" style="width:200px;">
						 <option>Offensive Expression</option>
						 <option>Illegal Contents Share</option>
						 <option>etc</option>
						</select>
					</div>
				</div>
			</form> 		
          </div>
        <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Report</button>
  		 <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>        
      </div>      
    </div>
  </div>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
    $('[data-toggle="tooltip"]').tooltip();   
});

</script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
