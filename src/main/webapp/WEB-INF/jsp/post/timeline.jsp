<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timeline</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/timelineHeader.jsp" />
		<hr>
		
		<section class="timeline-box bg-light">
			
			<!-- 입력상자 -->
			<c:if test="${userId ne null }">
			<div class="border rounded mt-3 mb-3 bg-white">
				<div>
					<textarea class="form-control w-100 border-0 non-resize" rows="3" id="contentInput" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="d-flex justify-content-between m-2">
					<a href="#" id="imageUploadBtn"><i class="bi bi-image image-upload-icon"></i></a>
					<input type="file" id="fileInput" class="d-none" accept="image/*">
		
					<button type="button" id="uploadBtn" class="btn btn-sm btn-info">업로드</button>
				</div>
			</div>
			</c:if>
			
			<!-- /피드 -->
			<c:forEach var="postDetail" items="${postList }">
			<div class="my-4 border rounded">
				<!-- 타이틀 -->
				<div class="dotBox pl-2 d-flex justify-content-between align-items-center">
					<div>
						<img src="/static/images/hm_circle.png" width="40px;" height="40px;">
						<span>${postDetail.post.userName }</span>
					</div>						
					<img src="/static/images/dotImage.png" class="pr-2" width="25px;" height="25px;">	
				</div>
				<!-- 이미지 -->
				<div class="image-box">
					<img src="${postDetail.post.imagePath }" class="w-100 h-100">
				</div>
				<div class="otherContents">
					<div class="likeBox d-flex justify-content-between align-items-center pb-1">
						<div class="ml-2">
							<img src="/static/images/heart.png" class="mr-1" width="20px;" height="20px;">
							<img src="/static/images/wordPic.png" class="mr-1" width="20px;" height="20px;">
							<img src="/static/images/airplane.png" width="20px;" height="20px;">
						</div>
						<img src="/static/images/shape.png" class="mr-2" width="20px;" height="20px;">
					</div>
					
					<div class="opinionBox">
						<div style="font-size:5px;" class="pr-1 pl-1">
							<div class="mb-1">
								<span class="pl-1">좋아요 971,645개</span><br>
							</div>
							
							<div>
								<b>${postDetail.post.userName }</b> ${postDetail.post.content } <br>
								<div class="text-secondary">댓글</div>
									<hr class="my-1">
									<!-- 댓글 -->
									<!--  postDetail > commentList -->
									<c:forEach var="comment" items="${postDetail.commentList }">
									<div class="my-1">
										<b>${comment.userName }</b> ${comment.content }
									</div>
									</c:forEach>
							</div>
							
						</div>
					</div>
				</div>
					
				<div class="comment d-flex justify-content-between">
					<div class="d-flex align-items-center pl-2">
						<img src="/static/images/smile.jpeg" class="pr-2" width="30px;" height="30px;">
					</div>
					<c:if test="${userId ne null }">
					<div class="input-group d-flex align-items-center pr-2">
						<input type="text" class="form-control" id="commentInput-${postDetail.post.id }" placeholder="댓글을 입력하세요.">
						<div class="input-group-append">
							<button type="button" class="btn btn-info commentBtn" data-post-id="${postDetail.post.id }">게시</button>
						</div>
					</div>
					</c:if>
				</div>
				
			</div>	
			</c:forEach>
			
		</section>
		
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#imageUploadBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			
			$("#uploadBtn").on("click", function(){
				
				var content = $("#contentInput").val().trim();
				
				if(content == null || content == ""){
					alert("내용을 입력하세요.");
					return ;
				}
				
				// 파일이 무조건 있어야한다고 생각하고 설계했을때, 유효성검사하기
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return ;
				}		
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				// enctype 은  인코딩 타입
				$.ajax({
					enctype:"multipart/form-data",   // 파일 업로드 필수
					processData:false,    //  파일 업로드 필수  
					contentType:false,    //  파일 업로드 필수 
					type:"post",
					url:"/post/create",
					data:formData,
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("글쓰기에 실패했습니다.");
						}
						
					},
					error:function(e){
						alert("error");
					}
					
				});		
				
			});
			
			
			$(".commentBtn").on("click", function(){
				// 지금 이벤트가 발생한 객체
				// 클릭된 버튼 객체
				var postId = $(this).data("post-id");
				
				//alert(postId);
				//대응되는 input 의 value
				// ex) postId = 5;
				//  "#commentInput-5"
				var content = $("#commentInput-" + postId).val();
				
				if(content == null || content == "") {
					alert("댓글 내용을 입력하세요.");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data){
						if(data.result == "success"){
							//alert("댓글 작성 성공");
							location.reload();
						}else{
							alert("댓글 작성 실패");
						}
					},
					error:function(e){
						alert("error");
					}
					
				});
			});
		
		
		
				
		});
	
	</script>



</body>
</html>