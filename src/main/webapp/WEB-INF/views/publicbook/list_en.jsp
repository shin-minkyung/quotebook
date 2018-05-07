<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Public Quote Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="${conPath }/css/qb.css" media="screen">
<link rel="stylesheet" href="${conPath }/css/custom.min.css">
<link rel="stylesheet" href="${conPath }/css/glyphicon.css">
<script async src="${conPath }/js/ga.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
	 $('.addNote').one('click',function(){
		  var tag="<form class='form-inline my-2 my-lg-0'><input type='text' class='form-control' name='unknownVoca' placeholder='word'><textarea cols='70' rows='1' class='form-control' name='unknownVoca' placeholder='meaning'></textarea><button class='btn btn-primary my-2 my-sm-0'><span class='glyphicon glyphicon-pencil'></span></button></form>";
		   $('.text-info').after($(tag));
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
						<jsp:include page="menu.jsp"></jsp:include>
					</div>
					
						<!-- section1 ends -->
	<div class="section_container">
		<div class="row">
			<div class="col-lg-12">
				<h2></h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div>
	</div>
	<!-- section2 ends -->
	<div class="section_container">
		<div class="row">
			<div class="col-lg-12">
				<!-- <div class="card bg-light mb-3" style="max-width: 50rem;">
					<h3 class="card-header light-header">Card Header</h3>
					<div class="card-body">
						<p class="card-text"></p>
					</div>
				</div> -->
			</div>
		</div>
	</div>
	<!--  section3 ends -->
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
				  <div class="right_container">
				  	<form class="form-inline my-2 my-lg-0">
				  	<select class="form-control" name="cate">
				 		<option selected="selected">condition</option>
				 		<option value="title">title</option>
				 		<option value="quote">quotes</option>
				 		<option value="content">content</option>
				 		<option value="content">nickname</option>
				 	</select>
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-primary my-2 my-sm-0 btn-input-left-sm" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                  </form>
				  </div>
				</div>
			</div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		    <div class="relative">
		    <div class="right_container">
		      <ul>
		       <li class="list-inline-item more-padding"><span class="shadow-btn"><span class="glyphicon glyphicon-pencil"></span> Write a Post</span></li>		       
		      </ul>		     
		    </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		  	<table class="caption_bar">
		  	  <tr>	
		  	  	<td></td><td><h5>Questions from English Quotes</h5></td>
		  	  </tr>
		  	</table>		     
		  </div>
		</div>
		<div class="row">
		   <div class="col-lg-12">
		     <div class="section_container"> 
		        <div class="relative bottom-line">
		          <div class="left_container">
		           <img src="${conPath }/mphoto/noimg.jpg" width="50" style="display:block;">nickname
		           </div>
		           <div class="left-margin"> 
		          	 <p class="lead">I don't understand this part. Someone help me.</p>
		         	 <p>"South Korea says it will continue high-level talks with North Korea with "clear eyes" amid global warnings that Pyongyang might be playing for time to continue its nuclear-arms programme."</p> 
		           </div>
		           <div class="right_bottom_container">
		             <ul>
		             	<li class="list-inline-item"><em>2018/01/18</em></li>
  	     			  	<li class="list-inline-item"><span class="glyphicon glyphicon-eye-open"></span> 120</li>
  	     			  	<li class="list-inline-item"><span class="glyphicon glyphicon-comment"></span> 1</li>
  	     			  	<li class="list-inline-item"><img src="${conPath }/img/heartcomment.png"> 1</li>
  	     			  </ul>
		           </div>		        		         
		        </div>
		         <div class="relative bottom-line">
		          <div class="left_container"><img src="${conPath }/mphoto/noimg.jpg" width="50" style="display:block;">nickname</div>
		           <div class="left-margin"> 
		          	 <p class="lead">I don't understand this part. Someone help me.</p>
		         	 <p>"South Korea says it will continue high-level talks with North Korea with "clear eyes" amid global warnings that Pyongyang might be playing for time to continue its nuclear-arms programme."</p> 
		           </div>
		           <div class="right_bottom_container">
		             <ul>
		             	<li class="list-inline-item"><em>2018/01/18</em></li>
  	     			  	<li class="list-inline-item"><div class="addNote"><span class="glyphicon glyphicon-eye-open"></span> 120</div></li>
  	     			  	<li class="list-inline-item"><span class="glyphicon glyphicon-comment"></span> 1</li>
  	     			  	<li class="list-inline-item"><img src="${conPath }/img/heartcomment.png"> 2</li>
  	     			  </ul>
		           </div>		        		         
		        </div>		        
             </div>  
		   </div>
		</div>
		<div class="row">
		  <div class="col-lg-12">
		  
  	     	<div class="paging">
  	     	   <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">3</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">4</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">5</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                  </li>
                </ul>		
  	     	</div> <!-- 페이징 --> 	     		
		  </div>
		</div> 	     		
	</div>	<!-- right_section_ends -->
	</div>	<!--big row -->
	</div>	<!-- container ends -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min1.js"></script>
	<script src="../js/custom.js"></script>
</body>

<footer>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</footer>
</html>
