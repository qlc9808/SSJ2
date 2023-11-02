<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
<c:import url="/WEB-INF/views/header4.jsp"/>

<c:choose>
	<c:when test="${sessionScope.user_num != null}">
		<!-- 로그인 한 상태 -->
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			참여하기
		</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						${user_num}
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
						<button type="button" class="btn btn-primary" onclick="join()">참여하기</button>
					</div>
				</div>
			</div>
		</div>
	</c:when>

	<c:when test="${sessionScope.user_num == null}">
		<!-- 로그인 안 한 상태 -->
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" onclick="location.href='/loginForm'">
			참여하기
		</button>
	</c:when>
</c:choose>

<!-- footer -->
<c:import url="/WEB-INF/views/footer.jsp"/>