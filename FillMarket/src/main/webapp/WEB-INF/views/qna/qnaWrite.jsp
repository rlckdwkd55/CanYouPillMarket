<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/qstyle.css">
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
	href="${pageContext.request.contextPath}/resources/css/style.css">
<c:import url="../common/header.jsp" />
<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=title]","[name=cont]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}</script>
</head>
<body>
	<c:import url="../common/navbar.jsp" />
	<div class="container">
		<form name="boardFrm"
			action="${pageContext.request.contextPath}/qna/qnaWriteEnd.do"
			method="post" onsubmit="return validate();">
			<div class="board_title">
				<div class="board_title_a">문의글 작성</div>
			</div>
			<div class="input-group" id="title_write">
				<span class="input-group-text" id="inputGroup-sizing-default"
					requeird>제목</span> <select name="qasel" class="form-select"
					aria-label="Default select example">
					<option value="기본값" disabled selected hidden>문의 유형 선택</option>
					<option value="주문/결제" name="qasel">주문/결제</option>
					<option value="배송 문의" name="qasel">배송 문의</option>
					<option value="교환/반품" name="qasel">교환/반품</option>
					<option value="기타 문의" name="qasel">기타 문의</option>
				</select> <input type="text" placeholder="제목 입력" name="qatitle"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" requeird>
				<input type="text" class="form-control" name="qauserid" value="${member.userId}" readonly required>
			</div>
			<div class="textarea">
				<textarea placeholder="문의 내용 입력" name="qacontent" rows="15" cols="155"></textarea>
			</div>
			<div class="button">
				<input class="btn btn-primary" type="submit" value="등록">
				<input class="btn btn-primary" type="button" value="취소"
					onclick="location.href='${pageContext.request.contextPath}/qna/qnaList.do'">
		</form>
	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>