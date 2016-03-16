<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src=http://code.jquery.com/jquery-latest.min.js></script>
	<script type="text/javascript">
$(function(){
	$("#id").change( function(){
		 $("#button-checkid").show();
		 $("#image-checkid").hide();		
	});
	
	$( "#button-checkid" ).click( function(){
		var id = $("#id").val();
		if( id == "" ) {
			return;
		} 
		
		$.ajax( {
		   url : "/user/checkid?id=" + id,
		   type: "get",
		   dataType: "json",
		   data: "",
	  //  contentType: "application/json",
  	       success: function( response ){
			 console.log( response );
			 if(response.data == true) {
				 $("#id").val( "" );
				 alert( "이미 존재하는 ID입니다. 다른 ID를 사용해 주세요." );
				 $("#id").focus();
				 return;
			 }
			 
			 // 사용 가능한 경우
			 $("#button-checkid").hide();
			 $("#image-checkid").show();
	       },
		   error: function( jqXHR, status, error ){
			  console.error( status + " : " + error );
		   }
	   });
	});
});
</script>
</head>
<body>
<div id="content">
		<div id="user">
			<form id="join-form" name="joinform" method="post" action="/user/join">
			
			<label class="block-label" for="id">ID</label>
			<input id="id" name="id" type="text" value="">
			<input id="button-checkid" type="button" value="ID 중복체크">
			<img src="/assets/images/check.png" id="image-checkid" style="display:none; width:16px">
	
			<label class="block-label">PASSWORD</label>
			<input name="password" type="password" value="">
	
			<label class="block-label" for="name">NAME</label>
			<input id="name" name="name" type="text" value="">
	
			<label class="block-label" for="email">E-MAIL</label>
			<input id="email" name="email" type="text" value="">
	
	
			<fieldset>
				<legend>성별</legend>
					<label>FEMALE</label> <input type="radio" name="gender" value="female" checked="checked">
					<label>MALE</label> <input type="radio" name="gender" value="male">
			</fieldset>
			
			<label class="block-label" for="birthDate">BirthDate</label>
			<input id="birthDate" name="birthDate" type="text" value="">
	
	
			<fieldset>
				<legend>약관동의</legend>
					<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
					<label>서비스 약관에 동의합니다.</label>
			</fieldset>
	
			<input type="submit" value="SIGN-UP">
		
			</form>
		</div>
	</div>
</body>
</html>
