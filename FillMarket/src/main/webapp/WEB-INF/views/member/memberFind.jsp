<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>find</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/memberFind.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>


<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />

	<div>
		<form
			action="${pageContext.request.contextPath}/member/memberFindId.do"
			method="post">
			<div id="content" class="searchI">

				<div class="row mb-2" style="justify-content: center;">
					<h1 id="myPage_header" class="h3 mb-3 fw-normal mt-5 pt-5">
						<strong>아이디 찾기</strong>
					</h1>

					<div style="text-align: center;" class="mb-5">
						<span>회원가입 시 작성한 이름과 E-MAIL을 입력해주세요.</span>
					</div>
				</div>

				<span class="box int_id rounded mb-3"> <input type="text"
					id="id" class="int" maxlength="20" placeholder="이름"
					required="required" name="userName">
				</span> <span class="box int_id rounded"> <input type="text" id="id"
					class="int" maxlength="20" placeholder="E-MAIL" required="required" name="email">
				</span>

				<div class="btn_area mt-4" onclick="search_check(1)"
					checked="checked">
					<button type="submit" id="btnJoin">
						<span>아이디 찾기</span>
					</button>
				</div>
				<div class="btn_area mb-5 pb-5">

					<button type="button" id="btnJoin2" onclick="search_check(2)">
						<span>비밀번호 찾기</span>
					</button>
				</div>
			</div>

		</form>

		<form
			action="${pageContext.request.contextPath}/member/memberFindPw.do"
			method="post">
			<div id="content" class="searchP">

				<div class="row mb-2" style="justify-content: center;">
					<h1 id="myPage_header" class="h3 mb-3 fw-normal mt-5 pt-5">
						<strong>비밀번호 찾기</strong>
					</h1>

					<div style="text-align: center;" class="mb-5">
						<span>회원 아이디와 회원가입 시 작성한 이름, E-MAIL을 입력해주세요.</span>
					</div>
				</div>

				<span class="box int_id rounded mb-3"> <input type="text"
					id="id" class="int" maxlength="20" placeholder="아이디" name="userId">
				</span> <span class="box int_id rounded mb-3"> <input type="text"
					id="id" class="int" maxlength="20" placeholder="이름" name="userName">
				</span> <span class="box int_id rounded"> <input type="text" id="id"
					class="int" maxlength="20" placeholder="E-MAIL" name="email">
				</span>

				<div class="btn_area mt-4">
					<button type="submit" id="btnJoin">
						<span>비밀번호 찾기</span>
					</button>
				</div>
				<div class="btn_area mb-5 pb-5">
					<button type="button" id="btnJoin2" onclick="search_check(1);">
						<span>아이디 찾기</span>
					</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		function search_check(num) {
			if (num == 1) {
				$('.searchP').hide();
				$('.searchI').show();
				// document.getElementsByClassName(searchP).style.display = "none";
				// document.getElementsByClassName(searchI).style.display = "";	
			} else {
				$('.searchP').show();
				$('.searchI').hide();
				// document.getElementsByClassName(searchI).style.display = "none";
				// document.getElementsByClassName(searchP).style.display = "";
			}
		}
	</script>

	<c:import url="../common/footer.jsp" />
</body>

</html>