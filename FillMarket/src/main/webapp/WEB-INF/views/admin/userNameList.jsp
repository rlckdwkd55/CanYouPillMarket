<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<table class="table table-hover table-sm">
	<thead>
		<tr>
			<th scope="col" style="text-align: center;">아이디</th>
			<th scope="col" style="text-align: center;">역할</th>
			<th scope="col" style="text-align: center;">주소</th>
			<th scope="col" style="text-align: center;">연락처</th>
			<th scope="col" style="text-align: center;">생년월일</th>
			<th scope="col" style="text-align: center;">이름</th>
			<th scope="col" style="text-align: center;">상태</th>


		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listud}" var="lu">
			<tr id="${lu.userId}">
				<td style="text-align: center;">${lu.userId}</td>
				<td style="text-align: center;"><c:choose>
						<c:when test="${lu.levelType == 1 }">사용자</c:when>
						<c:when test="${lu.levelType == 2 }">관리자</c:when>
					</c:choose></td>

				<td style="text-align: center;">${lu.address}</td>
				<td style="text-align: center;">${lu.phone }</td>
				<td style="text-align: center;">${lu.birth}</td>
				<td style="text-align: center;">${lu.userName }</td>
				<td style="text-align: center;">${lu.status }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:out value="${pageBar}" escapeXml="false" />

<script>
$("tr[id]").on("click",function(){
	var userId = $(this).attr("id");
	console.log("userId="+userId);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/userClick.do",
		data : {userId : userId},
		dataType: "html",
        success : function(data){
        	
        	$('#members').show().css("display", 'inline-block');
        	$('#firstCont').hide();
        	$('#members').html(data);
        	
        }
		
	})
	
});
</script>
