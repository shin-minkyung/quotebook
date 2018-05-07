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
		alert("pbcid "+pbcid);
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
		 pbcid=$(this).closest('.tag').prev('.media').children('.cwrap').children('.pbcid').val();
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
		  	  	<td></td><td><h5>Invalid Access</h5></td>
		  	  </tr>
		  	</table>		     
		  </div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="section_container"> 
		        <div class="relative bottom-line" style="text-align:center; height:200px;">
		          <h2 style="line-height:100px;">
		          <img src="${conPath }/img/x-face.png" width="80px;" style="opacity:0.3;"> Sorry, This post was deleted
		          </h2>		          		        		         
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


</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
