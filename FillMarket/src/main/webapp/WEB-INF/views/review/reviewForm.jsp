<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
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
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
	<style>
	.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    justify-content: center;
	}
	.table{
		text-align: center;
		border-bottom : 1px solid rgba(0, 0, 0, 0.35);
	}

.form-control {
    display: block;
    width: 70%;
 	margin:0 auto;
    }
.input-group {
    position: relative;
    display: flex;
    width: 100%;
    justify-content: space-around;
    flex-direction: row;
    align-items: center;
    flex-wrap: nowrap;
    align-content: flex-start;
}
	
	#header{ color : rgba(0, 0, 0, 0.35) ; text-align: center; }
	#reviewForm_header {
	text-align: center;
	color: rgb(255, 142, 117);
}
.btn{ background-color : rgb(255, 142, 117); color: white;  display: block;
    margin: auto;}
	
	</style>
<c:import url="../common/header.jsp" />
<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=reviewtitle]","[name=reviewcontent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=upFile]').on('change',function(){
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
		    console.log($(this).val());
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
</script>
</head>
<body>
	<c:import url="../common/navbar.jsp" />
	<div class="container">
	<br />
                <h1 id="reviewForm_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW FORM PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
			<div class="row product" wieth="90%">
			<div id="review-container" wieth="60%">
			<form name="reviewFrm" action="${pageContext.request.contextPath}/review/reviewFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<!-- <input type="hidden" name="reno" value="${ review.reuserid }" />  -->
				<input type="text" class="form-control" placeholder="리뷰 제목을 입력해주세요" name="retitle" id="retitle" value="${review.retitle}" required>
				<input type="text" class="form-control" name="reuserid" value="${member.userId}" readonly required>
				<input type="hidden" name="pno" value="${ pno }" required /> 
				<input type="text" class="form-control" name="productno" value="${ pname }" readonly required>
				
				
			
				<br>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" for="upFile"></label>
				  </div>
				</div>
			    <textarea class="form-control" name="recontent" placeholder="내용" required></textarea>
				<br />
				<input type="submit" class="btn" " value="등록" /> &nbsp;
				<br />
				<br />
			</form>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>