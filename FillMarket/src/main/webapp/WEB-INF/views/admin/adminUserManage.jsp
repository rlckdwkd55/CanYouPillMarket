<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자관리</title>
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
		
		
		.mid{
			width : 150px;
			text-align: center;
		}
		
		#container{
			width : 100%;
		}
		#tbl-board{
			width : 1500px;
		}
		
		
	</style>
	<script>
		

		function fn_goProductForm(){
			location.href = "${pageContext.request.contextPath}/admin/productFrom.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var userId = $(this).attr("id");
				console.log("userId="+userId);
				location.href = "${pageContext.request.contextPath}/admin/adminUserView.do?userid="+userId;
			});
			
			$('#userName').on("keyup",function(){
				var userName = $(this).val().trim();
				console.log("userName="+userName);
				
				if(userName.length == 0){
					$('#AllList').show()
					$('#userNameList').hide()
				}else{
					$.ajax({
						 url  : "${pageContext.request.contextPath}/admin/checkNameList.do",
				         data : {userName : userName},
				         dataType: "html",
				         success : function(data){
				        	 
				        	 $('#AllList').hide()
				        	 $('#userNameList').show()
				        	 $('#userNameList').html(data)
				        	 
				         }
					})
				}
				
				
			});
			
		});
	</script>
</head>
<body>
<div class="col-md-10" id="container" style="margin-left:250px;">
			<section id="board-container" class="container col-md-11" >
			<br />
				<h1>사용자 관리</h1>
				<br /><br /><br />
				<input type="text" id="userName" name="userName" placeholder="이름" />
				<div id="userNameList"></div>
				<div id="AllList">
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th class="mid">아이디</th>
						<th class="mini">이름</th>		
						<th class="long">주소</th>
						<th class="mid">연락처</th>
						<th class="mid">생년월일</th>
						<th class="mini">성별</th>
						<th class="mini">회원상태</th>
						
					</tr>
					
					<c:forEach items="${list}" var="m"> 
					
					<tr id="${m.userId }">
						<td class="mid">${m.userId }</td>
						<td class="mini">${m.userName }</td>
						<td class="long">${m.address }</td>
						<td class="mid">${m.phone }</td>
						<td class="mid">${m.birth }</td>
						<td class="mini">${m.gender }</td>
						<td class="mini">${m.status }</td>
					</tr>
					</c:forEach>
					
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
				</div>
			</section>
	</div>
	
</body>
</html>