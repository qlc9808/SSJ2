<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    
    <!-- Title -->
    <title>맛있게! 즐겁게! 건강한 습관 커뮤니티 + Life is the best game.</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header4.jsp"/>

	<!-- yr 작성 -->
	<!-- 최신 인증글 -->
	<section class="py-12">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
					<!-- Heading -->
					<h2 class="mb-10">소세지들 인증타임</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
		
					<!-- 인증글 시작 -->
					<c:forEach var="certList" items="${chgCertList }" varStatus="status">
					
						<c:if test="${certList.brd_step == 0 }">

							<div class="mt-3 d-flex justify-content-center">

								<!-- Card -->
								<div class="card-lg card border col-10">
									<div class="card-body">
					
										<!-- Header -->
										<div class="row align-items-center mb-6">
											<div class="col-4">
					
												<!-- 인증 사진 -->
												<img src="${pageContext.request.contextPath}/upload/${certList.img}" alt="certImg" class="img-fluid">
					
											</div>
											<div class="col-8 ms-n2">
					
												<!-- 유저 프로필 사진 -->
						                    	<div class="avatar avatar-lg">
													<img src="${pageContext.request.contextPath}/upload/${certList.user_img}" alt="profile" class="avatar-img rounded-circle">
												</div>
												
												<!-- Header -->
												<div class="row mb-6">
													<div class="col-12">
													<!-- Nick & Date -->
														<span class="fs-xs text-muted">
															<a href="#" data-bs-toggle="modal" onclick="userInfoModal('인증', ${status.index})">
																<span style="color: black;">${certList.nick}</span>
															</a>

															<span>, ${certList.reg_date }</span>
														</span>
													</div>
												</div>
											</div>
										</div>
										
										<!-- Blockquote -->
										<blockquote class="mb-0">

											<!-- Title -->
											<p class="mb-2 fs-lg fw-bold">
												${certList.title}
											</p>

											<!-- conts -->
											<p class="text-gray-500">
												${certList.conts }
											</p>

											<footer class="fs-xs text-muted">
												<c:choose>
													<c:when test="${sessionScope.user_num != null }">
														<!-- 로그인 한 상태 -->
												
														<c:choose>
															<c:when test="${certList.likeyn > 0}">
																<!-- 좋아요 눌렀을 때 -->
																<a class="rate-item" data-toggle="vote" data-count="${certList.like_cnt}" href="#" role="button" onclick="likePro(${status.index})">
																	좋아요 
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
																		<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
																	</svg>
																</a>
															</c:when>
												
															<c:otherwise>
																<!-- 좋아요 안 눌렀을 때 -->
																<a class="rate-item" data-toggle="vote" data-count="${certList.like_cnt}" href="#" role="button" onclick="likePro(${status.index})">
																	좋아요 
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
																		<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
																	</svg>
																</a>
												
												
															</c:otherwise>
												
														</c:choose>
												
													</c:when>
												
													<c:otherwise>
														<!-- 로그인 안 한 상태 -->
														<a class="rate-item" data-toggle="vote" data-count="${certList.like_cnt}" href="#" role="button">
															좋아요 
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
																<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
															</svg>
														</a>
													</c:otherwise>
												
												</c:choose>

												<a class="rate-item" data-toggle="vote" data-count="100" href="#" role="button" onclick="comment(${certList.brd_num})">
													댓글
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
														<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
														<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2"/>
													</svg>
												</a>
												
											</footer>
										</blockquote>
					
									</div>
								</div>
					
							</div>
						</c:if>
					
					</c:forEach>
				</div>
			</div>
		</div>
	</section>	
	
	
	
	
	
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>