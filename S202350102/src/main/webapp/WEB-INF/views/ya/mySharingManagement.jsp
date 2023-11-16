<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 필수!! -->
 <div class="container">
         <div class="row profile">
            <div class="col-md-3">
                <%@ include file="../mypageMenu.jsp" %>
            </div>
             <div class="col-md-9 profile-form">
<!-- 필수!! -->
    <section class="community">
        <div class="page-title">
            <div class="container">
                <h3>내가 올린 쉐어링 </h3>
            </div>
        </div>
      <!-- 게시판리스트  -->
        <div id="board-list">
            <div class="container">
                <table id="boardtable">
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">게시글번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-applicants">모집인원</th>
                            <th scope="col" class="th-bank_duedate">입금기한</th>
                            <th scope="col" class="th-check">승인관리</th>
                        </tr>
                    </thead>                 
                    <tbody>
                        <c:forEach var="board" items="${myUploadSharingList}">
                            <tr>
                                <td>${board.brd_num}</td>
                                <td>${board.title}</td>
                                <td>${board.applicants}</td>                  
                                <td>${board.bank_duedate}</td>
				         		<td><button type="button" class="btn btn-dark btn-sm" id="openModalButton" data-toggle="modal" data-target="#joinInfoModal" 
				         					data-brd_num="${board.brd_num}"> 참가자조회</button></td>       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>  
             </div>          
        </div>
    </section>


<!--모달창 띄우기---->
<div class="modal  fade" id="joinInfoModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title">쉐어링 참가자 조회</h6>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
            	<input type="hidden" name="brd_num" value="${board.brd_num}"> 
            	<h6>총 참가자 수 : ${board.participants}</h6>
            	<table class="table table-hover" id="joinInfoForm">		
                    <thead>
                        <tr>
                            <th scope="col" class="th-nick">닉네임</th>
                            <th scope="col" class="th-name">이름</th>
                            <th scope="col" class="th-message">메시지</th>
                            <th scope="col" class="th-tel">연락처</th>
                            <th scope="col" class="th-reg_date">신청일자</th>
                            <th scope="col" class="th-check">승인처리</th>
                        </tr>
                    </thead>                 
                    <tbody>
                        <c:forEach var="sharingList" items="${sharingParticipantsInfo}">
                            <tr>
                                <td>${sharingList.nick}</td>
                                <td>${sharingList.user_name}</td>
                                <td>${sharingList.message}</td>                  
                                <td>${sharingList.tel}</td>
                                <td>${sharingList.reg_date}</td>                              
				         		<td><button type="button" class="btn btn-dark btn-sm" id="confirmModalButton">승인</button>
				         		    <button type="button" class="btn btn-dark btn-sm" id="rejectModalButton">반려</button></td>       
                            </tr>
                        </c:forEach>
                    </tbody>                            
                </table>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark btn-sm" data-dismiss="modal">닫기</button>
     	  	 </div>
        </div>	  	 
    </div>
</div>
</div>
</div>
<!-------------------------------- 참가자 조회 모달창 자바스크립트 ------------------------------------------------------------------------>
<script type="text/javascript">
    // 모달창열기
    document.addEventListener('DOMContentLoaded', function() {
        const modalBtn = document.querySelector('[data-target="#joinInfoModal"]');
        modalBtn.addEventListener('click', function() {
        	const brd_num = parseInt(modalBtn.getAttribute('data-brd_num'), 10);
        	const url = `/sharingParticipantsInfo?brd_num=${board.brd_num}`;
       		console.log("board brd_num:"+brd_num);
            // 게시글별 쉐어링 참가자 불러오기
            fetch(url)
            .then(response => response.json())
            .then(userList => {
                const userData = userList;
                if (userData) {
                    document.getElementById('nick').value = userData.sharingList.nick;
                    document.getElementById('user_name').value = userData.sharingList.user_name;
                    document.getElementById('message').value = userData.sharingList.message;
                    document.getElementById('tel').value = userData.sharingList.tel;
                    document.getElementById('reg_date').value = userData.sharingList.reg_date;
                    console.log("userData :" + userData);
                    console.log("brd_num :" + brd_num);
                }
            })               .catch(error => {
                    console.error('Error fetching user data:', error);
                });
        });
    });		   	
</script>

<%@ include file="../footer.jsp" %>
</html>