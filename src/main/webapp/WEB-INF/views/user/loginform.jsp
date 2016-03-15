<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 

<script type="text/javascript" src=http://code.jquery.com/jquery-latest.min.js></script>
<script type="text/javascript">
$(function(){

var cookie_user_id = getLogin();


if(cookie_user_id != "") {
$("#id").val(cookie_user_id);
$("#useCookie").attr("checked", true);
}

// 아이디 저장 체크시
$("#useCookie").on("click", function(){
var _this = this;
var isRemember;
	
if($(_this).is(":checked")) {
isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? ");
				
if(!isRemember)    
$(_this).attr("checked", false);
}
});

// 로그인 버튼 클릭시
$("#sign-in").on("click", function(){
if($("#useCookie").is(":checked")){ // 저장 체크시
saveLogin($("#id").val());
}else{ // 체크 해제시는 공백
saveLogin("");
}
});
});

/**
* saveLogin
* 로그인 정보 저장
* @param id
*/
function saveLogin(id) {
if(id != "") {
// userid 쿠키에 id 값을 7일간 저장
setSave("userid", id, 7);
}else{
// userid 쿠키 삭제
setSave("userid", id, -1);
}
}

/**
* setSave
* Cookie에 user_id를 저장
* @param name
* @param value
* @param expiredays
*/
function setSave(name, value, expiredays) {
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}

/**
* getLogin
* 쿠키값을 가져온다.
* @returns {String}
*/
function getLogin() {

var cook = document.cookie + ";";
var idx = cook.indexOf("userid", 0);
var val = "";

if(idx != -1) {
cook = cook.substring(idx, cook.length);
begin = cook.indexOf("=", 0) + 1;
end = cook.indexOf(";", begin);
val = unescape(cook.substring(begin, end));
}
return val;
}
</script>
</head>

<body>
	<form id="login-form" name="loginform" action="/user/login" method="post">
		<div class="form-group has-feedback">
			<input type="text" id="id" name="id" class="form-control"
				placeholder="USER ID" /> 
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" id="password" name="password" class="form-control"
				placeholder="Password" /> 
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<label> <input type="checkbox" id="useCookie" name="useCookie"/>
						Remember ID
					</label>
					
				</div>
			</div>
			<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat" id="sign-in" name="sign-in">Sign
					In</button>
			</div>
		</div>
	</form>

</body>
</html>


