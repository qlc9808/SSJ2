<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 관리자 페이지</title>
<script type="text/javascript">

	//필터 선택시 페이지 이동
	function fn_sortOpt(){
		//카테고리 전체일 경우 chg_lg=0, chg_md=0이어야 함
		var sortOpt = $('#sortOpt').val()
		var state_md 	= 	${state_md }
		var chg_lg 		= 	${chg_lg }
		var chg_md 		= 	$('.nav-link.active').data('md'); //이것 때문에 "전체"에  data-md="0"필요 없으면 string -> int 에러남
		
		//카테고리 선택 안한 경우 필터만 걸림
		if(chg_lg == 0){
			
			location.href= '/chgAdminList?state_md='+state_md
								+'&sortOpt='+sortOpt;
		//카테고리 선택한 경우 카테고리+필터
		} else {
			location.href= '/chgAdminList?state_md='+state_md
										+'&chg_lg='+chg_lg
										+'&chg_md='+chg_md
										+'&sortOpt='+sortOpt;
		}
	}
	
	/* 페이지네이션 수정중 */
	/* 현재 페이지 클릭시 */
/* 	function currentPageMove(){
	 	var state_md = ${state_md}
	    var chg_lg = ${chg_lg}
	    var chg_md = ${chg_md}
	    var sortOpt = $('#sortOpt').val()
	    //현재 페이지 번호
	    var currentPage = ${page.currentPage}
	    
		location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&sortOpt="+sortOpt+"&currentPage="+currentPage;
			
	}
	 */
	/* 페이지로 이동시 */
	function pageMove(p_index){
	 	var state_md  = ${state_md}
	    var chg_lg 	  = ${chg_lg}
	    var chg_md    = ${chg_md}
	    var sortOpt   = $('#sortOpt').val()
	    var chg_md 		= 	$('.nav-link.active').data('md');
	    //페이지 번호
	    var pageNum   = document.getElementById('pageMove'+p_index).innerText
	    
	    //필터 선택한 경우(진행중/종료 챌린지인 경우)
	    if(sortOpt != null){
	    	
		    //카테고리 선택 안한 경우 + 필터는 자동
		    if(chg_lg == 0){
				location.href= "chgAdminList?state_md="+state_md+"&sortOpt="+sortOpt+"&currentPage="+pageNum;
			//카테고리+필터 선택	
		    } else {
				location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&sortOpt="+sortOpt+"&currentPage="+pageNum;
		    }
		    
		//필터 없는 신청/반려 챌린지인 경우
	    } else{
		    if(chg_lg == 0){
				location.href= "chgAdminList?state_md="+state_md+"&currentPage="+pageNum;
			//카테고리+필터 선택	
		    } else {
				location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&currentPage="+pageNum;
		    }
	    }
			
	}
	 
	//이전/다음 버튼으로 페이지 이동 (테스트 필요)
	function pageMoveNav(pageNum){
	 	var state_md  = ${state_md}
	    var chg_lg 	  = ${chg_lg}
	    var chg_md    = ${chg_md}
	    var sortOpt   = $('#sortOpt').val()
	    var chg_md 		= 	$('.nav-link.active').data('md');
	 
	    //필터 선택한 경우(진행중/종료 챌린지인 경우)
	    if(sortOpt != null){
	    	
		    //카테고리 선택 안한 경우 + 필터는 자동
		    if(chg_lg == 0){
				location.href= "chgAdminList?state_md="+state_md+"&sortOpt="+sortOpt+"&currentPage="+pageNum;
			//카테고리+필터 선택	
		    } else {
				location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&sortOpt="+sortOpt+"&currentPage="+pageNum;
		    }
		    
		//필터 없는 신청/반려 챌린지인 경우
	    } else{
		    if(chg_lg == 0){
				location.href= "chgAdminList?state_md="+state_md+"&currentPage="+pageNum;
			//카테고리+필터 선택	
		    } else {
				location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&currentPage="+pageNum;
		    }
	    }
	    //원래 아래 주소인데 필터 유무와 카테고리 유무 때문에 위처럼 바꿈 근데 테스트 필요
		//location.href = "chgAdminList?state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&sortOpt="+sortOpt+"&currentPage="+pageNum;
	}

	//상세 페이지 이동
	function chgAdminDetail(pChg_id){
	    var chg_id 	  	= pChg_id
	 	var state_md  	= ${state_md}
		var currentPage = ${page.currentPage}
	    var chg_lg 	  	= ${chg_lg}
	    var sortOpt   	= $('#sortOpt').val()
	    var chg_md 		= 	$('.nav-link.active').data('md');
	    //필터 있는 경우 (진행/종료 챌린지)
   	    if(sortOpt != null){
		    if(chg_lg == 0){
				location.href= "chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&currentPage="+currentPage+"&sortOpt="+sortOpt+"&chgUpdateMode=0";
		    	
		    } else {
				location.href= "chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&currentPage="+currentPage+"&sortOpt="+sortOpt+"&chgUpdateMode=0&chg_lg="+chg_lg+"&chg_md="+chg_md;
		    	
		    }
		//필터 없는 경우(신청/반려 챌린지 경우)
   	    } else{
   	    	//카테고리 선택 안 한 경우
		    if(chg_lg == 0){
				location.href= "chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&currentPage="+currentPage+"&chgUpdateMode=0";
		    //카테고리 선택 한 경우	
		    } else {
				location.href= "chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&chg_lg="+chg_lg+"&chg_md="+chg_md+"&currentPage="+currentPage+"&chgUpdateMode=0";
		    	
		    }
   	    	
   	    }
   	    	
	} 
