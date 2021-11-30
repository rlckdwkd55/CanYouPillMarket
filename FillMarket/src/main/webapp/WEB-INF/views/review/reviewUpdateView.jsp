<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- css -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- 타이틀 로고 -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
	<style>
	
	div#review-container{  margin:0 auto; text-align:center;}
	
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
	div#review-container input {margin-bottom:15px;}
	
	#header{ color : rgba(0, 0, 0, 0.35) ;
			 text-align: center; }
	#reviewUpdate_header {
	text-align: center;
	color: rgb(255, 142, 117);
	}

	.btn-outline {
    background-color : rgb(255, 142, 117); color: white;

	}
		
	</style>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<div id="container">
	  			<br />
                <h1 id="reviewUpdate_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW UPDATE PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
			<div class="row product" width="90%">
			<div id="review-container" width="60%">
			<form name="reviewFrm" action="${pageContext.request.contextPath}/review/reviewUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" name="reno" value="${ review.reno }" />
				<input type="text" class="form-control" placeholder="리뷰 제목을 입력해주세요" name="retitle" id="retitle" value="${review.retitle}" required>
				<input type="text" class="form-control" name="reuserid" value="${review.reuserid}" readonly required>
				<input type="hidden" class="form-control" name="reuserid" value="${review.pno}" readonly required>
				<input type="text" class="form-control" name="reuserid" value="${review.pname}" readonly required>
				<!-- 
				<input type="hidden" name="pno" value="${ review.pno }" />
				<input type="text" class="form-control" name="productname" value="${product.pname}" readonly required>				
				 -->
				<c:forEach items="${rattachmentList}" var="ra" varStatus="vs">
					<div class="rows">					
					<button type="button" class="btn btn-outline col-4"
							onclick="fileDownload('${ra.originalname}','${ra.changename }');" >
						첨부파일${vs.count} - ${ra.originalname }
					</button>
					<button type="button" class="btn btn-outline col-1"
							onclick="fileDelete(this, '${ra.rano}', '${ra.changename }');">파일 삭제</button>
					</div>
					<input type="hidden" name="rano" value="${ra.rano}" />
				</c:forEach>
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
			    <textarea class="form-control" name="recontent" placeholder="내용" required>${review.recontent}</textarea>
				<br />
				<div class="rows" style="padding:0px;">
				<input type="submit" class="btn btn-outline col-1" " value="수정 완료" /> &nbsp;
				<input type="button" class="btn btn-outline col-1" value="삭제" onclick="location.href='${pageContext.request.contextPath}/review/reviewDelete.do?reno=${review.reno}'"/>
				<br />
				<br />
				</div>
			</form>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>

	
<script>
/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function validate(){
	var content = $("[name=retitle]","[name=recontent]").val();
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
	
	function fileDownload(oName, rName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/review/fileDownload.do?oName="+oName+"&rName="+rName;
	}

	function fileDelete(obj, reno, rName){
		$.ajax({
			url : '${pageContext.request.contextPath}/review/fileDelete.do',
			data : { reno : reno, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
	}
	</script>
	<!-- JQuery CDN-->
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous></script>	
</body>
</html>