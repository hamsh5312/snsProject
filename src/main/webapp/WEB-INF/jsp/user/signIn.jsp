<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>


	<div id="wrap">
		
		<header>
		
		</header>
		
		<section class="content">
			<div class="d-flex justify-content-center align-items-center">
				
				<div class="mr-5 mt-5">
					<img src="/static/image/insta_img.jpg" width="250px;" height="350px;">
				</div>
				
				<div class="login-box mt-5 pt-5">
					<input type="text" class="form-control" placeholder="아이디를 입력하세요.">
					<input type="password" class="form-control mt-3" placeholder="비밀번호를 입력하세요.">
					<input type="submit" class="btn btn-dark btn-block mt-3" value="로그인">
					<div class="d-flex mt-3">
						<hr width="130px;">
						<span>또는</span>
						<hr width="130px;">
					</div>
					<div class="d-flex justify-content-center">
						<label>
							<img src="/static/image/facebook.png" width="30px;" height="30px;" class="mr-3">	
							<a href="https://www.facebook.com/" style="text-decoration-line:none;"><span>facebook으로 로그인</span></a>
						</label>
					</div>
					
					<div class="d-flex justify-content-center mt-2">
						<span>비밀번호를 잊으셨나요?</span>
					</div>
					<div class="text-center mt-2">
							<a href="/user/signup_view" style="text-decoration-line:none;"><input type="submit" class="btn btn-secondary btn-block mt-3" value="가입하기"></a>
					</div>	
				</div>
			
			</div>
			
				
			
		</section>
		
		<footer>
			
		</footer>
		
	
	</div>
	
</body>
</html>