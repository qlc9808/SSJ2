<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우 리스트</title>
</head>
<body>

  <div class="tab-pane fade" id="ssjFriendsTab">
  
  
    <div class="row justify-content-center py-9">
      <div class="col-12 col-lg-10 col-xl-8">
        <div class="row">
          <div class="col-12">
  
            <!-- content -->
            <div class="review">
              <!-- Body -->
              <c:forEach var="ssj" items="${listSsj}" varStatus="status">
                <div class="review-body">
                  <div class="row" id="ssj${status.index}">
                    <input type="hidden" id="ssjImg${status.index}" value="${ssj.img}">
                    <input type="hidden" id="ssjNick${status.index}" value="${ssj.nick}">
                    <input type="hidden" id="ssjUserNum${status.index}" value="${ssj.user_num}">
                    <!-- profile -->
                    <div class="col-12 col-md-auto">
                      <div class="avatar avatar-xxl mb-6 mb-md-0">
                        <span class="avatar-title rounded-circle">
                          <img src="${ssj.img}" alt="profile" class="avatar-title rounded-circle">
                        </span>
                      </div>
                    </div>
  
                    <!-- nick -->
                    <div class="col-12 col-md">
                      <div class="row mb-6">
                        <div class="col-12">
                          <a href="#" data-bs-toggle="modal" onclick="userInfoModal(${status.index})">
                            <span>${ssj.nick}</span>
                          </a>
                          <!-- 글씨 빨간색으로 나옴 -> 검은색으로 나오게 수정해야함 -->
                        </div>
                      </div>
                    </div>
  
                    <!-- reg_date & fork -->
                    <div class="col-12 col-md">
                      <!-- reg_date -->
                      <div class="row mb-6">
                        <div class="col-12">
  
                          <!-- 오늘 날짜 -->
                          <jsp:useBean id="javaDate" class="java.util.Date" />
                          <fmt:formatDate var="nowDateFd" value="${javaDate }" pattern="yyyy-MM-dd" /><br>
  
                          <!-- 마지막 인증 게시판 작성일자 -->
                          <fmt:formatDate var="lastRegDateFd" value="${ssj.brd_reg_date }" pattern="yyyy-MM-dd" /><br>
  
                          <c:if test="${ssj.brd_reg_date != null }">
  
                            <fmt:parseDate var="nowDatePd" value="${nowDateFd }" pattern="yyyy-MM-dd" />
                            <fmt:parseDate var="lastRegDatePd" value="${lastRegDateFd }" pattern="yyyy-MM-dd" />
  
                            <fmt:parseNumber var="nowDatePn" value="${nowDatePd.time/(1000*60*60*24) }"
                              integerOnly="true" />
                            <fmt:parseNumber var="lastRegDatePn" value="${lastRegDatePd.time/(1000*60*60*24) }"
                              integerOnly="true" />
  
                            <c:set var="dDay" value="${nowDatePn - lastRegDatePn}" />
  
                            <span>
                              ${dDay }일 전
                            </span>
                          </c:if>
  
                        </div>
                      </div>
  
                      <c:choose>
                        <c:when test="${sessionScope.user_num != null}">
                          <!-- 로그인 한 상태 -->
                          <!-- fork -->
                          <div class="row align-items-center">
                            <div class="col-auto">
                              <!-- Button -->
                              <a class="btn btn-xs btn-outline-border" href="#!"
                                onclick="forkModalCall(${status.index})">찌르기</a>
                            </div>
                          </div>
                        </c:when>
  
                        <c:when test="${sessionScope.user_num == null}">
                          <!-- 로그인 안 한 상태 -->
                          <!-- loginForm으로 이동 -->
                          <div class="row align-items-center">
                            <div class="col-auto">
                              <!-- Button -->
                              <a class="btn btn-xs btn-outline-border" href="/loginForm">찌르기</a>
                            </div>
                          </div>
                        </c:when>
  
                      </c:choose>
                    </div>
  
                  </div>
  
                </div>
  
              </c:forEach>
  
              <!-- nick 클릭 시 나타나는 modal -->
              <!-- Modal -->
              <div class="modal fade" id="userShowModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class="col-12 col-md-auto">
                        <div class="avatar avatar-xxl mb-6 mb-md-0">
                          <span class="avatar-title rounded-circle">
                            <img src="" alt="profile" class="avatar-title rounded-circle" id="displayUserImg">
                            <!-- img 불러와지는지 확인해야함 -->
                          </span>
                        </div>
                      </div>
                      <div class="col-12 col-md">
                        <div class="row mb-6">
                          <div class="col-12">
                            <p id="displayUserNick"></p>
                          </div>
                        </div>
                      </div>
                    </div>
  
                    <div class="modal-footer">
  
                      <button type="button" class="btn btn-danger" name="user_num" onclick="following(${status.index})"
                        id="follow">팔로우</button>
                      <form id="followingForm">
                        <input type="hidden" id="inputUserNum1" name="user_num">
                      </form>
  
                      <button type="button" class="btn btn-info" onclick="sendMessage(${status.index})">쪽지보내기</button>
                      <form id="sendMessageForm">
                        <input type="hidden" id="inputUserNum2" name="user_num">
                      </form>
  
                    </div>
                  </div>
                </div>
              </div>
  
  
              <!-- BG 찌르기 fork 기능 모달창	 Wait List 를 참고함 -->
              <div class="modal fade" id="modalfork" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <input type="hidden" name="ssjUserNum" id="ssjUserNum">
                    <input type="hidden" name="sendMailUser_num" id="sendMailUser_num">
  
                    <!-- Close -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                      <i class="fe fe-x" aria-hidden="true"></i>
                    </button>
  
                    <!-- Header-->
                    <div class="modal-header lh-fixed fs-lg">
                      <strong class="mx-auto">찌르기</strong>
                    </div>
  
                    <!-- Body -->
                    <div class="modal-body">
  
                      <!-- <div class="row mb-6"> -->
                      <!-- <div class="col-12 col-md-3"> -->
                      <!-- 아바타 부분 보류 Image -->
                      <!-- <a href="./product.html">
                  <img class="img-fluid mb-7 mb-md-0" src="./assets/img/products/product-6.jpg" alt="...">
                </a>
              </div> -->
  
                      <!-- 보류 칸 <div class="col-12 col-md-9"> -->
                      <!-- Label -->
                      <!-- <p>
                  <a class="fw-bold text-body" href="./product.html">Cotton floral print Dress</a>
                </p>
              </div> -->
                      <!-- </div> -->
  
  
                      <div class="row">
                        <div class="col-12">
                          <!-- Text -->
                          <p class="fs-sm text-center text-charcol-400">
                            인증 활동이 뜸한 참가자들에게 격려 메일을 보내보세요!
                          </p>
                        </div>
                      </div>
  
  
                      <div class="row gx-5 mb-2">
                        <!-- Form group -->
                        <div class="form-group">
                          <textarea class="form-control form-control-sm" id="cheerUpMsg" name="conts" rows="4"
                            required></textarea>
                        </div>
                      </div>
  
  
                      <div class="row">
                        <div class="col-12 text-center">
                          <!-- Button -->
                          <button class="btn btn-dark" type="submit" onclick="sendMail()">메일 보내기</button>
                        </div>
                      </div>
  
                    </div>
  
                  </div>
  
                </div>
              </div>
  
            </div>
  
          </div>
  
        </div>
      </div>
    </div>
  
  
  </div>





  <div class="review">

    <!-- Body -->
    <div class="review-body">
      <div class="row">
        <div class="col-12 col-md-auto">

          <!-- Avatar -->
          <div class="avatar avatar-xxl mb-6 mb-md-0">
            <span class="avatar-title rounded-circle">
              <i class="fa fa-user"></i>
            </span>
          </div>

        </div>
        <div class="col-12 col-md">

          <!-- Header -->
          <div class="row mb-6">
            <div class="col-12">

              <!-- Rating -->
              <div class="rating fs-sm text-dark" data-value="3">
                <div class="rating-item">
                  <i class="fas fa-star"></i>
                </div>
                <div class="rating-item">
                  <i class="fas fa-star"></i>
                </div>
                <div class="rating-item">
                  <i class="fas fa-star"></i>
                </div>
                <div class="rating-item">
                  <i class="fas fa-star"></i>
                </div>
                <div class="rating-item">
                  <i class="fas fa-star"></i>
                </div>
              </div>

            </div>
            <div class="col-12">

              <!-- Time -->
              <span class="fs-xs text-muted">
                Sophie Casey, <time datetime="2019-07-07">07 Jul 2019</time>
              </span>

            </div>
          </div>

          <!-- Title -->
          <p class="mb-2 fs-lg fw-bold">
            Cute, but too small
          </p>

          <!-- Text -->
          <p class="text-gray-500">
            Shall good midst can't. Have fill own his multiply the divided. Thing great. Of heaven whose signs.
          </p>

          <!-- Footer -->
          <div class="row align-items-center">
            <div class="col-auto d-none d-lg-block">

              <!-- Text -->
              <p class="mb-0 fs-sm">Was this review helpful?</p>

            </div>
            <div class="col-auto me-auto">

              <!-- Rate -->
              <div class="rate">
                <a class="rate-item" data-toggle="vote" data-count="2" href="#" role="button">
                  <i class="fe fe-thumbs-up"></i>
                </a>
                <a class="rate-item" data-toggle="vote" data-count="1" href="#" role="button">
                  <i class="fe fe-thumbs-down"></i>
                </a>
              </div>

            </div>
            <div class="col-auto d-none d-lg-block">

              <!-- Text -->
              <p class="mb-0 fs-sm">Comments (1)</p>

            </div>
            <div class="col-auto">

              <!-- Button -->
              <a class="btn btn-xs btn-outline-border" href="#!">
                Comment
              </a>

            </div>
          </div>

        </div>
      </div>
    </div>

    <!-- Child review -->
    <div class="review review-child">
      <div class="review-body">

        <!-- Content -->
        <div class="row">
          <div class="col-12 col-md-auto">

            <!-- Avatar -->
            <div class="avatar avatar-xxl mb-6 mb-md-0">
              <span class="avatar-title rounded-circle">
                <i class="fa fa-user"></i>
              </span>
            </div>

          </div>
          <div class="col-12 col-md">

            <!-- Header -->
            <div class="row mb-6">
              <div class="col-12">

                <!-- Rating -->
                <div class="rating fs-sm text-dark" data-value="4">
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                </div>

              </div>
              <div class="col-12">

                <!-- Time -->
                <span class="fs-xs text-muted">
                  William Stokes, <time datetime="2019-07-14">14 Jul 2019</time>
                </span>

              </div>
            </div>

            <!-- Title -->
            <p class="mb-2 fs-lg fw-bold">
              Very good
            </p>

            <!-- Text -->
            <p class="text-gray-500">
              Made face lights yielding forth created for image behold blessed seas.
            </p>

            <!-- Footer -->
            <div class="row align-items-center">
              <div class="col-auto d-none d-lg-block">

                <!-- Text -->
                <p class="mb-0 fs-sm">Was this review helpful?</p>

              </div>
              <div class="col-auto me-auto">

                <!-- Rate -->
                <div class="rate">
                  <a class="rate-item" data-toggle="vote" data-count="7" href="#" role="button">
                    <i class="fe fe-thumbs-up"></i>
                  </a>
                  <a class="rate-item" data-toggle="vote" data-count="0" href="#" role="button">
                    <i class="fe fe-thumbs-down"></i>
                  </a>
                </div>

              </div>
              <div class="col-auto d-none d-lg-block">

                <!-- Text -->
                <p class="mb-0 fs-sm">Comments (0)</p>

              </div>
              <div class="col-auto">

                <!-- Button -->
                <a class="btn btn-xs btn-outline-border" href="#!">
                  Comment
                </a>

              </div>
            </div>

          </div>
        </div>

      </div>
    </div>

  </div>
</body>
<%@ include file="../footer.jsp" %>
</html>