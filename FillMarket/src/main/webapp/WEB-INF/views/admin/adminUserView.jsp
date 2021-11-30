<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 상세페이지</title>

<c:import url="../common/adminSide.jsp" />

<style>
.container {
	margin-left: 500px;
}
#menu{
	text-align: center;
}
.table{
text-align: center;
}
</style>


</head>
<body>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">회원 정보 보기</h2>
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td>${member.userId }</td>
						</tr>

						<tr>
							<td>이름</td>
							<td>${member.userName }</td>
						</tr>

						<tr>
							<td>이메일</td>
							<td>${member.email }</td>
						</tr>

						<tr>
							<td>전화</td>
							<td>${member.phone }</td>
						</tr>

						<tr>
							<td>주소</td>
							<td>${member.address }</td>
						</tr>

						<tr>
							<td>생년월일</td>
							<td>${member.birth }</td>
						</tr>

						<tr>
							<td>상태</td>
							<td>${member.status }</td>
						</tr>

						<tr id="menu">
							<!--  <td class="text-center" colspan="2">
								<button onclick="location.href='MemberUpdateForm.jsp?id='"
									class="btn btn-primary">회원수정</button>  -->
								<td colspan="2">	
								<c:set var="status" value="${member.status}"/>
								<c:choose>
									<c:when test="${status eq 'Y'}">
									
										<button onclick="userDelete('${member.userId}');"
										class="btn btn-danger">회원삭제</button>
										
									</c:when>
									<c:when test="${status eq 'N'}">
									
										<button onclick="userRes('${member.userId}');"
										class="btn btn-danger">회원복구</button>
				
									</c:when>
								</c:choose>
								<button onclick="membeList();"
									class="btn btn-warning">목록보기</button>
								</td>
								<!--  <button onclick="location.href='MemberJoin.jsp'"
									class="btn btn-success">회원가입</button>
							</td>  -->
						</tr>


					</table>
				</div>
			</div>
			<!-- col-sm-12 -->
		</div>
		<!-- row -->
	</div>
	<!-- container end-->

<script>
	function userDelete(userId){
		var check = confirm("회원 " +userId+ " 님의 아이디를 삭제하시겠습니까");
		
		if(check == true){
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/userDelete.do',
				data : { userId : userId }, 
				dataType : 'json',
				success : function(data){
					if(data == true) {
						alert("회원 삭제 완료!");
						location.href="${pageContext.request.contextPath}/admin/adminUserManageList.do";
					} else {
						alert("회원 삭제 실패!");
					}
				}
			})
		}else{
			alert("취소되었습니다.")
		}
	}
	function userRes(userId){
		var check = confirm("회원 " +userId+ " 님의 아이디를 복구하시겠습니까");
		
		if(check == true){
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/userRes.do',
				data : {userId : userId}, 
				dataType : 'json',
				success : function(data){
					if(data == true) {
						alert("회원 복구 완료!");
						//location.href="${pageContext.request.contextPath}/admin/adminUserView.do?userid="+userId;
					} else {
						alert("회원 복구 실패!");
					}
				}
			})
		}else{
			alert("취소되었습니다.")
		}
	}
	
	
	
	function membeList(){
		location.href="${pageContext.request.contextPath}/admin/adminUserManageList.do";
	}
</script>
</body>
</html>