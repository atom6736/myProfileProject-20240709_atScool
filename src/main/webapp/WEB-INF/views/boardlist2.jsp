<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/title.css">
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" href="/resources/css/board.css">
<title>My Profile</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>

	<center>
	<table border="0" cellpadding="20" cellspacing="0">
		<tr>
			<td align="center">
				<span class="title_text01">DEVELOPER CHIHWAN's PROFILE</span>
			</td>
		</tr>
		<tr>
			<td align="center">
				<span class="title_text02">I'm Chihwan Kim, a developer who wants a development job. Please call me back.</span>
			</td>
		</tr>
		<tr>
			<td class="content_box" align="center">						
				<table border="0" cellpadding="10" cellspacing="0" width="90%">
					<tr>
						<td colspan="5" align="right">
							<form action="list2">
								<input class"input_box01" type="text" name='searchKey'>
								<input class="search_btn"  type="submit" value="검색">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan='5'>
						  	총 ${pageDto.total }건 &nbsp; ${currPage}/${realEndPage}} page
						</td>
					
					</tr>
					<tr>
						<th class="board_title" width="6%">번호</th>
						<th class="board_title" width="10%">아이디</th>
						<th class="board_title" width="10">이름</th>
						<th class="board_title" width="60%">제목</th>
						<th class="board_title" width="14%">등록일</th>
					</tr>
					<c:forEach items="${bDtos }" var="bDto">
					<tr>
						<td class="board_content" align="center">${bDto.bnum }</td>
						<td class="board_content" align="center">${bDto.bid }</td>
						<td class="board_content" align="center">${bDto.bname }</td>
						<td class="board_content">	
							<a class="contentlink" href="contentView?bnum=${bDto.bnum }">
							<c:choose>
								<c:when test="${fn:length(bDto.btitle) > 45}">
									<c:out value="${fn:substring(bDto.btitle, 0, 44)}"></c:out>...
								</c:when>
								<c:otherwise>
									${bDto.btitle }
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td class="board_content" align="center">
							<c:out value="${fn:substring(bDto.bdate, 0, 10)}"></c:out>						
						</td>
					</tr>
					</c:forEach>
					
					<tr>
						<td colspan="5" align="right">
							<input class="btn01" type="button" value="글쓰기" onclick="javascript:window.location.href='write'">
						</td>
					</tr>
					<!--  페이징 페이지 표시 출력 -->
					<tr>
						<td colspan="5" align="center">
							<c:if test="${pageDto.prev }">							
								<a  class="pagelink" href="list2?pageNum=1&searchKey=${searchKey }">◀◀</a>&nbsp;
								<a  class="pagelink" href="list2?pageNum=${pageDto.startPage-10 }&searchKey=${searchKey}">◀</a>
							</c:if>
							&nbsp;&nbsp;							
							<c:forEach begin="${pageDto.startPage }" end ="${pageDto.endPage }" var="pageNumber">
								<c:choose>
									<c:when test="${currPage == pageNumber}">
										<span class="currpage">${pageNum}</span>&nbsp;
									</c:when>
									<c:otherwise>
										<a class="pageLink" href="list?pageNum=${pageNumber }">${pageNumber }</a>
										
									</c:otherwise>								
								</c:choose>														
								
							</c:forEach>							
							&nbsp;&nbsp;
							<c:if test="${pageDto.next }">							
								<a class="pagelink" href="list2?pageNum=${pageDto.startPage+10 }&searchKey=${searchKey}">▶</a>&bsp;
								<a class="pagelink" href="list2?pageNum=${realEndPage }&searchKey=${searchKey}">▶▶</a>
							</c:if>
						</td>
					</tr>
				</table>				
			</td>
		</tr>
	</table>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>