</script>

</head>
<body>
<section class="pt-7 pb-12">
 <div class="container">
        <div class="row">
          <div class="col-12 text-center">
			
            <!-- Heading -->
            <div class="col-12 text-center">
            
            	<h3 class="mb-10">
            	<c:choose>
            		<c:when test="${state_md ==102 }">
		            	진행중 
            		</c:when>
            		<c:when test="${state_md ==103 }">
            			종료된
            		</c:when>
            		<c:when test="${state_md ==104 }">
            			반려된
            		</c:when>
            		<c:otherwise>
            			신청
            		</c:otherwise>
            	</c:choose>
            	챌린지 관리</h3>
            </div>

          </div>
        </div>
        
        <div class="row">
        <!--사이드바   -->
        <%@ include file="adminSidebar.jsp" %>
          
       <!--  <div class="row align-items-center col-md-10"> -->
       <div class="col-md-10 ">
       <div class="row mb-5">
          <div class="col-12 col-md-9 text-center mb-5">

            <!-- Categories -->
            <nav class="nav nav-overflow mb-6 mb-md-0">
              <a class="nav-link  ${chg_md eq 0 ? 'active' : ''}" href="/chgAdminList?state_md=${state_md }" data-md="0">전체</a>
              <c:forEach var="ctg" items="${category }" varStatus="status">
              	<a class="nav-link ${ctg.md eq chg_md ? 'active' : ''}" href="/chgAdminList?state_md=${state_md }&chg_lg=${ctg.lg }&chg_md=${ctg.md }" data-md="${ctg.md}">${ctg.ctn}</a>
              </c:forEach>
            </nav>

          </div>
          
          <!-- 진행중 종료일때만 필터 보임 -->
          <c:if test="${state_md == 102 || state_md == 103}">
          <div class="col-12 col-md-3 text-center">
             <select class="form-select form-select-xs" id="sortOpt" onchange="fn_sortOpt()"> 
                  <option value="create_date" 	<c:if test="${sortOpt eq 'create_date' }">	selected="selected"</c:if>>최신등록순</option>
                  <option value="pick_cnt" 		<c:if test="${sortOpt eq 'pick_cnt' }">		selected="selected"</c:if>>찜순</option>
                  <option value="participants" 	<c:if test="${sortOpt eq 'participants' }">	selected="selected"</c:if>>참여자순</option>
             </select>
          </div>
          </c:if>
          
        </div>
        
		<div class="col-12">
		<c:set var="num" value="${page.total-page.start+1 }"></c:set>
		
			<table class="table table-bordered table-sm mb-0   table-hover">
                    <thead class="table-dark">
				<tr class="p-2 text-center">
					<th>번호</th>
					<th>카테고리명</th>
					<th>챌린지명</th>
					<th>개설자 ID</th>
					<th>공개여부</th>
					<c:choose>
						<c:when test="${state_md == 100 || state_md == 104}">
							<th>신청일</th>
						</c:when>
						<c:otherwise>
							<th>시작일</th>
						</c:otherwise>
					</c:choose>
					<th>종료일</th>
					<c:if test="${state_md == 100 || state_md == 104 }">
						<th>신청 상태</th>
					</c:if>
					<th>상세보기</th>
