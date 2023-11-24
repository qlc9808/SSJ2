<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	sd
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>맛있게! 즐겁게! 건강한 습관 커뮤니티 + Life is the best game.</title>
<%@ include file="/WEB-INF/views/header4.jsp" %>
	<script type="text/javascript">
		// 팔로우 하기 버튼
		function following(p_index) {
			$.ajax({
				url : "/followingPro",
				type : "POST",
				data : {user_num : p_index},
				dataType : 'json',
				success : function(followResult) {
	
					if(followResult.following > 0) {
						$(".follow" + p_index).removeClass("btn-danger");
						$(".follow" + p_index).addClass("btn-light");
						$(".follow" + p_index).text("팔로잉");
					} else if(followResult.following == 0) {
						$(".follow" + p_index).removeClass("btn-light");
						$(".follow" + p_index).addClass("btn-danger");
						$(".follow" + p_index).text("팔로우");
					} else {
						alert("자신의 계정은 팔로우 할 수 없습니다");
					}
				},
				error : function() {
					alert("팔로우 오류");
				}
	
			});
			
		}

		// 좋아요 버튼
		function likePro(type, p_index) {
			var brd_num = '';
			if(type == '인증') {
				brd_num = $('#brd_num' + p_index).val();
			} else {
				brd_num = p_index;
			}
			// alert(brd_num);
			
			// like_cnt 변경하는 거 추가해야함
			// let like_cnt = $('#like_cnt' + p_index).val();
			// let inputLikeCnt = parseInt(like_cnt);
			
			// const result = document.getElementById('inputLikeCnt' + p_index);
			$.ajax({
	            url: "/likePro",
	            type: "POST",
	            data: { brd_num: brd_num },
	            dataType: 'json',
	            success: function (likeResult) {
					// likeProResult에 좋아요 수 담아서 넘어오는거 구현할까 생각 중
	            	if(likeResult.likeProResult > 0) {
	            		// 좋아요 insert
	            		$('#likeBtn' + p_index).attr('src', './images/yr/heart-fill.png');
						// inputLikeCnt = inputLikeCnt + 1;
	            	} else {
	            		// 좋아요 delete
	            		$('#likeBtn' + p_index).attr('src', './images/yr/heart.png');
	            		// inputLikeCnt = inputLikeCnt - 1;
	            	}

					// result.innerText = inputLikeCnt;
	            },
	            error: function () {
	                alert("좋아요 에러");
	            }
	        });
		}
	
		// 댓글 버튼
		function comment(p_index) {
			var user_img 	= $('#user_img' 	+ p_index).val();
			var user_level 	= $('#user_level' 	+ p_index).val();
			var nick 		= $('#nick' 		+ p_index).val();
			var title 		= $('#title' 		+ p_index).val();
			var conts 		= $('#conts' 		+ p_index).val();
			var like_cnt 	= $('#like_cnt' 	+ p_index).val();
			var chg_id 		= $('#chg_id' 		+ p_index).val();

			var brd_num 	= $('#brd_num' 		+ p_index).val();
			var user_num 	= $('#user_num' 	+ p_index).val();
			var brd_group 	= $('#brd_group' 	+ p_index).val();
			var user_exp 	= $('#user_exp' 	+ p_index).val();
			var percentage 	= $('#percentage' 	+ p_index).val();
			var icon		= $('#icon' 		+ p_index).val();
			var likeyn 		= $('#likeyn' 		+ p_index).val();

			// alert("brd_num -> " + brd_num
			// 	+ "/ user_num -> " + user_num
			// 	+ "/ nick -> " + nick
			// 	+ "/ user_img -> " + user_img
			// 	+ "/ title -> " + title
			// 	+ "/ conts -> " + conts
			// 	+ "/ brd_group -> " + brd_group
			// 	+ "/ user_level -> " + user_level
			// 	+ "/ user_exp -> " + user_exp
			// 	+ "/ percentage -> " + percentage
			// 	+ "/ icon -> " + icon
			// 	+ "/ likeyn -> " + likeyn
			// 	+ "/ like_cnt -> " + like_cnt
			// );

			$('#inputUserImg' + p_index).attr('src', '${pageContext.request.contextPath}/upload/' + user_img);
			$('#inputUserLevel' + p_index).attr('title', 'Lv.' + user_level + ' | exp.' + user_exp + '(' + percentage + '%)')
								.attr('src', '/images/level/' + icon + '.gif');
			$('#inputNick' + p_index).text(nick);
			$('#inputTitle' + p_index).text(title);
			$('#inputConts' + p_index).text(conts);
			$('#inputLikeCnt' + p_index).text(like_cnt);
		}
		
		// 댓글 공백 체크
		function commentInsertchk(form) {
			form.conts.value = form.conts.value.trim();
			
			// 댓글 미입력시 체크
			if(form.conts.value.length == 0) {
				alert("댓글을 입력해주세요");
				form.conts.focus();
				return false;
			}
			// 댓글 입력시 실행
			return true;
		}

	</script>
