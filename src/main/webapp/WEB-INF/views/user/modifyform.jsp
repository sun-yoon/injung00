<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.injung.domain.UserVO" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

				<form id="modify_form" name="modifyform" action="/user/modify" method="post" >
				<input type="hidden" name="a" value="modify">
					<label class="block-label" for="id">ID</label>
					<input id="id" name="id" type="text" value="${authUser.id}" disabled>
					
					
					<label class="block-label">Password</label>
					<input name="password" type="password" value="${authUser.password}">
					
					<label class="block-label">Name</label>
					<input id="name" name="name" type="text"  value="${authUser.name}">
					
					<label class="block-label" >E-Mail</label>
					<input id="email" name="email" type="text"  value="${authUser.email}">
					
					<label class="block-label">Gender</label>
					<input id="gender" name="gender" type="text" value="${authUser.gender}">
					
					<label class="block-label" >Birth-Date</label>
					<input id="birthDate" name="birthDate" type="text" value="${authUser.birthDate}" >
					
					
					
					<input type="submit" value="수정">
					
				</form>
			
		






</body>
</html>