<!-- 					<th>상세보기</th> -->
				</tr>
			  </thead>
			  <tbody>
				<c:forEach var="chgList" items="${chgList }" varStatus="status">
					<tr class="text-center" id="chgList${status.index }">
						<td>${num }</td>
						<td>${chgList.ctn }</td>
						<td>${chgList.title }</td>
						<td>${chgList.userId }</td>
						<td>
							<c:if test="${chgList.chg_public == 0 }">공개</c:if> 
							<c:if test="${chgList.chg_public == 1 }">비공개</c:if>
						</td>
						<c:choose>
						<c:when test="${state_md == 100 || state_md == 104}">
							<td><fmt:formatDate value="${chgList.reg_date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						</c:when>
						<c:otherwise>
							<td><fmt:formatDate value="${chgList.create_date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						</c:otherwise>
						</c:choose>
						<td><fmt:formatDate value="${chgList.end_date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						
						<c:if test="${state_md == 100 || state_md == 104}">
							<td>${chgList.stateCtn }</td>
						</c:if>
												
						<td class="justify-content-center">
						<button type="button" class="btn btn-secondary btn-xxs" onclick="chgAdminDetail(${chgList.chg_id})">상세보기1</button>
							<button type="button" class="btn btn-secondary btn-xxs" onclick="location.href='/chgAdminDetail?chg_id=${chgList.chg_id}&state_md=${state_md }&currentPage=${page.currentPage}&chgUpdateMode=0&chg_lg=${chg_lg}'">상세보기</button>
						</td> 
					</tr>
					<c:set var="num" value="${num -1 }"></c:set>
				</c:forEach>
			 </tbody>
			</table>
			
			<!-- 이전 페이지 / 다음 페이지도 페이징 작업 필요 -->
				<!-- 페이지네이션  -->
					 <nav class="d-flex justify-content-center justify-content-md-center mt-3">
	      	   		 <ul class="pagination pagination-lg text-gray-400">
					  	<c:if test="${page.startPage > page.pageBlock }">
					  		<li class="page-item">
								<a class="page-link page-link-arrow" onclick="pageMoveNav(${page.startPage-page.pageBlock })">
								<i class="fa fa-caret-left">이전</i></a>
							</li>
						</c:if>
					    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" varStatus="status">
							<li class="page-item">
							<!-- 현재 페이지랑 같은 경우 번호 ,색칠함  -->
								<c:if test="${i == page.currentPage }">
									<a class="page-link px-2" onclick="pageMove(${status.index })"><b class="text-primary" id="pageMove${status.index }">${i}</b></a>
								</c:if>
								<!-- 현재 페이지랑 다른 번호들 -->
								<c:if test="${i != page.currentPage }">
									<a class="page-link px-2" onclick="pageMove(${status.index })" id="pageMove${status.index }" >${i}</a>
								</c:if>
							</li>
						</c:forEach>
					    <c:if test="${page.endPage < page.totalPage }">
					    	<li class="page-item">
								<a class="page-link page-link-arrow" onclick="pageMoveNav(${page.startPage + page.pageBlock })">
								<i class="fa fa-caret-right">다음</i></a>
							</li>
						</c:if>
					 </ul>
			  		</nav>
			  </div>
		  	</div>
		  	</div>
		  	</div>
		  	<div class="py-10"></div>	
		 </section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>