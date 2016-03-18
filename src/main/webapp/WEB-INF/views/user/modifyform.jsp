<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.injung.domain.UserVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<style>
.fileDrop {
	width: 120px;
	height: 160px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
</head>
<body>

	<div class="fileDrop">
			<div id="profile">
				<img src='/displayFile?fileName=${authUser.profile }'/><br/>
				수정할 사진을 올리세요.
			</div>
			</div><br/>
			<script type="text/javascript" src=http://code.jquery.com/jquery-latest.min.js></script>
			<script>
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					url: '/uploadAjax',
					data: formData,
					dataType: 'text',
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data){						
						var str = "";
						if(checkImageType(data)) {
							str = "<div><a href=/displayFile?fileName="+getImageLink(data)+">"
								+ "<img src='/displayFile?fileName="+data+"'/>"
								+ "</a></div>"; 
						}else {
							alert("이미지 파일만 가능합니다.");
						}
						
						var filepath = document.getElementById("Myprofile");
						filepath.innerHTML = "<input id="+"img"+" name="+"profile"+" type="+"hidden"+" value="+data+">";
						
						var profile = document.getElementById("profile");
						profile.innerHTML = str;
					}
				});
			});
			
			function checkImageType(fileName) {
				var pattern = /jpg|gif|png|jpeg/i;
				
				return fileName.match(pattern);
			}
			
			function getImageLink(fileName) {
				if(!checkImageType(fileName)) {
					return;
				}
				var front = fileName.substr(0,12);
				var end = fileName.substr(14);
				
				return front+end;
			}
			
			function validate(){
				var f=document.forms[0];
				
				if(! f.password.value){ 	
					alert("비밀번호를 입력하세요");
					f.password.focus();
					return false;
				}

				if(! f.name.value){ 	
					alert("이름을 입력하세요");
					f.name.focus();
					return false;
				}

				if(! f.email.value){ 	
					alert("이메일을 입력하세요");
					f.email.focus();
					return false;
				}
				
				if(! f.gender.value){ 	
					alert("성별을 입력하세요");
					
					return false;
				}

				if(! f.birthDate.value){ 	
					alert("생년월일일 입력하세요");
					f.birthDate.focus();
					return false;
				}
				
			}

			</script>

				<form id="modify_form" name="modifyform" action="/user/modify" method="post" >
				
				<div id="Myprofile">
					<input id="img" name="profile" type="hidden">
				</div>				
				
					<label class="block-label" for="id">ID</label>
					<input id="id" name="id" type="text" value="${authUser.id}" disabled>
					
					
					<label class="block-label">Password</label>
					<input name="password" type="password" value="${authUser.password}">
					
					<label class="block-label">Name</label>
					<input id="name" name="name" type="text"  value="${authUser.name}">
					
					<label class="block-label" >E-Mail</label>
					<input id="email" name="email" type="text"  value="${authUser.email}">
					
					<fieldset>
					<legend>Gender</legend>
						<label>FEMALE</label> <input type="radio" name="gender" value="female" >
						<label>MALE</label> <input type="radio" name="gender" value="male">
					</fieldset>
					
					<label class="block-label" >Birth-Date</label>
					<input id="birthDate" name="birthDate" type="text" value="${fn:substring(authUser.birthDate,0,10)}" >
					
					
					<a href="/">취소</a>
					<input type="submit" value="수정">
					
				</form>
			
		






</body>
</html>