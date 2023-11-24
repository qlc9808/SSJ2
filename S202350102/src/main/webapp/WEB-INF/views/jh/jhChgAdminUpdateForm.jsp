<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="py-11">
 <div class="container">
        <div class="row">
          <div class="col-12 text-center">
			
            <!-- Heading -->
            <div class="pt-10 pb-5">
            
            	<h3 class="mb-10">
            	<c:choose>
            		<c:when test="${state_md ==102 }">
		            	진행중 
            		</c:when>
            		<c:when test="${state_md ==103 }">
            			종료
            		</c:when>
            		<c:when test="${state_md ==104 }">
            			반려
            		</c:when>
            		<c:otherwise>
            			신청
            		</c:otherwise>
            	</c:choose>
            	챌린지 수정 관리</h3>
            </div>

          </div>
        </div>
        
        <div class="row">
        <!--사이드바   -->
        <%@ include file="adminSidebar.jsp" %>
        
        <div class="col-10">
        <form action="">
		<table class="table table-bordered table-sm mb-0">
			    <tr>
			      <th scope="row" >챌린지명</th>
			      <td><input type="text" id="title" name="title" value="${chg.title }" required></td>
			      <th rowspan="3">썸네일</th>
				  <td rowspan="3">
				  <c:choose>
				  	<c:when test="${chg.thumb !=null }">
	                  	<img class="card-img-top" src="${pageContext.request.contextPath}/upload/${chg.thumb }" alt="챌린지 썸네일" style="width: 100%; height: 150px; border-radius: 10px;" >
				  	</c:when>
				  	<c:otherwise>
	                  	<img class="card-img-top" src="assets/img/chgDfaultImg.png" alt="userDfault" style="width: 100%; height: 150px; border-radius: 10px;">
				  	</c:otherwise>
				  </c:choose>
				  </td>
			    </tr>
			    <tr>
			      <th scope="row">개설자 아이디 / 개설자 닉네임</th>
			      <td><input type="hidden" name="user_id" value=""> / <input type="hidden" name="nick" value="${chg.nick }">${chg.nick }</td>
			    </tr>
			    <tr>
			      <th scope="row">개설자 이름</th>
			      <td><input type="hidden" name="" value="${chg.userName }"> ${chg.userName }</td>
			    </tr>
			    <tr>
			      <th scope="row">카테고리</th>
			      <td>                    <c:forEach var="category" items="${category }" varStatus="status">
	                    	<div class="input-group-text border-0">
								<input class="form-check-input" 
								       type="radio" 
								       name="chg_md" 
								       id="category${status.index}"
								       ${status.index == 0 ? 'checked' : ''} 
								       value="${category.md }"  
								       required="required"
								       onclick="ajaxRecommendList(${category.md })">
	                    		<label class="form-check-label" for="category${status.index}">${category.ctn }</label>
	                    	</div>
	              	</c:forEach></td>
			      <th>진행상태</th>
			      <td><input type="text" name="stateCtn" value="${chg.stateCtn }">${chg.stateCtn }</td>
			    </tr>
			    <tr>
			    	<c:if test='${chg.state_md == 104 }'>
				      <th scope="row">반려사유</th>
				      <td colspan="3">${chg.returnReason }</td>
			    	</c:if>
			    </tr>
			    <tr>
			      <th scope="row">참가자수    /  참여정원</th>
			      <td> <input type="number" name="chgrParti" value="${chgrParti }">  / <input type="number" name="chg_capacity" value="${chg.chg_capacity }"></td>
			      <th>찜수</th>
				  <td><input type="hidden" name="pick_cnt" value="${chg.pick_cnt }">${chg.pick_cnt }</td>
			    </tr>
			    <tr>
			      <th scope="row">챌린지 소개</th>
			      <td colspan="3"><input type="text" name="chg_conts" value="${chg.chg_conts }"></td>
			    </tr>
			    <tr>
			      <th scope="row">인증방법</th>
			      <td colspan="3"><input type="text" name="upload" value="${chg.upload }"></td>
			    </tr>
			    
			    <tr>
				    <th scope="row">인증빈도</th>
				      <td>${chg.freq }</td>
				      <th rowspan="3">인증 예시</th>
					  <td rowspan="3">
		                  	<img class="card-img-top" src="${pageContext.request.contextPath}/upload/${chg.sample_img }" alt="userImg" style="width: 100%; height: 150px; border-radius: 10px;" >
					  </td>
				</tr>
			    <tr>
			      <th scope="row">공개여부</th>
			      <td>
	                    	<div>
		                      <!-- Male -->
		                      <input class="btn-check" type="radio" name="chg_public" id="public" value="0" checked>
		                      <label class="btn btn-sm btn-outline-border" for="public">공개</label>
		
		                      <!-- Female -->
		                      <input class="btn-check" type="radio" name="chg_public" id="private" value="1">
		                      <label class="btn btn-sm btn-outline-border" for="private">비공개</label>
		
		                    </div>

			      </td>
			    </tr>
			    <tr>
			      <th scope="row">비밀번호</th>
			      <td><input type="number" name="priv_pswd" value="${chg.priv_pswd}">${chg.priv_pswd}</td>
			    </tr>
			    <tr>
			      <th scope="row">챌린지 신청일</th>
			      <td colspan="3"><input class="form-control form-control-sm" name="end_date" id="end_date" type="date" required value="${reg_date }"></td>
			    </tr>
			    <tr>
			      <th scope="row">챌린지 개설일</th>
			      <td colspan="3"><input class="form-control form-control-sm" name="end_date" id="end_date" type="date" required value="${create_date }"></td>
			    </tr>
			    <tr>
			      <th scope="row">챌린지 종료일</th>
			      <td colspan="3"><input class="form-control form-control-sm" name="end_date" id="end_date" type="date" required value="${endDate }"></td>
			    </tr>
		</table>
		<div class="d-flex justify-content-start mt-5">
			<button class="btn btn-sm btn-dark mx-1" onclick="currentPageMove()">목록</button>
			
		
			<!-- 챌린지 진행중, 반려 땐 수정/삭제, 종료엔 삭제 버튼만 활성화  -->
			<c:choose>
				<c:when test="${chg.state_md == 102 || chg.state_md == 104 }">
					<button class="btn btn-sm btn-info mx-1" type="submit" id="chgUpdate"  >수정</button>
					<button class="btn btn-sm btn-dark mx-1" onclick="approvReturnFn(0)" id="chgDelete" >삭제</button>
				</c:when>
				<c:when test="${chg.state_md == 103 }">
					<button class="btn btn-sm btn-dark mx-1" onclick="approvReturnFn(0)" id="chgDelete" >삭제</button>
				</c:when>
			</c:choose>

		</div>	
        </form>
		</div>
		<div class="py-10"></div>	
      </div>
      </div>
      </section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>