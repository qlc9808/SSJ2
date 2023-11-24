<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/topBar.jsp" %>    
<%@ include file="/WEB-INF/views/header4.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fileUpdate(){
		var fileInput = document.getElementById('fileInput');
		if(fileInput.style.display == "none"){
			fileInput.style.display = "block";
			fileInput.removeAttribute('disabled');
			$("#imgOroot").hide();
			$("#chgBtn").html("변경 취소");
		} else{
			fileInput.style.display = "none";
			fileInput.setAttribute('disabled', 'true');
			$("#imgOroot").show();
			$("#chgBtn").html("파일 변경");
		}
	}
	
	function fileDelete(){
		if($("#Img").css("display") != "none"){
			$("#Img").hide();
			$("#imgOroot").hide();
			$("#delBtn").html("취소");
			$("#delStatus").val(1);
		} else{
			$("#Img").show();
			$("#imgOroot").show();
			$("#delBtn").html("파일 삭제");
			$("#delStatus").val(0);
		}
	}
</script>

</head>
<body>
	
	<div class="container">
		<form action="noticeUpdate" method="post" enctype="multipart/form-data">
			<div id="qbd-main" class="qbd-main" style="height: auto;">
				<div class="qbd-mainbody" style="height: auto;">
					<div id="qbd-title" class="qbd-title">
						<div class="qbd-title-content">
							<span class="title-text">${noticeConts.title }</span>
						</div>
						<div class="qbd-object">					
								<input type="hidden" value="${noticeConts.brd_num  }" name="brd_num">
								<input type="hidden" value="${noticeConts.user_num  }" name="user_num">					
								<c:if test="${status_md==102 }">
									<input type="submit" value="수정" class="btn-danger btn-xxs">							
								</c:if>
								<input type="button" value="목록" onclick="location.href='notice?brd_md=${noticeConts.brd_md}'" class="btn-danger btn-xxs">
							
						</div>	
					</div>
					<div class="qbd-line">
						<div class="qbd-line-box">
							<span class="qbd-line-box-text">작성자: ${noticeConts.user_num }<input type="hidden" value="${noticeConts.user_num }" name="user_num"></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="qbd-line-box-text">작성일: <fmt:formatDate value="${noticeConts.reg_date }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="qbd-line-box-text">카테고리: ${noticeConts.category }</span>
						</div>
						<!-- <div class="qbd-line-li"></div> -->
					</div>
					<hr class="custom-hr">
					<div class="container">
		    			<div class="row border">
		    				<div class="col-8 p-4 mt-4" >
								<div class="qbd-content">
									<div class="qbd-content text"  id="test">
										<c:if test="${not empty noticeConts.img }"><img alt="UpLoad Image" src="${pageContext.request.contextPath}/upload/${noticeConts.img}" id="Img"><p></c:if>				
										<span>
											<textarea rows="30" cols="30" name="conts">${noticeConts.conts }</textarea>
										</span>
									</div>						
								</div>						
								<input type="file" name="file1" style="display: none;" id="fileInput" disabled="disabled">
								<span id="imgOroot">${pageContext.request.contextPath}/upload/${noticeConts.img}</span>
								<button type="button" onclick="fileUpdate()" id="chgBtn">파일 변경</button>											
								<button type="button" onclick="fileDelete()" id="delBtn">파일 삭제</button>
								<input type="hidden" name="delStatus" id="delStatus" value="0">					
							</div>   			
						</div>
					</div>
					<hr class="custom-hr">				
				</div>
			</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>