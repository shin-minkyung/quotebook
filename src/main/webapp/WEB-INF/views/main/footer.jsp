<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<script>
$(document).ready(function(){
	$("#admin_loginBtn").click(function(){
		var aid = $("#aid").val();
		var apw = $("#apw").val();
		$.ajax({
			url:'${conPath}/adminChk.do',
			type:'post',
			datatype:'html',
			data:'aid='+aid+'&apw='+apw,  			
			success:function(data, status){
				var trimdata = data.trim();
				var result= parseInt(data.trim());
				var msg = trimdata.substring(trimdata.indexOf(',')+1, trimdata.length);				
				if(result==-1 || result ==0){
					$("#message").html(msg);
				}else if(result==1){
					$("form[name='adlogin']").trigger('submit');
				}
			}  				
		});
	});
});
</script>
 
<div id="footer_container">
  <div class="row">
    <div class="col-lg-4">
    	<p>Designed and Developed by <strong>Shin Min Kyung</strong></p>
    	<p>
    	<c:if test="${aid==null && mid==null}">
    	 <button class="btn btn-hidden" data-toggle="modal" data-target="#myModal">Are you administrator?  <span class="glyphicon glyphicon-log-in"></span></button>
    	</c:if>
    	<c:if test="${aid!=null }">
    	Administrator Mode
    	</c:if>
    	<c:if test="${mid!=null }">
    	Member Mode
    	</c:if>
    	</p>
    	<p>
    	<button class="btn btn-hidden" data-toggle="modal" data-target="#session">Session View</button>
    	</p>
    </div>
    <div class="col-lg-4">
    		<p>Terms of Service</p>
    		<p> Privacy Police</p>
    		<p>Contact Developer</p>
    </div>
    <div class="col-lg-4">ⓒ  2018 quote book, Inc. All rights reserved.</div>
  </div>
  
  <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">      
        <h4 class="modal-title">Administrator Login</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
      	<div id="message"></div>
         <form action="${conPath }/adminLogin.do" method="post" name="adlogin">
           	<div class="form-group">
               <label for="aid">Administrator ID</label>
                  <input type="text" class="form-control" name="aid" id="aid" placeholder="Enter ID">
	        </div>
 			<div class="form-group">
               <label for="apw">Password</label>
                  <input type="password" class="form-control" name="apw" id="apw" placeholder="Password">  
             </div>
               <button type="button" id="admin_loginBtn" class="btn btn-primary btn-lg btn-block">Submit</button>                                        
          </form>                	
      </div>
      <div class="modal-footer">       	 
      </div>
    </div>
  </div>
</div>  <!-- modal ends -->

  <!-- Modal -->
<div id="session" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">      
        <h4 class="modal-title">Session</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
       <%
		Enumeration <String> sessionList= session.getAttributeNames();
		int count=0;
			while(sessionList.hasMoreElements()){
				count++;
				String sName=sessionList.nextElement();
				String sValue=session.getAttribute(sName).toString(); ///혹은 (String) 카스트
				out.println(sName+"(name): "+sValue+"(value)<br>");		
				}
		if(count==0){
			out.println("no session value<br>");		
		}
		%>	         	
      </div>
      <div class="modal-footer">       	 
      </div>
    </div>
  </div>
</div>  <!-- modal ends -->

</div>