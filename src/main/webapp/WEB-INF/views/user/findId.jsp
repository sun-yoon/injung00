<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="container">
		
		<div id="content">
			<div id="user">
				<p class="jr-success">
				
				<c:choose>
				<c:when test="${not empty findUser }">
				
				<label class="block-label" for="id">ID</label>
				<input id="id" name="id" type="text" value="${findUser.id}" disabled>
					<li><a href="/user/loginform">로그인</a></li>
					<li><a href="/user/findpwform">PW 찾기</a></li>
					<li><a href="/">메인으로 돌아가기</a></li>
				</c:when>
				
				<c:otherwise>
				<label class="block-label" for="id">ID가 없습니다.</label>
				<li><a href="/user/joinform">회원가입</a></li>
				<li><a href="/">메인으로 돌아가기</a></li>
				</c:otherwise>
				</c:choose>
				<br><br>
					
				</p>				
			</div>
		</div>
			
	</div>
</body>
</html>