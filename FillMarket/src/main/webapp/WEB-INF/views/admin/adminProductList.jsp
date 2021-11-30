<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<c:import url="../common/adminSide.jsp" />
<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		
		.mini{
			width : 100px;
			text-align: center;
		}
		.long{
			text-align: center;
		}
		
		#imagefile{
			width: 40px;
			height: 50px;
			object-fit: scale-down;
		}
		
		
	</style>
	<script>
		function fn_goProductForm(){
			location.href = "${pageContext.request.contextPath}/admin/productFrom.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var pno = $(this).attr("id");
				console.log("pno="+pno);
				location.href = "${pageContext.request.contextPath}/admin/adminView.do?pno="+pno;
			});
		});
	</script>
</head>
<body>
<div id="container" class="col-md-10" style="margin-left:250px;">
			<section id="board-container" class="container col-md-11" >

			<br />
				<h1>상품관리</h1>
				<p>총 ${totalContents }건의 게시물이 있습니다.</p>
				<input type="button" value="상품등록" id="btn-add" class="btn btn-outline-success" onclick="fn_goProductForm();"/>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th class="mini">상품번호</th>
						<th class="mini">분류</th>
						<th class="mini">이미지</th>
						<th class="long">상품명</th>
						<th class="mini">재고</th>
						<th class="mini">판매가</th>
						
					</tr>
					<c:forEach items="${list}" var="p"> 
					<tr id="${p.pno}">
						<td class="mini">${p.pno}</td>
						<td class="mini">
								<c:choose>
                        			<c:when test="${p.cno == 1 }">뼈/관절</c:when>
                        			<c:when test="${p.cno == 2 }">면역력</c:when>
                        			<c:when test="${p.cno == 3 }">소화/장</c:when>
                        			<c:when test="${p.cno == 4 }">눈</c:when>
                        			<c:when test="${p.cno == 5 }">모발</c:when>
                        	   </c:choose></td>
						<td class="mini">
							<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/productUpload/${p.changename}" id="imagefile">
						</td>
						<td>${p.pname}</td>
						<td class="mini">${p.pstock}</td>
						<td class="mini"><fmt:formatNumber pattern="###,###,###" value="${p.pprice }"/></td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section>
	</div>
	
</body>
</html>