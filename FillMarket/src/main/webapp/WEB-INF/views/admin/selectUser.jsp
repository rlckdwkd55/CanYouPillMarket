<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

				
					<div class="container">
						<div class="row">
						<h3>${userMember.userId }님의 정보</h3>
									<table class="table">
										<tr>
											<td class="col-2">아이디</td>
											<td>${userMember.userId } <select class="form-select" name="levelType" id="selectValb">
													<option value="1" <c:if test="${userMember.levelType == 1 }">selected</c:if>>사용자</option>
													<option value="2" <c:if test="${userMember.levelType == 2 }">selected</c:if>>관리자</option>
												</select></td>
											
										</tr>

										<tr>
											<td>이름</td>
											<td>${userMember.userName }</td>
										</tr>

										<tr>
											<td>이메일</td>
											<td>${userMember.email }</td>
										</tr>

										<tr>
											<td>전화</td>
											<td>${userMember.phone }</td>
										</tr>

										<tr>
											<td>주소</td>
											<td>${userMember.address }</td>
										</tr>

										<tr>
											<td>생년월일</td>
											<td>${userMember.birth }</td>
										</tr>

										<tr>
											<td>상태</td>
											<td>${userMember.status }</td>
										</tr>

										<tr id="menu">
											<td></td>
											<td>
											<button onclick="adminAuthorB('${userMember.userId}');"
											class="btn btn-primary">권한수정</button>  
											
											<button class="btn btn-success" onclick="orderList('${userMember.userId}');">주문내역</button>
											
											<c:set var="status"
													value="${userMember.status}" /> <c:choose>
													<c:when test="${status eq 'Y'}">

														<button onclick="userDelete('${userMember.userId}');"
															class="btn btn-danger">회원삭제</button>

													</c:when>
													<c:when test="${status eq 'N'}">

														<button onclick="userRes('${userMember.userId}');"
															class="btn btn-danger">회원복구</button>

													</c:when>
												</c:choose>
												
											</td>
											
										</tr>


									</table>
								
							
						</div>
						<!-- row -->
					</div>
					
					<script>
					function adminAuthorB(userId){
						var selectAuthor = $('#selectValb').val();
						var myAuthor = ${userMember.levelType}
						
						if(selectAuthor == myAuthor){
							alert("회원님의 권한은 이미 같은 권한입니다.");
						}else{
							var result = confirm("정말 회원님의 권한을 바꾸시겠습니까?");
							
							if(result == false){
								alert("취소되었습니다.")
							}else{
								$.ajax({
									url : "${pageContext.request.contextPath}/admin/userAuthorUpdate.do",
									data : {userId : userId, selectAuthor : selectAuthor},
									dataType : "json",
									success : function(data){
										if(data == true){
											alert("권한이 수정되었습니다.")
											location.href="${pageContext.request.contextPath}/admin/adminInfo.do";
										}else if(data == false){
											alert("수정이 안되었어요ㅠㅠ")
										}
									}
								})
								
							}
							
						}
						
						
					
					}
					</script>
				
