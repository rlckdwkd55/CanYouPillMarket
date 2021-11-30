<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Q&A 수정</title>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/style.css">
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qstyle.css">
</head>
<body>
   <c:import url="../common/navbar.jsp" />
	<div class="container">
		<form name="boardFrm"
			action="${pageContext.request.contextPath}/qna/qnaUpdate.do"
			method="post" onsubmit="return validate();">
			<div class="board_title">
				<div class="board_title_a">문의글 작성</div>
			</div>
			<div class="input-group" id="title_write">
			<input type="hidden" name="qano" value="${board.qano }" />
				<span class="input-group-text" id="inputGroup-sizing-default"
					requeird>제목</span> <select name="qasel" class="form-select"
					aria-label="Default select example">
					<option value="default" disabled selected hidden>${board.qasel}</option>
					<option value="주문/결제">주문/결제</option>
					<option value="배송 문의">배송 문의</option>
					<option value="교환/반품">교환/반품</option>
					<option value="기타 문의">기타 문의</option>
				</select> <input type="text" placeholder="제목 입력" name="qatitle"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default"  value="${board.qatitle}" requeird>
				<input type="text" class="form-control" name="qauserid" value="${member.userId}" readonly required>
			</div>
			<div class="textarea">
				<textarea placeholder="문의 내용 입력" name="qacontent" rows="15" cols="155">${board.qacontent}</textarea>
			</div>
			<div class="button">
				<input class="btn btn-primary" type="submit" value="수정 완료">
				<input class="btn btn-primary" type="button" value="취소"
					onclick="location.href='${pageContext.request.contextPath}/qna/qnaList.do'">
		</form>
	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>