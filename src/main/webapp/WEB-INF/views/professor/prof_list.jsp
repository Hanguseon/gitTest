<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<!doctype html>
<html lang='ko'>
<head>
	<meta charset='utf-8' />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>Spring Example</title>
	<!-- Bootstrap + jQuery -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!--// Bootstrap + jQuery -->
</head>
<body>
<div class="container">
		<div class="page-header clearfix">
			<h1 class="pull-left">
				<a href="${pageContext.request.contextPath}/professor/prof_list.do">교수목록</a>
			</h1>

			<div style="margin-top: 30px" class="pull-right">
				<form method="get" action="${pageContext.request.contextPath}/professor/prof_list.do" 
				style="width: 300px;">
					<div class="input-group">
						<input type="text" name="keyword" class="form-control"
							placeholder="교수이름 검색" value="${keyword}" /> <span
							class="input-group-btn">
							<button class="btn btn-success" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button> <a href="${pageContext.request.contextPath}/professor/prof_add.do" 
							class="btn btn-primary">교수추가</a>
						</span>
					</div>
				</form>
			</div>
		</div>

		<!-- 조회결과를 출력하기 위한 표 시작 -->
		<table class="table">
			<thead>
				<tr>
					<th class="info text-center">교수번호</th>
					<th class="info text-center">이름</th>
					<th class="info text-center">아이디</th>
					<th class="info text-center">직급</th>
					<th class="info text-center">급여</th>
					<th class="info text-center">보직수당</th>
					<th class="info text-center">입사일</th>
					<th class="info text-center">소속학과</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
            <c:when test="${list.size() > 0 }">
               
               <c:forEach var="i" items="${list }">            
               <tr>
                  <td class="text-center">${i.profno}</td>
                  <td>
                  	<c:url var="readUrl" value="/professor/prof_view.do">
                  		<c:param name="profno" value="${i.profno}" />
                  	</c:url>
                  	<a href="${readUrl}">${i.name}</a>
                  </td>
                  <td class="text-center">${i.userid}</td>
                  <td class="text-center">${i.position}</td>
                  <td class="text-center">${i.sal}</td>
                  <td class="text-center">${i.comm}</td>
                  <td class="text-center">${i.hiredate}</td>
                  <td class="text-center">${i.dname}</td>
                 
               </tr>
               </c:forEach>
            </c:when>
            
            <c:otherwise>
               <tr>
                  <td colspan="8" class="text-center" style="line-height: 100px;">조회된 데이터가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
			</tbody>
		</table>
		<!-- //조회결과를 출력하기 위한 표 끝 -->

		<!-- 페이지 번호 -->
		
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전그룹 -->
				<c:choose>
					<c:when test="${page.prevPage > 0}">
					<!-- 이전 그룹에 대한 페이지 번호가 전재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
					<c:url var = "prevUrl" value="/professor/prof_list.do">
						<c:param name="keyword" value="${keyword}"></c:param>
						<c:param name="page" value="${page.prevPage}"></c:param>
					</c:url>
					
					<li><a href="${prevUrl}">&laquo;</a></li>
					</c:when>
					
					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class="disabled"><a href="#">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				
				<!-- 페이지 번호  -->
				<!-- 현재 그룹의 시작페이지~ 끝페이지 사이를 1씩 증가하면서 반복 -->
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
				<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여  page_url에 저장 -->
				<c:url var = "prevUrl" value="/professor/prof_list.do">
						<c:param name="keyword" value="${keyword}"></c:param>
						<c:param name="page" value="${i}"></c:param>
					</c:url>
					<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
					<c:choose>
						<c:when test="${page.page == i}">
							<li class="active"><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음그룹으로 이동 -->
				<c:choose>
				<c:when test="${page.nextPage > 0}">
					<!-- 다음 그룹에 대한 페이지 번호가 전재한다면? -->
					<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
					<c:url var = "prevUrl" value="/professor/prof_list.do">
						<c:param name="keyword" value="${keyword}"></c:param>
						<c:param name="page" value="${page.nextPage}"></c:param>
					</c:url>
					
					<li><a href="${prevUrl}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
						<!-- 다음 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class="disabled"><a href="#">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</nav>
	</div>
</body>
</html>






















