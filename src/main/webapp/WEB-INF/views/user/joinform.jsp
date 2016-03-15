<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<html>
<head>
	<title>Home</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="/injung/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="content">
		<div id="user">
			<form id="join-form" name="joinform" method="post" action="/user/join">
			
			<label class="block-label" for="id">ID</label>
			<input id="id" name="id" type="text" value="">
			<input id="button-checkid" type="button" value="id 중복체크">
			<img src="" id="image-checkid" style="display:none; width:16px">
	
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
