<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<script>
  $(document).ready(function(){
	  var mid='${mid}';
	  if(mid!=null || mid!=""){
		  setInterval(function(){
			  $.ajax({
					url:'${conPath}/getAlarmCnt.do',
					type:'get',
					datatype:'html',
					data:'mid='+mid, 			
					success:function(data, status){
						var cnt = data.trim();				
						if(cnt==0){
							$(".alarm_noti").html(cnt);					
						}else if(cnt>0){
							$(".alarm_noti").html(cnt);
							$(".alarm_noti").removeClass("alarm_off");
							$(".alarm_noti").addClass("alarm_on");
						}
					}  				
				}); 
			}, 100);		
	  }
	  $("#alarm").click(function(){
		   $.ajax({
				url:'${conPath}/getAlarmList.do',	
				type:'get',
				datatype:'html',
				data:'mid='+mid,
				success:function(data,status){
					$("#alarmlist").html(data);
		     		}
			 	}); 
		  
	  });		  
  });
</script>
 <!-- non member mode -->
 <c:if test="${mid==null && aid==null }">
 <div class="container">
        <a href="${conPath }/main.do" class="navbar-brand"><img src="${conPath }/img/logo4.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">    
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/list.do?mqlang=English">Public Quote Book</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/guide.do">Guide</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/rankings.do">Rankings</a>
            </li>   
          </ul>
        
          <ul class="nav navbar-nav ml-auto">
            <li class="nav_msg">
        	  <a href="${conPath }/joinView.do">Be a member now!</a>
        	</li> 
        	<li class="nav-item">
              <a class="nav-link" href="${conPath }/main.do">login &nbsp;<span class="glyphicon glyphicon-log-in"></span></a>
            </li>  
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/joinView.do">Sign Up &nbsp;<span class="glyphicon glyphicon-user"></span></a>
            </li>                        
         </ul>
     	</div>
  </div>
 </c:if>
  <!-- member mode -->
 <c:if test="${mid!=null && aid==null }">  
  <div class="container">
     <a href="${conPath }/memberMain.do" class="navbar-brand"><img src="${conPath }/img/logo4.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" id="a">My Quote Book <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="a">
                <a class="dropdown-item" href="${conPath }/myQuoteView.do">My Quote Book</a>
                <a class="dropdown-item" href="${conPath }/addQuoteView.do">Add New Quote</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/list.do?mqlang=English">Public Quote Book</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/rankings.do">Rankings</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" id="myinfo">My Account</a>
              <div class="dropdown-menu" aria-labelledby="myinfo">
                <a class="dropdown-item" href="${conPath }/editprofile.do">Edit Profile</a>
                <a class="dropdown-item" href="${conPath }/settings.do">Settings</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${conPath }/myprofile.do">My Profile</a>
                <div class="dropdown-divider"></div>                
                <a class="dropdown-item" href="${conPath }/msgView.do">Message</a> 
                <div class="dropdown-divider"></div>                
                <a class="dropdown-item" href="${conPath }/alarmHistory.do">Alarm History</a>           
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" id="help">Help </a>
              <div class="dropdown-menu" aria-labelledby="help">
                <a class="dropdown-item" href="${conPath }/faqView.do">FAQ</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${conPath }/tellus.do">Tell us</a>
              </div>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="${conPath }/guide.do">Guide</a>
            </li>
          </ul>
          <ul class="nav navbar-nav ml-auto">
          	   <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle without" data-toggle="dropdown" href="#" id="alarm">
              <img src="${conPath }/img/bell_icon.png" width="18"></a>
              <a href="#" data-toggle="dropdown" class="alarm_noti alarm_off"></a>
              <div class="dropdown-menu" aria-labelledby="alarm" id="alarmlist">
                          
              </div>
            </li>
            <li class="nav_msg">
        	  <a href="myQuoteView.do">Hi, ${mname } </a>        	 
        	</li>
        	<li class="nav_photo">
        	  <c:choose>
                  <c:when test="${mlevel==1 }">
                    <img class="level1-header" src="${conPath }/img/new_circle.png">
                  </c:when>
                  <c:when test="${mlevel==2 }">
                    <img class="level2-header" src="${conPath }/img/pencil.png">
                  </c:when>
                   <c:when test="${mlevel==3 }">
                    <img class="level3-header" src="${conPath }/img/medal.png">
                  </c:when>
                   <c:when test="${mlevel==4 }">
                    <img class="level4-header" src="${conPath }/img/crown.png">
                  </c:when>
                </c:choose>
        	  <img src="${myUrl }/profile/${mphoto}" width="30" height="30" class="img-circle">
        	</li>
         
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/logout.do">logout &nbsp;<span class="glyphicon glyphicon-log-out"></span></a>
            </li>
          </ul>
        </div>
      </div>
  </c:if>
  
  <!-- admin mode -->
  <c:if test="${aid!=null}">
   <div class="container">
        <a href="${conPath }/adminMain.do" class="navbar-brand admin"><img src="img/logo_admin.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="a">Search Member<span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="a">
                <a class="dropdown-item" href="#">Search</a>
                <a class="dropdown-item" href="#">Dropped</a>
                <a class="dropdown-item" href="#">Eliminated</a>      
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Public Quote Book (Edit Mode)</a>
            </li>      
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="myinfo">Claims</a>
              <div class="dropdown-menu" aria-labelledby="myinfo">
                <a class="dropdown-item" href="#">Unchecked</a>
                <a class="dropdown-item" href="#">Progressive</a>
                <a class="dropdown-item" href="#">Completed</a>           
              </div>
            </li>     
          </ul>
        
          <ul class="nav navbar-nav ml-auto">
            <li class="nav_msg">
        	  <a href="#">Hi, Administrator ${aname }</a>
        	</li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle without" data-toggle="dropdown" href="#" id="alarm"><span class="glyphicon glyphicon-bell"></span></a>
              <div class="dropdown-menu" aria-labelledby="alarm">
                <a class="dropdown-item" href="#">New Claim1: I have a problem with....</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">New Claim2: It's really difficult to...</a>
              </div>
            </li>       
            <li class="nav-item">
              <a class="nav-link" href="${conPath }/adminLogout.do">logout</a>
            </li>
          </ul>
        </div>
      </div>
   </c:if>