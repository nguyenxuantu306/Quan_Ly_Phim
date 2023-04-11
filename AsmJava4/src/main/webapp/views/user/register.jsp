<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REGISTER</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<h2 class="tm-text-primary mb-5 text-center">Register</h2>
	<form id="register-form" action="" method="POST"
		class="tm-contact-form mx-auto">
		<div class="form-group">
			<input type="text" name="username" class="form-control rounded-0"
				placeholder="Username" required />
		</div>
		<div class="form-group">
			<input type="password" name="password" class="form-control rounded-0"
				placeholder="Password" required />
		</div>
		<div class="form-group">
			<input type="password" name="cfmpass" class="form-control rounded-0"
				placeholder="Confirm Password" required />
		</div>
		<div class="form-group">
			<input type="email" name="email" class="form-control rounded-0"
				placeholder="Email" required />
		</div>
		<div class="form-group tm-text-center center">
			<button type="submit" class="btn btn-primary">Register</button>
		</div>
	</form>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>