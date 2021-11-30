<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤 추천</title>
<link rel="stylesheet" href="../resources/css/qstyle.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=title]","[name=cont]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>

<c:import url="../common/header.jsp" />
</head>

<body>
 <br>
 	<c:import url="../common/navbar.jsp" />
 	<br>
 <div class="container">
        <div class="back">
            <div class="back_t">
                <p><h1>맞춤 진단 시작</h1></p>
            </div>
            <form name="surveyInsert" action="${pageContext.request.contextPath}/survey/surveyInsert.do"
				method="post" onsubmit="return validate();">
            <div class="qa_wrap">
                <div class="q">
                    <div class="q_q">Q1.</div>
                    <div class="q_qq"><input type="hidden" class="form-control" name="surveyuserid" value="${member.userId}" readonly required>님의 나이를 알려주세요.</div>
                </div>
                <div class="qa">
                    <div class="q_a"><input type="text" placeholder="태어난 연도 4자리" maxlength="4"
                        onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="yyyy" name="yyyy" /> 년생
                    </div>
                </div>
            </div>
            <div class="qa_wrap">
                <div class="q">
                    <div class="q_q">Q2.</div>
                    <div class="q_qq">성별을 알려주세요.</div>
                </div>
                <div class="qa">
                    <div class="q_a"><input type="radio" id="gender" name="gender" value="M">남자 &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="gender" name="gender" value="F">여자
                    </div>
                </div>
            </div>

            <div class="qa_wrap">
                <div class="q">
                    <div class="q_q">Q3.</div>
                    <div class="q_qq">하루에 햇빛을 받으며 야외활동 하는 시간을 선택해 주세요.</div>
                </div>
                <div class="qa">
                    <div class="q_a">
                        <input type="radio" id="sun" name="sun" value="sun1">1시간 이상 &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="sun" name="sun" value="sun2">1시간 미만

                    </div>
                </div>
            </div>
            <div class="qa_wrap">
                <div class="q">
                    <div class="q_q">Q4.</div>
                    <div class="q_qq">일주일에 5회 이상 육류, 튀김류의 음식을 메인 음식으로 섭취 하시나요?</div>
                </div>
                <div class="qa">
                    <div class="q_a">
                        <input type="radio" id="food" name="food" value="f1">네 &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="food" name="food" value="f2">아니오

                    </div>
                </div>
            </div>
            <div class="qa_wrap">
                <div class="q">
                    <div class="q_q">Q5.</div>
                    <div class="q_qq">속이 더부룩 하거나 가스가 잘 차는 과민성 대장 증후군이 있으신가요? </div>
                </div>
                <div class="qa">
                    <div class="q_a">
                        <input type="radio" id="dung" name="dung" value="d1">예 &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="dung" name="dung" value="d2">아니오

                    </div>
                </div>
            </div>
            <div class="qa_wraplast">
                <div class="q">
                    <div class="q_q">Q6.</div>
                    <div class="q_qq">걱정되는 건강 항목을 선택해주세요.</div>
                </div>
                <div class="qa">
                    <div class="q_a">
                        <div class="inputBox"><input type="checkbox" name="info" value="1">소화/장</div>
                        <div class="inputBox"><input type="checkbox" name="info" value="2">면역력</div>
                        <div class="inputBox"><input type="checkbox" name="info" value="3">뼈/관절</div>
                        <div class="inputBox"><input type="checkbox" name="info" value="4">심장/혈관</div>
                        <div class="inputBox"><input type="checkbox" name="info" value="5">모발/피부</div>
                        <div class="inputBox"><input type="checkbox" name="info" value="6">눈</div>

                    </div>
                </div>
            </div>
            <div class="bt_wrap_update">
                <div class="bt_wrap_update_q">
                <button class="btn btn-primary" type="sumbit" value="submit">
                	결과보
                </button>
                </div>
            </div>
            </form>
        </div>
    </div>
    <br>
    <br>
    <script>

</script>
    	<c:import url="../common/footer.jsp" />
</body>

</html>