</head>
<body>


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
						<!-- 인증글 원글 -->
						<input type="hidden" 	id="brd_num${status.index}" 		value="${certList.brd_num}">
						<input type="hidden" 	id="like_cnt${status.index }" 		value="${certList.like_cnt }">
						<input type="hidden" 	id="user_num${status.index}"		value="${certList.user_num}">
						<input type="hidden" 	id="nick${status.index}"			value="${certList.nick }">
						<input type="hidden" 	id="user_img${status.index}"		value="${certList.user_img}">
						<input type="hidden" 	id="title${status.index}"			value="${certList.title }">
						<input type="hidden" 	id="conts${status.index}"			value="${certList.conts }">
						<input type="hidden" 	id="brd_group${status.index}"  		value="${certList.brd_group }">
						<input type="hidden" 	id="user_level${status.index }" 	value="${certList.user_level }">
						<input type="hidden" 	id="user_exp${status.index }" 		value="${certList.user_exp }">
						<input type="hidden" 	id="percentage${status.index }" 	value="${certList.percentage }">
						<input type="hidden" 	id="icon${status.index }" 			value="${certList.icon }">
						<input type="hidden" 	id="likeyn${status.index }" 		value="${certList.likeyn }">
						<input type="hidden"	id="chg_id${status.index}"			value="${certList.chg_id}">
					
						<c:if test="${certList.brd_step == 0 }">

							<div class="mt-3 d-flex justify-content-center">

								<!-- Card -->
								<div class="card-lg card border col-10">
									<div class="card-body">
					
										<!-- Header -->
										<div class="row align-items-center mb-6">

											<!-- 인증 사진 -->
											<div class="col-4">
					
												<a href="/chgDetail?chg_id=${certList.chg_id }">
													<img src="${pageContext.request.contextPath}/upload/${certList.img}" alt="certImg" class="img-fluid">
												</a>
					
											</div>

											<div class="col-8 ms-n2">
					
												<!-- 유저 프로필 사진 -->
						                    	<div class="avatar avatar-lg">
													<img src="${pageContext.request.contextPath}/upload/${certList.user_img}" alt="profile" class="avatar-img rounded-circle">
												</div>
												
												<!-- Nick & Date & follow -->
												<div class="row mb-6">
													<div class="col-12">
														<span class="fs-xs text-muted d-flex justify-content-between">
															
															<span>
																<!-- Nick -->
																<img title="Lv.${certList.user_level } | exp.${certList.user_exp}(${certList.percentage }%)" src="/images/level/${certList.icon}.gif">
																
																<span style="color: black;">
																		${certList.nick}
																</span>
																<br>
																
																<!-- Date -->
																<!-- 오늘 날짜 -->
																<jsp:useBean id="javaDate" class="java.util.Date" />
																<fmt:formatDate var="nowDateFd" value="${javaDate }" pattern="yyyy-MM-dd" />
																<fmt:parseDate var="nowDatePd" value="${nowDateFd }" pattern="yyyy-MM-dd" />
																<fmt:parseNumber var="nowDatePn" value="${nowDatePd.time/(1000*60*60*24) }" integerOnly="true" />
																
																<!-- 마지막 작성일자 -->
																<fmt:formatDate var="lastRegDateFd" value="${certList.reg_date }" pattern="yyyy-MM-dd" />
																<fmt:parseDate var="lastRegDatePd" value="${lastRegDateFd }" pattern="yyyy-MM-dd" />
																<fmt:parseNumber var="lastRegDatePn" value="${lastRegDatePd.time/(1000*60*60*24) }" integerOnly="true" />
			
																<c:set var="dDay" value="${nowDatePn - lastRegDatePn}" />
			
																<span>
																	${dDay }일 전
																</span>
															</span>
															
															<!-- follow -->
															<span>
																<c:choose>
																	<c:when test="${sessionScope.user_num != null }">
																	<!-- 로그인 한 상태 -->
																		<c:choose>
																			<c:when test="${certList.followyn == 1}">
																			<!-- 팔로잉 -->
																				<button type="button" class="btn btn-light btn-xxs follow${certList.user_num}" onclick="following(${certList.user_num})">
		                                        									팔로잉
		                                        								</button>
																			</c:when>
																			
																			<c:otherwise>
																			<!-- 팔로우 -->
																				<button type="button" class="btn btn-danger btn-xxs follow${certList.user_num}" onclick="following(${certList.user_num})">
																					팔로우
																				</button>
																			</c:otherwise>
																			
																		</c:choose>
																		
																	</c:when>
																	
																	<c:otherwise>
																	<!-- 로그인 안 한 상태 -->
																		<button type="button" class="btn btn-danger btn-xxs" onclick="location.href='/loginForm'">
																			팔로우
																		</button>
																	</c:otherwise>
																	
																</c:choose>
															
															</span>
														</span>
													</div>
												</div>
												
												<!-- Title & conts -->
												<a href="/chgDetail?chg_id=${certList.chg_id }">
													<!-- Title -->
													<p class="mb-2 fs-lg fw-bold" style="color: black;">
														${certList.title}
													</p>
												
													<!-- conts -->
													<p class="text-gray-500">
														${certList.conts }
													</p>
												</a>
	
												<!-- 좋아요 & 댓글 -->
												<footer class="fs-xs text-muted">
													
													<c:choose>
														<c:when test="${sessionScope.user_num != null }">
															<!-- 로그인 한 상태 -->
															
															<a class="rate-item" data-toggle="vote" href="#" role="button" onclick="likePro('인증', ${status.index})">
																좋아요 
																<c:choose>
																	<c:when test="${certList.likeyn > 0}">
																	<!-- 좋아요 눌렀을 때 -->
																		<img alt="heart-fill" src="./images/yr/heart-fill.png" id="likeBtn${status.index }">
																	</c:when>
														
																	<c:otherwise>
																	<!-- 좋아요 안 눌렀을 때 -->
																		<img alt="heart" src="./images/yr/heart.png" id="likeBtn${status.index }">
																	</c:otherwise>
														
																</c:choose>
																<span id="inputLikeCnt${status.index}">${certList.like_cnt}</span>
															</a>
														</c:when>
													
														<c:otherwise>
															<!-- 로그인 안 한 상태 -->
															<a class="rate-item" data-toggle="vote" data-count="${certList.like_cnt}" href="/loginForm" role="button">
																좋아요 
																<img alt="heart" src="./images/yr/heart.png">
															</a>															
														</c:otherwise>
													
													</c:choose>

													<!-- 댓글 -->
													<a class="rate-item" data-count="${certList.replyCount}" href="#" role="button" onclick="comment(${status.index})"
													data-bs-toggle="modal" data-bs-target="#showModal${status.index}">
														댓글
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
															<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
															<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2"/>
														</svg>
													</a>

												</footer>
											</div>
										</div>
									</div>
								</div>
					
							</div>
						</c:if>

						<!-- 댓글 클릭 시 modal -->
						<div class="modal fade" id="showModal${status.index}" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<!-- Body -->
									<div class="modal-body text-center">
										<!-- 인증글 원글 in modal -->
										<div class="review py-5">
											<div class="row">
												<div class="col-12 col-md-auto">
													<!-- 유저 프로필 사진 -->
													<div class="avatar avatar-lg">
														<img src="" alt="profile" class="avatar-img rounded-circle"
															id="inputUserImg${status.index}">
													</div>
						
													<!-- Nick -->
													<div class="row mb-6">
														<div class="col-12">
															<span class="fs-xs text-muted d-flex justify-content-between">
						
																<span>
																	<!-- Nick -->
																	<img title="" src="" id="inputUserLevel${status.index}">
						
																	<span style="color: black;" id="inputNick${status.index}">
																	</span>
																</span>
															</span>
														</div>
													</div>
												</div>
						
						
						
												<div class="col-12 col-md">
													<div>
														<!-- Title -->
														<p class="mb-2 fs-lg fw-bold" id="inputTitle${status.index}">
														</p>
						
														<!-- Text -->
														<p class="text-gray-500" id="inputConts${status.index}">
														</p>
													</div>
						
						
													<!-- Footer -->
													<div class="row align-items-center">
						
														<div class="col-auto me-auto">
															<!-- Rate -->
															<div class="rate">
																<c:choose>
																	<c:when test="${sessionScope.user_num != null }">
																		<!-- 로그인 한 상태 -->
						
																		<a class="rate-item" data-toggle="vote" href="#" role="button"
																			onclick="likePro('modal', ${certList.brd_num})">
																			<c:choose>
																				<c:when test="${certList.likeyn > 0}">
																					<!-- 좋아요 눌렀을 때 -->
																					<img alt="heart-fill" src="./images/yr/heart-fill.png"
																						id="likeBtn${certList.brd_num }">
																				</c:when>
						
																				<c:otherwise>
																					<!-- 좋아요 안 눌렀을 때 -->
																					<img alt="heart" src="./images/yr/heart.png"
																						id="likeBtn${certList.brd_num }">
																				</c:otherwise>
						
																			</c:choose>
																			<span
																				id="inputLikeCnt${certList.brd_num}">${certList.like_cnt}</span>
																		</a>
																	</c:when>
						
																	<c:otherwise>
																		<!-- 로그인 안 한 상태 -->
																		<a class="rate-item" data-toggle="vote"
																			data-count="${certList.like_cnt}" href="/loginForm" role="button">
																			<img alt="heart" src="./images/yr/heart.png">
																		</a>
																	</c:otherwise>
						
																</c:choose>
						
															</div>
														</div>
						
													</div>
												</div>
											</div>
										</div>
										<hr>
										<!-- 인증글 댓글 -->
										<c:forEach var="comment" items="${chgCertList }">
											<c:if test="${comment.brd_step > 0 && comment.brd_group == certList.brd_num}">
												<div class="review">
													<div class="review-body">
													
													
														<div class="row">
															<div class="col-12 col-md-auto">
																<!-- 유저 프로필 사진 -->
																<div class="avatar avatar-lg">
																	<img src="${pageContext.request.contextPath}/upload/${comment.user_img}" alt="profile" class="avatar-img rounded-circle">
																</div>
									
																<!-- Nick -->
																<div class="row mb-6">
																	<div class="col-12">
																		<span class="fs-xs text-muted d-flex justify-content-between">
									
																			<span>
																				<!-- Nick -->
																				<img title="Lv.${comment.user_level } | exp.${comment.user_exp}(${comment.percentage }%)" src="/images/level/${comment.icon}.gif">
									
																				<span style="color: black;">
																					${comment.nick}
																				</span>
																			</span>
																		</span>
																	</div>
																</div>
															</div>
									
									
									
															<div class="col-12 col-md">
																<div>
																	<!-- Title -->
																	<p class="mb-2 fs-lg fw-bold" style="color: black;">
																		${comment.title}
																	</p>
																
																	<!-- conts -->
																	<p class="text-gray-500">
																		${comment.conts }
																	</p>
																</div>
									
									
																<!-- Footer -->
																<div class="row align-items-center">
									
																	<div class="col-auto me-auto">
																		<!-- Rate -->
																		<div class="rate">
																			<c:choose>
																				<c:when test="${sessionScope.user_num != null }">
																					<!-- 로그인 한 상태 -->
									
																					<a class="rate-item" data-toggle="vote" href="#" role="button"
																						onclick="likePro('modal', ${comment.brd_num})">
																						<c:choose>
																							<c:when test="${comment.likeyn > 0}">
																								<!-- 좋아요 눌렀을 때 -->
																								<img alt="heart-fill" src="./images/yr/heart-fill.png"
																									id="likeBtn${comment.brd_num }">
																							</c:when>
									
																							<c:otherwise>
																								<!-- 좋아요 안 눌렀을 때 -->
																								<img alt="heart" src="./images/yr/heart.png"
																									id="likeBtn${comment.brd_num }">
																							</c:otherwise>
									
																						</c:choose>
																						<span
																							id="inputLikeCnt${comment.brd_num}">${comment.like_cnt}</span>
																					</a>
																				</c:when>
									
																				<c:otherwise>
																					<!-- 로그인 안 한 상태 -->
																					<a class="rate-item" data-toggle="vote"
																						data-count="${comment.like_cnt}" href="/loginForm" role="button">
																						<img alt="heart" src="./images/yr/heart.png">
																					</a>
																				</c:otherwise>
									
																			</c:choose>
									
																		</div>
																	</div>
									
																</div>
															</div>
														</div>
														
													</div>
												</div>
											</c:if>
										</c:forEach>

										
						
										<!-- 인증 댓글 쓰기 Form -->
										<form id="certCommentForm" action="/commentInsert" method="post" onsubmit="return commentInsertchk(this)">
											<div class="row">
						
												<c:choose>
													<c:when test="${sessionScope.user_num != null }">
													<!-- 로그인을 한 경우 -->
														<c:choose>
															<c:when test="">
																<!-- 1. 참가자일 경우 -->
																<div class="col-12 col-md-6">
																	<input type="hidden" name="chg_id" 		value="${certList.chg_id }">
																	<input type="hidden" name="user_num" 	value="${user.user_num }">
																	<input type="hidden" name="brd_num" 	value="${certList.brd_num }">
																	<!-- 유저 닉네임 표시하는 란 Name -->
																	<div class="form-group">
																		<p class="mb-2 fs-lg fw-bold">
																			${user.nick }
																		</p>
																	</div>
																</div>
								
																<div class="col-12">
																	<!-- 제목 입력란  Name -->
																	<div class="form-group">
																		<label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
																		<input class="form-control form-control-sm" id="commentTitle" name="title"
																			type="text" placeholder="제목을 작성해주세요 *">
																	</div>
																</div>
								
																<div class="col-12">
																	<!-- 댓글 입력란 Name -->
																	<div class="form-group">
																		<label class="visually-hidden" for="reviewText">CertBrd:</label>
																		<textarea class="form-control form-control-sm" id="commentConts" name="conts"
																			rows="5" placeholder="댓글을 작성해주세요 *"></textarea>
																	</div>
																</div>
															</c:when>
															
															<c:otherwise>
																<!-- 3. 참여자가 아닌 회원 -->
																<div class="col-12 col-md-6">
																	<!-- 유저 닉네임 표시하는 란 Name -->
																	<div class="form-group">
																		<p class="mb-2 fs-lg fw-bold">
																			${user.nick }
																		</p>
																	</div>
																</div>
								
																<div class="col-12">
																	<!-- 제목 입력란  Name -->
																	<div class="form-group">
																		<label class="visually-hidden" for="reviewTitle">Review Title:</label>
																		<input class="form-control form-control-sm" type="text" name="title"
																			placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled">
																	</div>
																</div>
								
																<div class="col-12">
																	<!-- 댓글 입력란 Name -->
																	<div class="form-group">
																		<label class="visually-hidden" for="reviewText">Review:</label>
																		<textarea class="form-control form-control-sm" rows="5" name="conts"
																			placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled"></textarea>
																	</div>
																</div>
															</c:otherwise>
														</c:choose>
													</c:when>
						
													<c:otherwise>
														<!-- 로그인을 안 한 경우 -->
														<div class="col-12">
															<!-- 제목 입력란  Name -->
															<div class="form-group">
																<label class="visually-hidden" for="reviewTitle">Review Title:</label>
																<input class="form-control form-control-sm" type="text" name="title"
																	placeholder="로그인 해주세요" disabled="disabled">
															</div>
														</div>
						
														<div class="col-12">
															<!-- 댓글 입력란 Name -->
															<div class="form-group">
																<label class="visually-hidden" for="reviewText">Review:</label>
																<textarea class="form-control form-control-sm" rows="5" name="conts"
																	placeholder="로그인 해주세요" disabled="disabled"></textarea>
															</div>
														</div>	
													</c:otherwise>
												</c:choose>
											</div>

											<div class="col-12 text-center">
												<!-- 등록 Button -->
												<button class="btn btn-dark btn-sm" type="submit">
													등록
												</button>
	
												<!-- 닫기 -->
												<button class="btn btn-light btn-sm" data-bs-dismiss="modal" type="button">
													닫기
												</button>
											</div>
										</form>

						
						
									</div>
						
								</div>
						
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</section>	
	
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>