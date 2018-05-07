<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<c:set var="myUrl" value="http://nightsky.cafe24.com"></c:set>
<div class="section_container">
  	     <div class="row">
  	      <div class="col-lg-12">
  	    	 <h2>Popular Posts</h2>
  	     </div>
  	     </div>
  	     <div class="row">
  	     	<div class="col-lg-12">
  	     		<div class="bs-component">
  	     			<ul class="nav nav-tabs">
  	     			 <c:forEach items="${langlist }" varStatus="s">
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link ${s.index==0? 'active':'' }" data-toggle="tab" href="#pop_${langlist[s.index].lname }">${langlist[s.index].lname }</a>
  	     			  </li>
  	     			 </c:forEach>  	     			
  	     			</ul>
  	     			<div id="myTabContent" class="tab-content">
  	     			<c:forEach items="${langlist }" varStatus="j">
  	     			<div class="tab-pane fade show ${j.index==0?'active':'' } in show" id="pop_${langlist[j.index].lname }">  
 	     			 <c:forEach items="${pop3[j.index] }" var="toppb">
  	     			   <c:if test="${toppb!=null }">
  	     			     <div class="relative-little-padding bottom-line fixheight-150">
		               		<div class="left_container">
		               		   <div class="profile_wrap">		               		 		            			
		             		<img src="${myUrl }/profile/${toppb.mphoto}" width="50" height="50" style="display:block;">${toppb.mname }
		             		<c:choose>
                  					<c:when test="${toppb.mlevel==1 }">
        							  <img class="level1" src="${conPath }/img/new.png">
                 				    </c:when>
                  					<c:when test="${toppb.mlevel==2 }">
                    				 <img class="level2" src="${conPath }/img/pencil.png">
                  					</c:when>
                   					<c:when test="${toppb.mlevel==3 }">
                    				  <img class="level3" src="${conPath }/img/medal.png">
                  					</c:when>
                   					<c:when test="${toppb.mlevel==4 }">
                    				 <img class="level4" src="${conPath }/img/crown.png">
                  					</c:when>
                				</c:choose>
                				</div>
		            		</div>
		            	<div class="left-margin"> 
		          	  		<p class="lead no-padding"><a class="normal-link" href="${conPath }/contentView.do?pbid=${toppb.pbid}">${toppb.pbtitle }</a></p>
		         	  		<p class="ellipsis">
		         	  			<c:choose>
							 	 <c:when test="${fn:length(toppb.mqquote)>170 }">
							 	  "<c:out value="${fn:substring(toppb.mqquote,0,170) }"></c:out>......"
							 	 </c:when>
							 	 <c:otherwise>
							 	 "${toppb.mqquote}"
							 	 </c:otherwise>
								 </c:choose>
		         	  		</p> 
		            	</div>
		            	<div class="right_bottom_container_close">
		             		<ul>
		             			<li class="list-inline-item"><em>
		             			<fmt:parseDate value="${toppb.pbdate }" var="pbdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     					<fmt:formatDate value="${pbdate }" pattern="yyyy/MM/dd"/>
		             			</em></li>
  	     			  			<li class="list-inline-item"><img src="${conPath}/img/eye.png" style="width:25px; opacity:0.6;"><span class="highlight2"> ${toppb.pbhit }</span></li>
  	     			  			<li class="list-inline-item"><img src="${conPath}/img/comment.png" style="height:27px;"><span class="highlight2"> ${toppb.commentCnt }</span></li>
  	     			  			<li class="list-inline-item"><img src="${conPath }/img/heart.png" style="width:25px; opacity:${toppb.heartCnt==0? '0.3;':'0.9;'}"><span class="highlight2"> ${toppb.heartCnt }</span></li>
  	     			  		</ul>
		            	  </div>		        		         
		           		</div>	  	     			  
  	     			   </c:if> 	     			 
  	     			 </c:forEach>  	     			 
  	     			 </div>  
  	     			</c:forEach>
  	     			</div>
  	     		</div>
  	     	</div>
  	     </div>
  	  </div>
  	 <!-- section1 ends -->
  	<div class="section_container">
  	  <div class="row">
  	     <div class="col-lg-12">
  	       <h2>Recent Posts</h2>
  	     </div>
  	  </div>
  	  <div class="row">
  	   	<div class="col-lg-12">
  	       <div class="bs-component">
  	     		<ul class="nav nav-tabs ">
  	     		   <c:forEach items="${langlist }" varStatus="s">
  	     			  <li class="nav-item">
  	     			  	<a class="nav-link ${s.index==0? 'active':'' }" data-toggle="tab" href="#new_${langlist[s.index].lname }">${langlist[s.index].lname }</a>
  	     			  </li>
  	     			 </c:forEach>
  	     		</ul>
  	     		<div id="myTabContent" class="tab-content">
  	     		<c:forEach items="${langlist }" varStatus="j">
  	     			<div class="tab-pane fade show ${j.index==0?'active':'' } in show" id="new_${langlist[j.index].lname }">  
 	     			 <c:forEach items="${new3[j.index] }" var="toppb">
  	     			   <c:if test="${toppb!=null }">
  	     			     <div class="relative-little-padding bottom-line fixheight-150">
		               		<div class="left_container">
		               		  <div class="profile_wrap">
		             		<img src="${myUrl }/profile/${toppb.mphoto}" width="50" height="50" style="display:block;">${toppb.mname }
		             		 <c:choose>
                  					<c:when test="${toppb.mlevel==1 }">
        							  <img class="level1" src="${conPath }/img/new.png">
                 				    </c:when>
                  					<c:when test="${toppb.mlevel==2 }">
                    				 <img class="level2" src="${conPath }/img/pencil.png">
                  					</c:when>
                   					<c:when test="${toppb.mlevel==3 }">
                    				  <img class="level3" src="${conPath }/img/medal.png">
                  					</c:when>
                   					<c:when test="${toppb.mlevel==4 }">
                    				 <img class="level4" src="${conPath }/img/crown.png">
                  					</c:when>
                			 </c:choose>
                			   </div>
		            		</div>
		            	<div class="left-margin"> 
		          	  		<p class="lead no-padding"><a class="normal-link" href="${conPath }/contentView.do?pbid=${toppb.pbid}">${toppb.pbtitle }</a></p>
		         	  		<p class="ellipsis">
		         	  		<c:choose>
							 	 <c:when test="${fn:length(toppb.mqquote)>170 }">
							 	  "<c:out value="${fn:substring(toppb.mqquote,0,170) }"></c:out>......"
							 	 </c:when>
							 	 <c:otherwise>
							 	 "${toppb.mqquote}"
							 	 </c:otherwise>
							</c:choose>		         	  		
		         	  		</p> 
		            	</div>
		            	<div class="right_bottom_container_close">
		             		<ul>
		             			<li class="list-inline-item"><em>
		             			<fmt:parseDate value="${toppb.pbdate }" var="pbdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		     					<fmt:formatDate value="${pbdate }" pattern="yyyy/MM/dd"/>
		             			</em></li>
  	     			  			<li class="list-inline-item"><img src="${conPath}/img/eye.png" style="width:25px; opacity:0.6;"><span class="highlight2"> ${toppb.pbhit }</span></li>
  	     			  			<li class="list-inline-item"><img src="${conPath}/img/comment.png" style="height:27px;"><span class="highlight2"> ${toppb.commentCnt }</span></li>
  	     			  			<li class="list-inline-item"><img src="${conPath }/img/heart.png" style="width:25px; opacity:${toppb.heartCnt==0? '0.3;':'0.9;'}"><span class="highlight2"> ${toppb.heartCnt }</span></li>
  	     			  		</ul>
		            	  </div>		        		         
		           		</div>	  	     			  
  	     			   </c:if> 	     			 
  	     			 </c:forEach>  	     			 
  	     			 </div>  
  	     			</c:forEach>    
  	     		</div>
  	      </div>
  	  </div>
  	 </div>
  	</div><!-- section2 ends -->