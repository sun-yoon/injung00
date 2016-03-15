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
					
					<label class="block-label">?앸뀈?붿씪</label>
					<input id="birthDate" name="birthDate" type="text"  value="">
					
					<label class="block-label">?⑥뒪?뚮뱶</label>
					<input name="password" type="password" value="">
					
					<label class="block-label">?대찓??/label>
					<input id="email" name="email" type="text"  value="">
					
					<label class="block-label" >?대쫫</label>
					<input id="name" name="name" type="text"  value="">
					
					<label class="block-label">?섏씠</label>
					<input id="age" name="age" type="text"  value="">
					
					<label class="block-label" >踰덊샇</label>
					<input id="phone" name="phone" type="text"  value="">
					
					
					
					
					<input type="submit" value="?섏젙?섍린">
					
				</form>
			
		

</body>
</html>