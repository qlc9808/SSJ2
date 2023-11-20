<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 수정양식</title>
</head>
<script type="text/javascript" src="js/th/updateUserFormAdmin.js"></script>
<body>
	<%@ include file="../adminMenu.jsp" %>
	<div class="col-10">
	
		<table class="table table-bordered table-sm mb-0">
			<form action="/updateUserAdmin" method="get" name="frm">
			    <tr>
			      <th scope="row" width="15%">레벨 / 경험치 </th> 
			      <td width="35%">
				      <div class="row">
				      	<div class="form-group col-1 d-flex justify-content-center align-self-center">LV.</div>
				      	<div class="form-group col-4">
							<input type="text" class="form-control form-control-sm" placeholder="레벨" name="user_level" value="${user1.user_level }">
						</div>
						<div class="form-group col-1 d-flex justify-content-center align-self-center">EXP</div>
						<div class="form-group col-5">
							<input type="text" class="form-control form-control-sm" placeholder="경험치" name="user_exp" value="${user1.user_exp }">
						</div>		
					  </div>	      
			      </td>
			      <th rowspan="3" width="15%">사진</th>
				  <td rowspan="3" width="35%">
		  			  <c:if test="${user1.img != null}">
	                  	<img class="card-img-top" src="${pageContext.request.contextPath}/upload/${user1.img}" alt="userImg" style="width: 100%; height: 150px; border-radius: 10px;" >
	                  </c:if>
	                  <c:if test="${user1.img == null}">
	                  	<img class="card-img-top" src="${pageContext.request.contextPath}/upload/뤂다방.png" alt="userDfault" style="width: 100%; height: 150px; border-radius: 10px;">
	                  </c:if>
				  </td>
			    </tr>
			    <tr>
			      <th scope="row">아이디</th>
			      <td>${user1.user_id }</td>
			    </tr>
			    <tr>
			      <th scope="row">이름</th>
			      <td>${user1.user_name }</td>
			    </tr>
			    <tr>
			      <th scope="row">닉네임</th>
			      <td>
				      <div class="form-group col-6">
							<input type="text" class="form-control form-control-sm" placeholder="닉네임" name="nick" value="${user1.nick }">
					  </div>
			      </td>
			      <th>회원상태</th>
			      <c:if test='${user1.status_md == 100 }'>
				      <td>
				      	<!-- 회원 상태 셀렉트 박스-->
	                    <div class="col-12">
	                      <div class="form-group">
	                      	<select class="form-select" id="status_md" name="status_md" class="form-control">
							    <option value="100" selected="selected">일반 회원</option>
							    <option value="101" >멤버쉽 회원</option>
							    <option value="102" >관리자</option>
							</select>
	                      </div>
	                    </div>
				      </td>
			      </c:if>
			      <c:if test='${user1.status_md == 101 }'>
				      <td>
				      	<!-- 회원 상태 셀렉트 박스-->
	                    <div class="col-12">
	                      <div class="form-group">
	                      	<select class="form-select" id="status_md" name="status_md" class="form-control">
							    <option value="100" >일반 회원</option>
							    <option value="101" selected="selected">멤버쉽 회원</option>
							    <option value="102" >관리자</option>
							</select>
	                      </div>
	                    </div>
				      </td>
			      </c:if>
			      <c:if test='${user1.status_md == 102 }'>
				      <td>
				      	<!-- 회원 상태 셀렉트 박스-->
	                    <div class="col-12">
	                      <div class="form-group">
	                      	<select class="form-select" id="status_md" name="status_md" class="form-control">
							    <option value="100" >일반 회원</option>
							    <option value="101" >멤버쉽 회원</option>
							    <option value="102" selected="selected">관리자</option>
							</select>
	                      </div>
	                    </div>
				      </td>
			      </c:if>
			      <c:if test='${user1.status_md == 103 }'>
				      <td>
				      	블랙리스트
				      </td>
			      </c:if>
			    </tr>
			    <tr>
			      <th scope="row">이메일</th>
			      <td colspan="3">
			      	<div class="form-group col-4">
							<input type="text" class="form-control form-control-sm" placeholder="이메일" name="email" value="${user1.email }">
					</div>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">생년월일</th>
			      <td>
					<div class="form-group col-8">
						<input type="date" class="form-control form-control-sm" placeholder="생년월일" name="birth" 
							   value="<fmt:formatDate value="${user1.birth }" pattern="yyyy-MM-dd"></fmt:formatDate>">
					</div>
			      </td>
			      <th>성별</th>
			      <c:if test="${user1.gender == 'F' }">
			      	<td>  
	                    <!-- 성별 셀렉트 박스-->
	                    <div class="col-8">
	                      <div class="form-group">
	                      	<select class="form-select" id="gender" name="gender" class="form-control">
							    <option value="F" selected="selected">여자</option>
							    <option value="M" >남자</option>
							</select>
	                      </div>
	                    </div>
			      	</td>
			      </c:if>
			      <c:if test='${user1.gender == "M" }'>
					<td>  
	                    <!-- 성별 셀렉트 박스-->
	                    <div class="col-8">
	                      <div class="form-group">
	                      	<select class="form-select" id="gender" name="gender" class="form-control">
							    <option value="F" >여자</option>
							    <option value="M" selected="selected">남자</option>
							</select>
	                      </div>
	                    </div>
			      	</td>
			      </c:if>
			    </tr>
			    <tr>
			      <th scope="row">주소</th>
			      <td colspan="3">
			      	<div class="form-group col-6">
							<input type="text" class="form-control form-control-sm" placeholder="주소" name="addr" value="${user1.addr }">
					</div>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">전화번호</th>
			      <td colspan="3">
			      	<div class="form-group col-6">
							<input type="text" class="form-control form-control-sm" placeholder="휴대폰번호" name="tel" value="${user1.tel}">
					</div>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">가입일자</th>
			      <td><fmt:formatDate value="${user1.reg_date }" pattern="yyyy년 MM월 dd일, HH시 mm분 ss초"></fmt:formatDate></td>
			      <th>마지막 로그인</th>
			      <td><fmt:formatDate value="${user1.last_lgn_date }" pattern="yyyy년 MM월 dd일, HH시 mm분 ss초"></fmt:formatDate></td>
			    </tr>
			    <tr>
			      <th scope="row">탈퇴여부</th>
			      <td>${user1.delete_yn }</td>
			      <th>탈퇴일자</th>
			      <td><c:if test="${user1.delete_yn == 'Y' }"><fmt:formatDate value="${user1.end_date }" pattern="yyyy년 MM월 dd일, HH시 mm분 ss초"></fmt:formatDate></c:if></td>
			    </tr>
				<tr style="border-bottom: none;">
					<td colspan="2" align="right" style="border-left: none; border-right: none;" class="px-0"><button class="btn btn-sm btn-dark mx-1" onclick="return chk()">확인</button></td>
				<div class="form-group">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="user_num" value="${user1.user_num }">
				</div>	
		</form>
					<td colspan="2" align="left"  style="border-left: none; border-right: none;" class="px-0"><button class="btn btn-sm btn-dark mx-1" onclick="location.href='/detailUserByAdmin?user_num=${user1.user_num}&pageNum=${pageNum}'">취소</button></td>		
				</tr>
				   			    
		</table>	
		
		<div class="d-flex justify-content-start mt-5">
			 
		</div>	
	

	</div>
	
		<div class="py-10"></div>	
	</div>	<!-- adminMenu.jsp 에서 <div class="row"> 닫기 용   -->
	</div>  <!-- adminMenu.jsp 에서 <div class="container"> 닫기용 -->
	<%@ include file="/WEB-INF/views/footer.jsp" %> <!-- 이렇게해야 푸터가 꽉차게 들어감 -->
</body>
</html>