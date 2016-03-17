<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 
	<form id="find-idform" name="findidform" action="/user/findId" method="post">
		
		<div class="form-group has-feedback">
			<input type="text" id="email" name="email" class="form-control"
				placeholder="E-MAIL" /> 
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		
		<div class="form-group has-feedback">
			<input type="text" id="name" name="name" class="form-control"
				placeholder="NAME" /> 
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		
		<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat" id="find-id" name="find-id">Find
					ID</button>
		</div>
		
	</form>
</body>
</html>