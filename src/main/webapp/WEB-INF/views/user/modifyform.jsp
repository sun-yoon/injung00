<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.injung.domain.UserVO" %>


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
						filepath.innerHTML = "<input id="+"Myprofile"+" name="+"profile"+" type="+"hidden"+" value="+data+">";
						
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
			</script>

				<form id="modify_form" name="modifyform" action="/user/modify" method="post" >
				
				<input id="Myprofile" type="hidden">
				
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
					
					
					<a href="/">취소</a>
					<input type="submit" value="수정">
					
				</form>
			
		






</body>
</html>