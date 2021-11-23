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
<body class="bg-light">
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/timelineHeader.jsp" />
		<hr>
		
		<section class="timeline-box">
			<!-- 입력상자 -->
			<c:if test="${userId ne null }">
			<div class="border rounded mt-3 bg-white">
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
			
			<!-- 피드 -->
			<c:forEach var="postDetail" items="${postList }">
			<div class="my-3 card border rounded">
			
				<!-- 타이틀 -->
				<div class="dotBox d-flex justify-content-between align-items-center">
					<div class="pl-2">
						<img src="/static/images/cat.jpg" width="40px;" height="40px;">
						${postDetail.post.userName }
					</div>
					
					<!--   더보기 버튼   -->
					<c:if test="${userId ne null }">
						<!-- post의 userId 와 현재 로그인한 사용자의 userId 가 같은지 확인하기  -->
						<c:if test="${postDetail.post.userId eq userId }">
							<div class="more-icon pr-2 pb-2">
								<a class="text-dark moreBtn" href="#" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#deleteModal">
									<i class="bi bi-three-dots"></i>
								</a>
							</div>	
						</c:if>
					</c:if>	
									
				</div>
				
				<!-- 이미지 -->
				<div>
					<img src="${postDetail.post.imagePath }" class="w-100 imageClick" style="height:350px;">
				</div>
				
				<!-- 좋아요  -->
				<div class="d-flex justify-content-between align-items-center mt-1">
					<div class="ml-2">
						
							<c:choose>
								<c:when test="${postDetail.like }">
									<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }">
										<i class="bi bi-heart-fill heart-icon text-danger"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }">
										<i class="bi bi-heart heart-icon text-dark"></i>
									</a>
								</c:otherwise>
							</c:choose>
						
						<span class="pl-1" style="font-size:5px;"> 좋아요 ${postDetail.likeCount }개 </span>
						
					</div>
					<i class="mr-2 bi bi-bookmark"></i>
				</div>
				
				
				<div style="font-size:5px;" class="pr-1 pl-1">
				
					<!-- content -->
					<div class="my-2">
						<b>${postDetail.post.userName }</b> ${postDetail.post.content }
					</div>
					
					<!-- 댓글 타이틀 -->
					<div class="text-secondary">
						댓글
					</div>
					<hr class="my-1">
					
					<!-- 댓글 -->
					<c:forEach var="comment" items="${postDetail.commentList }">
					<div class="my-1">
						<b>${comment.userName }</b> ${comment.content }
					</div>
					</c:forEach>
				
				</div>
					
				<!-- 댓글 입력 -->
				<div class="comment d-flex justify-content-between pl-2 pr-2">
					<div class="d-flex align-items-center">
						<i class="pr-2 bi bi-emoji-smile"></i>
					</div>
					<c:if test="${userId ne null }">
					<div class="input-group d-flex align-items-center">
						<input type="text" class="form-control" id="commentInput-${postDetail.post.id }" placeholder="댓글을 입력하세요.">
						<div class="input-group-append">
							<button type="button" class="btn btn-info commentBtn" data-post-id="${postDetail.post.id }">게시</button>
						</div>
					</div>
					</c:if>
				</div>
								
			</div>	<!-- <div class="my-3 card border rounded">의 끝 -->
			
			</c:forEach>
			<!-- /피드 끝 -->
			
		</section>
		
	</div> <!-- <div id="wrap"> 의 끝 -->
	
	
	<!-- 아래는  다음주소에   https://getbootstrap.com/docs/4.0/components/modal/  -->
	<!-- Button trigger modal -->
	<!-- 
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal">
		  Launch demo modal
		</button>
	 -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body text-center">
	        <a href="#" id="deleteBtn"> 삭제하기 </a>
	      </div>
	      
	    </div>
	  </div>
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
		

			$(".likeBtn").on("click", function(e){
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else if(data.result == "fail"){
							alert("좋아요 실패");
						}else{  // data.result == "noLogin"
							alert("로그인한 경우만 좋아요를 할 수 있습니다.");
						}
					},
					error: function(e){
						alert("error");
					}
					
				});
				
			});
		
			/*
			$(".unLikeBtn").on("click", function(e){
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("좋아요 취소 실패");
						}
						
					},
					error: function(e){
						alert("error");
					}
					
				});
				
			});
			*/
			
			$(".moreBtn").on("click", function(e){
				e.preventDefault();
				var postId = $(this).data("post-id");
				// <a href="#" id="deleteBtn" data-post-id=""></a>
				$("#deleteBtn").data("post-id", postId);
				
			});
			
			$("#deleteBtn").on("click", function(e){
				e.preventDefault();
				//alert($(this).data("post-id"));
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else if(data.result == "fail"){
							alert("삭제 실패");
						}else{     // data.result == "noMatch" 일 경우
							alert("해당 게시물을 올린 사용자만 게시물을 삭제할 수 있습니다.");
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