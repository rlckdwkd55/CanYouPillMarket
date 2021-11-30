<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/adminSide.jsp" />
<style>

#comment {
	width: 1000px;
	height: auto;
	margin-left: 400px;
}

#ajaxcomment {
	width: 1000px;
	height: auto;
	margin-left: 400px;
}

.container {
	width: 900px;
	margin-left: 450px;
}
.table-responsive{
	
}


</style>

</head>
<body>


	<div class="col-md-10" style="margin-left:250px;">
		<div>
		<br /><br />
			<h2 class="text-left">게시글 보기</h2>
			<p>&nbsp;</p>
			<div class="table table-responsive">
				<table style="width:1500px;">
					<tr>
						<th class="success">글번호</th>
						<td>${qna.qano}</td>
						<th class="success"></th>
						<td></td>
					</tr>


					<tr>
						<th class="success">작성자</th>
						<td>${qna.qauserid }</td>
						<th class="success">작성일</th>
						<td>${qna.qauploaddate }</td>
					</tr>


					<tr>
						<th class="success">제목</th>
						<td colspan="3">${qna.qatitle }</td>
					</tr>

					<tr>
						<th class="success">글 내용</th>
						<td colspan="3"><textarea name="pinfo" id="" cols="100"
								rows="10" style="resize: none;" readonly>${qna.qacontent }</textarea></td>
					</tr>

					<tr>
						<td colspan="4" class="text-center"><input type="button"
							<input type="button" class="btn btn-danger" value="삭제하기"
							onclick="location.href='${pageContext.request.contextPath}/admin/adminQNADelete.do?qano=${qna.qano}'">
							<input type="button" class="btn btn-primary" value="목록보기"
							onclick="location.href='${pageContext.request.contextPath}/admin/adminQNAList.do'">
						</td>
					</tr>



				</table>
			</div>


		</div>



	</div>


	<div class="col-md-10" style="margin-left:250px;">
		<div class="commentList"></div>
	</div>


	<div class="col-md-10" style="margin-left:250px;">
		<c:if test="${not empty reply}">
			<c:forEach items="${reply}" var="r">
				<table class="table table-hover col-md-10" style="margin-bottom: 0px;">
					<tr>
						<td style="width :100px">작성일자 :</td>
						<td>${r.rdate }</td>
					</tr>
					<tr>
						<td>댓글내용 :</td>
						<td>${r.rcontent}</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
	<div id="recomment"></div>
	<br /><br />
	<div class="container">
		<label for="content">답변</label>
		<form  name="commentInsertForm">
			<div class="input-group">
				<input type="hidden" name="qano" value="${qna.qano}" /> 
				<input type="hidden" name="userId" value="${member.userId}" /> 
				<input type="text" class="form-control" id="content" name="content"
					placeholder="내용을 입력하세요."> <span class="input-group-btn">
					<button class="btn btn-default" type="button"
						name="commentInsertBtn" onclick="replyReg(content.value);">등록</button>
				</span>
			</div>
		</form>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />

	<script>
	
 		function replyReg(comment){
		
			var form = {
				"comment" : comment,
				"qano" : ${qna.qano},
				"userId" : '${member.userId}'
			};
			
			
 				$.ajax({
 					url : '${pageContext.request.contextPath}/admin/adminReplyReg.do',
 					dataType : "html",
 					data : form,
 					type: "get",
 					success : function(data){
 						
 						$('#recomment').append(data);
 						$('#content').val('');
 						
 					}
 				})
 		}
 	</script>

</body>
</html>