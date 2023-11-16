<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 유저 조회</title>
</head>
<body>
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
		<table>
			<tr><th>번호</th><th>회원번호</th><th>레벨</th><th>아이디</th><th>닉네임</th><th>이름</th></tr>
			<c:forEach var="user1" items="${user1List }">
				<tr>
					<td>${num }</td>
					<td>${user1.user_num }</td>
					<td>${user1.user_level}</td>
					<td><a href="detailUser?user_num=${user1.user_num }">${user1.user_id }</a></td>
					<td>${user1.nick }</td>
					<td>${user1.user_name}</td>
				</tr>
				<c:set var="num" value="${num -1 }"></c:set>
			</c:forEach>
		</table>
		
			<!-- 페이지네이션  -->
				 <nav class="d-flex justify-content-center justify-content-md-center">
      	   		 <ul class="pagination pagination-sm text-gray-400">
				  	<c:if test="${page.startPage > page.pageBlock }">
				  		<li class="page-item">
							<a class="page-link page-link-arrow" href="listAllUser?currentPage=${page.startPage-page.pageBlock }">
							<i class="fa fa-caret-left">이전</i></a>
						</li>
					</c:if>
					
				    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<li class="page-item">
								<a class="page-link" href="listAllUser?currentPage=${i }">${i}</a>
						</li>
					</c:forEach>
				    <c:if test="${page.endPage < page.totalPage }">
				    	<li class="page-item">
							<a class="page-link page-link-arrow" href="listAllUser?currentPage=${page.startPage + page.pageBlock }">
							<i class="fa fa-caret-right">다음</i></a>
						</li>
					</c:if>
				 </ul>
		  		</nav>
</body>
</html>