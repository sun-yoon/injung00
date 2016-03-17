<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
	
	function validate(){
		var f=document.forms[0];
		
		if(! f.id.value){ 	
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}

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

		if(! f.birthDate.value){ 	
			alert("생년월일일 입력하세요");
			f.birthDate.focus();
			return false;
		}
		
	}

</script>
</head>
<body>
<div id="content">
		<div id="user">
			<div class="fileDrop">
			<div id="profile">
			프로필 사진을 올리세요.
			</div>
			</div><br/>
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
						
						//$(".profile").append(str);
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
		
			<form id="join-form" name="joinform" method="post" action="/user/join" onsubmit="return validate();">			
			
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
			
			<input type="reset" value="다시입력">
			<input type="submit" value="SIGN-UP">
		
			</form>
		</div>
	</div>
</body>
</html>
