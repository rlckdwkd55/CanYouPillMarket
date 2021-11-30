<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
	href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body id="wrap_body">
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />

	<main class="form-signin pb-5 mb-5 pt-5">
		<div id="login-div">


			<h1 class="h3 mb-3 fw-normal mt-5">Sign in</h1>

			<form
				action="${pageContext.request.contextPath}/member/memberLoginEnd.do"
				method="post">
				<div class="form-group">
					<label for="id"></label> <input type="text" name="userId"
						class="form-control" placeholder="아이디를 입력하세요.">
				</div>

				<div class="form-group">
					<label for="password"></label> <input type="password"
						name="password" class="form-control" placeholder="비밀번호를 입력하세요.">
				</div>


				<div class="checkbox mb-3 mt-3">
					<label> <input type="checkbox" value="remember-me">
						아이디 기억하기
					</label>
				</div>
				<button class="btn" type="submit" value="Submit" id="loginBtn"
					onclick="loginProcess();">로그인</button>
			</form>



			<button class="btn" type="submit" value="Submit" id="signBtn">
				<a href="${pageContext.request.contextPath}/member/agreement.do"
					id="signBtn-a" class="btn-signup">회원가입</a>
			</button>


			<nav class="findBox mt-3">
				<a href="${pageContext.request.contextPath}/member/memberFind.do">아이디/비밀번호
					찾기</a>
			</nav>

			<h3 class="mt-2" style="text-align: left;">간편 로그인</h3>

			<div class="bigContainer">
				<div class="loginApiBox">

					<!-- 카카오톡 로그인 버튼 -->
					<a class="apiAnchor" href="javascript:kakaoLogin();"><button
							class="btn ApiBtn" type="submit" value="Submit"
							style="background-color: rgb(252, 233, 78); width: 180px;">카카오톡
							로그인</button></a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script>
						Kakao.init('46392ec51113c15db7b2310161d13fb7'); //발급받은 키 중 javascript키를 사용해준다.
						console.log(Kakao.isInitialized()); // sdk초기화여부판단
						//카카오로그인
						function kakaoLogin() {
							Kakao.Auth.login({
				                success: function (response) {
				                    Kakao.API.request({
				                        url: '/v2/user/me',
				                        success: function (response) {
				                            console.log(response)
				                            console.log(response.id)
				                            console.log(response['kakao_account']['profile']['nickname'])
				                              
				                            var id = response.id;
				                            var name = response['kakao_account']['profile']['nickname'];
				                            var email = response['kakao_account']['email'];
				                              
				                            kakaoLogout();
				                              
				                            $.ajax({
				                                type: "POST",
				                                url: "${pageContext.request.contextPath}/member/emailCheck.do",
				                                data: { email : email }, 
				                                success: function(data){
				                                    console.log(data);
				                                    console.log("Kakao email 검사 성공")
				                                    
				                                    if ( data == "" ) {
				                                        location.href = "${pageContext.request.contextPath}/member/snsMemberJoin.do";
				                                    } else {
				                                        
				                                        if ( data == id ) {
				                                            location.href = "${pageContext.request.contextPath}/member/snsLogin.do";
				                                        } else {
				                                            alert("이미 해당 이메일로 가입되어 있는 계정이 존재합니다.");
				                                        }
				                            
				                        			}
				                                    
				                                },
				                                
				                                error: function(){
				                                    alert('Kakao email 검사 실패');
				                                }
				                                
				                            });
				                          },
				                          
				                          fail: function (error) {
				                            console.log(error)
				                          },
				                        })
				                      },
				                      fail: function (error) {
				                        console.log(error)
				                      },
				                    })
				          }
				        
				        function kakaoLogout() {
				            if (Kakao.Auth.getAccessToken()) {
				              Kakao.API.request({
				                url: '/v1/user/unlink',
				                success: function (response) {
				                    console.log(response)
				                },
				                fail: function (error) {
				                  console.log(error)
				                },
				              })
				              Kakao.Auth.setAccessToken(undefined)
				            }
				          }
					</script>
					<!-- // 카카오톡 로그인 버튼 -->

					<!-- 네이버 로그인 버튼 -->

					<button id="naverIdLogin_loginButton" class="btn ApiBtn ms-4"
						type="submit" value="Submit"
						style="background-color: rgb(96, 197, 58); color: white; width: 190px;">네이버
						로그인</button>



					<!-- 네이버 스크립트 -->
					<script
						src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
						charset="utf-8"></script>

					<script>
						var naverLogin = new naver.LoginWithNaverId({
							clientId : "IQ5XsxP1tRJ5A6yl9EMb", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
							callbackUrl : "http://localhost:8180/market", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
							isPopup : false,
							callbackHandle : true
						});

						naverLogin.init();

						window.addEventListener('load', function() {
							naverLogin.getLoginStatus(function(status) {
								if (status) {
									var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

									console.log(naverLogin.user);

									if (email == undefined || email == null) {
										alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
										naverLogin.reprompt();
										return;
									}
								} else {
									console.log("callback 처리에 실패하였습니다.");
								}
							});
						});

						var testPopUp;
						function openPopUp() {
							testPopUp = window
									.open(
											"https://nid.naver.com/nidlogin.logout",
											"_blank",
											"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
						}
						function closePopUp() {
							testPopUp.close();
						}

						function naverLogout() {
							openPopUp();
							setTimeout(function() {
								closePopUp();
							}, 1000);

						}
					</script>
					<!-- // 네이버 로그인 버튼 -->

				</div>
			</div>
		</div>
	</main>



	<div
		style="position: fixed; bottom: 20px; right: 20px; font-size: 40px; text-decoration-line: none;">
		<a href="#Top">🔝</a>
	</div>
	<c:import url="../common/footer.jsp" />
</body>

</html>