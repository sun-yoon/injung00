<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<input type="hidden" name="no" value="${userVO.no }">

		<div id="header">
		
		<a href="/">
		<img id="profile" src="http://www.jun.co.jp/files/img/company/detail_kitsune/logo_l_kitsune.gif" >
		</a>
			
			<ul>
				<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="/user/loginform">로그인</a></li>
						<li><a href="/user/joinform">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/modifyform">회원정보수정</a></li>
						<li><a href="/user/remove">회원탈퇴</a></li>
						<li><a href="/user/logout">로그아웃</a></li>
						<li>${authUser.name }is member.</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>