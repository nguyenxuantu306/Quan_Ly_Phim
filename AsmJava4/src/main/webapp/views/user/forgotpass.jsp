<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FORGOT PASSWORD</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<h2 class="tm-text-primary mb-5 text-center">Forgot Password</h2>
	<form id="login-form" action="" method="POST"
		class="tm-contact-form mx-auto">
		<div class="form-group">
			<input type="text" name="email" id="email" class="form-control rounded-0"
				placeholder="Email" required />
		</div>
		<div class="form-group tm-text-center center">
			<button id="sendBtn" type="submit" class="btn btn-primary">Send</button>
		</div>
		<h5 style="color: red" id="messageReturn"></h5>
	</form>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>