<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/assets/css/main.css" rel="stylesheet" type="text/css">
<title>MyPage</title>
</head>
<body>
<div id="container">
		<div id="header">
			<h1><a href="/">Blagazine</a></h1>
			<ul>
				<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="/user/loginform">로그인</a></li>
						<li><a href="/user/joinform">회원가입</a></li>
					</c:when>	
					<c:otherwise>
						<li><a href="/user/modifyform">회원정보수정</a></li>
						<li><a href="/user/logout">로그아웃</a></li>
						<li>${authUser.name }님 안녕하세요 ^^;</li>
					</c:otherwise>
				</c:choose>	
			</ul>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">					
					<h2>Test My Page</h2>
					<p>
						이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>
						메뉴는  사이트 소개, 방명록, 게시판이 있구요. JAVA 수업 + 데이터베이스 수업 + 웹프로그래밍 수업 배운 거 있는거 없는 거 다 합쳐서
						만들어 놓은 사이트 입니다.<br><br>						
					</p>
				</div>
			</div>
		</div>
		<div id="navigation">
			<ul>				
				<li><a href="#">내 글 관리</a></li>
				<li><a href="#">내 친구관리</a></li>
				<li><a href="#">내 정보보기</a></li>				
			</ul>
		</div>
</div>
</body>
</html>