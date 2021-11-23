<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<header class="d-flex">
			<div class="Hbox">
			
			</div>
			<div class="header-box d-flex justify-content-around">
				
				<i class="bi bi-instagram" style="font-size:35px;"></i>
				
				<div class="searchBar" style="width:200px; height:50px;">
					<form>
					<!-- 왜 이 아래에 pt-3 이 표시 말고 d-flex align-items-center 를 이용해서 맞추려고 하면 안될까? -->
						<div class="input-group pt-3">
							<input type="text" class="form-control" id="search">
							<div class="input-group-append">
								<input type="submit" class="btn btn-info" value="검색">
							</div>
						</div>
					</form>
				</div>
				
			</div>
			
			<div class="loginStatusBox">
				<c:choose>
					<c:when test="${not empty userName }" >
						<div class="text-dark d-flex justify-content-center mt-3 pt-1">
							${userName } 님 <a href="/user/sign_out">[로그아웃] </a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-dark d-flex justify-content-center mt-3 pt-1">
							<a href="/user/signin_view">[로그인 하기] </a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			
		</header>
		