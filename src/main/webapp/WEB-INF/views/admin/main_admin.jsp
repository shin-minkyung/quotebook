<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>quote book - main page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="css/qb.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css">
    <link rel="stylesheet" href="css/glyphicon.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!--   <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    <script>

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();

    </script>
    <c:if test="${adminLoginResult==0 }">
		<script>
			alert('Login failed. Check your password');
			history.back();
		</script>
	</c:if>
		<c:if test="${adminLoginResult==-1 }">
		<script>
			alert('no matching id');
			history.back();
		</script>
	</c:if>
  </head>
  <body>
  <!-- Navbar -->
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
       <jsp:include page="../main/header.jsp"></jsp:include> 
    </div>

<!-- ======================-->
  <div class="page_container">
  	<div class="row">
  	  <div class="col-lg-8" id="left_side_section">
  	    <div class="section_container">
  	     <div class="row">
  	      <div class="col-lg-12">
  	    	 <h2>Unchecked Claims</h2>
  	     </div>
  	     </div>
  	     <div class="row">
  	     	<div class="col-lg-12">
  	     		<div class="bs-component">
  	     			<ul class="nav nav-tabs">
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link active" data-toggle="tab" href="#p_movie">Category1</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#p_show">Category2</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#p_webpage">Category3</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#p_book">Category4</a>
  	     			  </li>
  	     			</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			  <div class="tab-pane fade show active in show" id="p_movie">
  	     			  	<p>contents on movie board</p>
  	     			  </div>
  	     			  <div class="tab-pane fade" id="p_show">
  	     			  	<p>contents on show board</p>
  	     			  </div>
  	     			  <div class="tab-pane fade" id="p_webpage">
  	     			  	<p>contents on webpage board</p>
  	     			  </div>
  	     			  <div class="tab-pane fade" id="p_book">
  	     			  	<p>contents on book board</p>
  	     			  </div>
  	     			</div>
  	     		</div>
  	     	</div>
  	     </div>
  	  </div>
  	 <!-- section1 ends -->
  	<div class="section_container">
  	  <div class="row">
  	     <div class="col-lg-12">
  	       <h2>The Most Reported Posts</h2>
  	     </div>
  	  </div>
  	  <div class="row">
  	   	<div class="col-lg-12">
  	       <div class="bs-component">
  	     		<ul class="nav nav-tabs">
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link active" data-toggle="tab" href="#r_movie">Quotes from Movie</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#r_show">Quotes from TV Shows</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#r_webpage">Quotes from Webpage</a>
  	     			  </li>
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link" data-toggle="tab" href="#r_book">Quotes from books</a>
  	     			  </li>
  	     		</ul>
  	     		<div id="myTabContent" class="tab-content">
  	     		  <div class="tab-pane fade show active in show" id="r_movie">
  	     		  	<p>contents on movie board</p>
  	     		  </div>
  	     		  <div class="tab-pane fade" id="r_show">
  	     		  	<p>contents on show board</p>
  	     		  </div>
  	     		  <div class="tab-pane fade" id="r_webpage">
  	     		  	<p>contents on webpage board</p>
  	     		  </div>
  	     		  <div class="tab-pane fade" id="r_book">
  	     		  	<p>contents on book board</p>
  	     		  </div>
  	     		</div>
  	      </div>
  	  </div>
  	 </div>
  	</div><!-- section2 ends -->
  	 <div class="section_container">
  	   <div class="row">
  	    <div class="col-lg-12">
  	      <div class="card bg-light mb-3" style="max-width: 50rem;">
               <h3 class="card-header">Recently Reported Comments</h3>
               <div class="card-body">
<!--                  <h4 class="card-title">Memo</h4> -->
                  <p class="card-text">The list of reported comments order by date</p>
               </div>
          </div>
  	   </div>
  	  </div>
  	 </div><!--  section3 ends -->
  	<div class="section_container">  	
  	  <div class="row">
		 <div class="col-lg-12">
		    <div class="card bg-light mb-3" style="max-width: 50rem;">
               <h3 class="card-header">Recently Reported Messages</h3>
                <div class="card-body">
                  <p class="card-text">Here shows the lists of the messages reported recently.</p>
                </div>
            </div>
		 </div>
	   </div>
	  </div><!-- section4 ends -->	
  	</div><!-- left_side_section ends --> 
  <div class="col-lg-4" id="right_side_setion">
  	<div class="section_container">
  	  <div class="row">
  	      <div class="col-lg-12">
            <div class="card bg-light mb-3" style="max-width: 20rem;">
              <h3 class="card-header">Task Profile</h3>
                <div class="card-body">
                  <h4 class="card-title"></h4>
                   <p class="card-text">32 unread claims.</p>
                  <p class="card-text">dealing with 120 claims</p>
                </div>
              </div>
          </div>  
  	  </div>
  	 </div>
  	 <div class="section_container">
  	  <div class="row">
  	    <div class="col-lg-12">
  	     	 <div class="bs-component">
              <div class="card mb-3">
                <h3 class="card-header">Black List</h3>
<!--                 <img style="height: 200px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22318%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20318%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_158bd1d28ef%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A16pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_158bd1d28ef%22%3E%3Crect%20width%3D%22318%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22129.359375%22%20y%3D%2297.35%22%3EImage%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Card image">
 -->                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Member A reported count 122</li>
                  <li class="list-group-item">Member B reported count 100</li>
                   <li class="list-group-item">Member C reported count 62</li>
                  <li class="list-group-item">Member D reported count 33</li>
                  <li class="list-group-item">Member E reported count 26</li>
                  <li class="list-group-item">Member F reported count 14</li>
                  <li class="list-group-item">Member G reported count 7</li>
                  <li class="list-group-item">Member H reported count 4</li>
                </ul>
                <div class="card-body">
                  <a href="#" class="card-link">Eliminate Members</a>
                  <a href="#" class="card-link"></a>
                </div>
                <div class="card-footer text-muted">                  
                </div>
              </div>         
            </div>
  	     </div>  	    
  	   </div>
  	  </div>
  	 </div> <!-- right_section_ends -->   
  	</div> 	<!--big row -->        	  
  </div><!-- container ends -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min1.js"></script>
    <script src="js/custom.js"></script>
   </body>
   <footer>
   <jsp:include page="../main/footer.jsp"></jsp:include>   
   </footer>
</html>
