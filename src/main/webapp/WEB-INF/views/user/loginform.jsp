<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<label> <input type="checkbox" id="useCookie" name="useCookie">
						Remember ID
					</label>
				</div>
			</div>
			<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat">Sign
					In</button>
			</div>
		</div>
	</form>

</body>
</html>


