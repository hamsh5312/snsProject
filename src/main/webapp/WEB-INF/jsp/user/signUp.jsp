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
				
					<div class="mt-1 text-center">				
						<span style="font-size:10px;">친구들의 사진과 동영상을 보려면 가입하세요.</span>
					</div>
					<div>
						<a href="https://www.facebook.com/" style="text-decoration-line:none;"><input type="submit" class="btn btn-secondary btn-block mt-3" value="Facebook으로 로그인"></a>
					</div>
					<div class="d-flex mt-2">
						<hr width="130px;">
						<span>또는</span>
						<hr width="130px;">
					</div>
					
					
					<div class="d-flex">
						
						<input type="text" id="loginIdInput" style="width:180px;" class="form-control mt-2 mr-3" placeholder="아이디를 입력하세요.">
						<input type="button" id="duplicateCheckBtn" style="width:100px;" class="btn btn-primary btn-block mt-3" value="중복확인">
						
					</div>
					
					
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호를 입력하세요.">
						<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="비밀번호 확인">
						<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
						<input type="text" id="emailInput" class="form-control mt-3" placeholder="이메일">
						<input type="button" id="signUpBtn" class="btn btn-info btn-block mt-3" value="가입">
					
					
					<div class="d-flex align-items-center justify-content-between">
						<div class="text-center mt-3 mr-5">
						<span>계정이 있으신가요?</span>
						</div>
						<div>	
							<a href="/user/signin_view" style="text-decoration-line:none;"><input type="submit" style="height:40px;" class="btn btn-info btn-block mt-3" value="로그인"></a>
						</div>
					</div>
				
				
				</div>
			</div>
		
		</section>
		
		
		<footer>
		
		</footer>
		
		
	</div>
	
	
	<script>
		
	$(document).ready(function(){
		
		
		// 중복체크 여부 확인 변수
		var isChecked = false;
		// 중복이 되었는지 안되엇는지 확인 변수
		var isDuplicate = false;
		
		
		$("#signUpBtn").on("click", function(e){
			
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			
			if(loginId == null || loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			// 중복 체크 여부 유효성 검사
			if(isChecked == false){
				alert("중복체크를 진행해 주세요!");
				return;
			}
			
			// loginId가 중복된 경우
			if(isDuplicate == true){
				alert("중복된 loginId는 입력할 수 없습니다 !!");
				return;
			}
			
			if(password == null || password == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			if(passwordConfirm == null || passwordConfirm == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if(name == null || name == ""){
				alert("이름을 입력하세요.");
				return;
			}
			
			if(email == null || email == ""){
				alert("이메일을 입력하세요.");
				return;
			}
			
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "password":password, "name":name, "email":email},
				success:function(data){
					
					if(data.result == "success"){
						location.href="/user/signin_view";
					}else{
						alert("회원가입 실패");
					}
					
				},
				error:function(e){
					alert("error");
				}
				
			});
			
			
		});
		
		
		
		
		$("#duplicateCheckBtn").on("click", function(){
			
			//e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			
			if(loginId == null || loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			
			$.ajax({
				type:"get",
				url:"/user/duplicationTest",
				data:{"loginId":loginId},
				success:function(data){
					// data{"isDuplcation":true}
					// {"isDuplcation":false}
					
					isChecked = true;
					
					if(data.isDuplication){
						alert("아이디가 중복되었습니다.");
						isDuplicate = true;
						isChecked = false;
					}else{
					 	alert("사용할 수 있는 아이디입니다.");
					 	isDuplicate = false;
						
					}
				},
				error:function(e){
					alert("error");
				}
				
			
			});	
			
		});
		
		
		$("#loginIdInput").change(function(){
			isChecked = false;
		});
		
		
		
	});	
	
	</script>
	
	
</body>
</html>