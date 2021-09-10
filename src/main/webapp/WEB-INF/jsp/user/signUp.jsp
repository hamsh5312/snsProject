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
				<div class="login-box">
			
				<img src="/static/image/instagram-new-logo.png" width="300px;" height="70px;">
				
					<div class="mt-2">				
						<span>친구들의 사진과 동영상을 보려면 가입하세요.</span>
					</div>
					<div>
						<a href="https://www.facebook.com/"><input type="submit" class="btn btn-info btn-block mt-3" value="Facebook으로 로그인"></a>
					</div>
					<div class="d-flex">
						<input type="text" style="width:180px;" class="form-control mt-2 mr-3" placeholder="아이디를 입력하세요.">
						
						<input type="submit" style="width:100px;" class="btn btn-info btn-block mt-3" value="중복확인">
						
					</div>
					<input type="password" class="form-control mt-3" placeholder="비밀번호를 입력하세요.">
					<input type="password" class="form-control mt-3" placeholder="비밀번호 확인">
					<input type="password" class="form-control mt-3" placeholder="이름">
					<input type="password" class="form-control mt-3" placeholder="이메일">
					<input type="submit" class="btn btn-info btn-block mt-3" value="가입">
					
					<div class="d-flex align-items-center justify-content-between">
						<div class="text-center mt-3 mr-5">
						<span>계정이 있으신가요?</span>
						</div>
						<div>	
							<a href="/user/signin_view"><input type="submit" style="height:40px;" class="btn btn-info btn-block mt-3" value="로그인"></a>
						</div>
					</div>
				
				
				</div>
			</div>
		
		</section>
		
		
		<footer>
		
		</footer>
		
		
	</div>
	
	
</body>
</html>