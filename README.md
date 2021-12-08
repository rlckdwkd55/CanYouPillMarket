# STS FinalProject 'CanYouPillMarket'
 
## [최종보고서 링크](report/3조_final_발표보고서.pdf)
* 프로젝트 명 : 캔유필마켓(CanYouPillMarket)

* 프로젝트 기간 : 2021-11-15 ~ 2021-11-26

* 프로젝트 설명

  - 코로나로 인해 사람들의 건강관심도가 증가한 상황과 정보 개인화 시대에 발맞춰 <br> 본인의 상태에 맞는 영양제를 추천해주고, 바로 구입가능한 영양제 쇼핑몰
  - 회원가입, 게시판마다 CRUD 적용
  - 외부 API(SNS로그인, JavaMail, daumcdn, iamport)등 다양한 기술을 활용한 프로젝트 

* 구현 기능

   - 인덱스, 회원가입, 마이페이지, 회원정보 수정
   - 간편로그인(카카오, 네이버API를 이용 편리한 로그인)
   - 아이디/비밀번호 찾기(javaMail활용 임시비밀번호 전송)
   - 맞춤진단 게시판, 고객센터
   - 상품/리뷰 조회, 장바구니/결제
   - 관리자페이지 

* 사용기술 및 개발 환경

  - OS : Windows 10, MacOS 
  - Developer-Tool : 
   VSCode / SQLDeveloper / STS / Web browser 개발도구
  - Front-End : 
   HTML5 / CSS3 / JavaScript (ES8) / jQuery / Nexacro
  - Back-End :
  Java 11 EE / Oracle DBMS 11G R2(XE) / apache-tomcat 8.5 /
  Spring-Framework(security, jdbc, aop, tx) / Mybatis / lombok
  - version control tools : 
  Egit (Eclipse Git) / GitHub
  
* 담당 역할

  - 인덱스, 회원가입, 마이페이지, 회원정보 수정
  - 간편로그인(카카오, 네이버API를 이용한 편리한 로그인)
  - 아이디/비밀번호 찾기(javaMail활용 임시비밀번호 전송)

## 구현기능 및 기능설명
### 홈페이지 인트로
![index](https://user-images.githubusercontent.com/83908822/144705983-53d038cd-446b-46ae-bc3b-f2eb13f503e7.gif)
1. 사이트로고 제작 후 세션 정보를 받아올 수 있도록 header버튼처리(로그인 시 장바구니, 관심상품)등 변환, 관리자일 시 관리자 버튼 추가
2. 상단 slideBar @KeyFrames slide 속성을 주어 자연스럽게 슬라이드 되도록 구현
3. 캐러셀에 동영상을 삽입하여 역동성을 더함
4. 실제 사이트라면 이래야 할 것이다 하는 부분을 살릴 수 있는 워딩을 골라 구성
5. 이모지를 원형으로 배치하여 하단에 깃허브로 이어지는 링크 배치 

*슬라이드 바 구현코드
~~~ jsp
@keyframes slide {
			0% {margin-top: 0;}

			10% {margin-top: 0;}

			25% {margin-top: -50px;}

			35% {margin-top: -50px;}

			50% {margin-top: -100px;}

			60% {margin-top: -100px;}

			75% {margin-top: -150px;}

			85% {margin-top: -150px;}

			100% {margin-top: 0;}
		}
  </style>
</head>
<body>
  <div class="slideBar">
    <ul style="
    padding-left: 0px;">
      <li><p class="slide_P">"환절기가 다가오는 계절, 캔유필마켓으로 지키세요"</p></li>
      <li><p class="slide_P">"강사님 감사합니다!"</p></li>
      <li><p class="slide_P">"훌륭한 개발자의 모습으로 나타날게요!"</p></li>
      <li><p class="slide_P"><strong>"기창, 지은, 창환, 예지, 승병" </strong> 올림</p></li>
    </ul>
  </div>
</body>
~~~

*캐러셀 부분과 이모지 일부
~~~ jsp
<div class="carousel-inner">
	<div class="carousel-item active">
			<video class="bd-placeholder-img" width="100%" height="auto" autoplay loop muted >
				<source src="${pageContext.request.contextPath }/resources/images/Carousel1.mp4" type="video/mp4" />
			</video>
				<div class="container">
					<div class="carousel-caption text-start">
					<h1 style="color: black;">젊음 건강 행복회복의 비결</h1>
					<p style="color: black;">
								그 행복한 꿈<br> 캔유필마켓이 이루어 드립니다! 
					</p>
				</div>
			</div>
	</div>
</div>

-----------------------------------

<div class="col-lg-4">
	<img
		src="${pageContext.request.contextPath }/resources/images/gichang.png"
		alt="">
			<h2>Gichang</h2>
			<p>
			<a class="btn btn-secondary" href="https://github.com/rlckdwkd55">GitHub
		»</a>
	</p>
</div>
~~~

#

### 회원가입
![Enroll](https://user-images.githubusercontent.com/83908822/144707029-4865affe-08ca-41d8-90fa-3edb36a73faa.gif)
1. 부트스트랩 활용 해당 화면구성(메인페이지 상단 LOGIN/JOIN버튼으로 이동가능)
2. text박스를 구별할 수 있도록 placeholder속성부여
3. 개인정보보호 종합지원 포털 등 각종사이트 참고하여 실제약관으로 구성
4. 체크박스에 필수속성을 부여

<br>

![Enroll2](https://user-images.githubusercontent.com/83908822/144707633-c146657b-13a6-4d03-b3bb-80021e14c6e1.gif)
1. 재미있게 보았던 네이버 정규표현식을 인용하여 정보입력제한
2. 생년월일의 '월'부분 select태그 안에 option을 주어 dropdwon으로 선택
3. daumcdn을 활용 최신 주소를 받아올 수 있게 구현

*정규표현식 일부
~~~ js
unction checkId() {
			var idPattern = /^[a-zA-Z0-9_-]{5,20}$/;
			if (id.value === "") {
				error[0].innerHTML = "필수 정보입니다.";
				error[0].style.display = "block";
			} else if (!idPattern.test(id.value)) {
				error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
				error[0].style.display = "block";
			} else {
				error[0].innerHTML = "멋진 아이디네요!";
				error[0].style.color = "#08A600";
				error[0].style.display = "block";
			}
		}

		function checkPw() {
			var pwPattern = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
			if (pw1.value === "") {
				error[1].innerHTML = "필수 정보입니다.";
				error[1].style.display = "block";
			} else if (!pwPattern.test(pw1.value)) {
				error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
				pwMsg.innerHTML = "사용불가";
				pwMsgArea.style.paddingRight = "93px";
				error[1].style.display = "block";

				pwMsg.style.display = "block";
			} else {
				error[1].style.display = "none";
				pwMsg.innerHTML = "안전";
				pwMsg.style.display = "block";
				pwMsg.style.color = "#03c75a";
			}
		}
~~~

#

### 간편로그인 
![간편로그인](https://user-images.githubusercontent.com/83908822/144707372-7e6965f7-7893-4d07-8479-a407e6d7e641.png)
1. kakaoDeveloper사이트에서 키를 발급받은 후 사용
2. if속성으로 해당 이메일이 존재한다면 alert창으로 '해당 이메일이 존재합니다'라는 문구 출력
3. 만약 존재하지 않으면 회원가입창으로 이동

#

### 마이페이지
![MyPage](https://user-images.githubusercontent.com/83908822/144707433-92a26414-39cc-49f3-827e-0f763a0f0855.png)
1. 부트스트랩 활용 사이트의 디자인방향에 맞도록 액자형식으로 구성
2. 상단 'OOO님 환영합니다' 부분 userName을 받아옴  

#

### 회원정보 수정
![Update](https://user-images.githubusercontent.com/83908822/144707190-1898f946-b4f1-4d27-912e-6b1c9e30f1a9.gif)
1. userId를 받아온 후 readonly속성을 주어 수정하지 못하도록 구현
2. 회원가입 시 사용하였던 정규표현식 일부를 가져와 정보입력의 제한부여

#

### 아이디 찾기 
![FindID](https://user-images.githubusercontent.com/83908822/144707761-29e702cb-84a6-4d97-856c-fe226e2e80a2.gif)
1. 회원정보(이름, 이메일)정보를 입력받아 값이 있다면 그 정보의 userId를 alert창으로 출력

*코드 일부
~~~ jsp
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
~~~

#

### 비밀번호 찾기
![FindPW](https://user-images.githubusercontent.com/83908822/144707905-0a2ddd27-5da5-48bd-899b-bd64b7ef8fc5.gif)
1. 함수값을 주어 페이지이동 없이 아이디찾기, 비밀번호 찾기 화면전환
2. 회원정보(아이디, 이름, 이메일)이 있다면 javaMail API를 활용하여 임의 비밀번호 변경, 업데이트 후 가입시 작성한 이메일로 전송

*코드 일부
~~~jsp
// 해당 코드를 pom.xml에 등록 후 
<!-- java mail API -->
		<dependency>
		    <groupId>javax.mail</groupId>
		    <artifactId>mail</artifactId>
		    <version>1.4.3</version>
		</dependency>
		<dependency> 
			<groupId>org.springframework</groupId> 
			<artifactId>spring-context-support</artifactId> 
			<version>${org.springframework-version}</version> 
		</dependency>
		<dependency> 
			<groupId>com.sun.mail</groupId> 
			<artifactId>javax.mail</artifactId> 
			<version>1.5.6</version> 
		</dependency>
		
// 다음 과정을 거친 후 메일 전송
<select id="selectMemberID" parameterType="Member" resultType="Member">
		SELECT * FROM MEMBER
		WHERE USERID = #{ userId }
		AND USERNAME = #{ userName }
		AND EMAIL = #{ email }
	</select>
	
	<update id="updateNewPass" parameterType="Member">
		UPDATE MEMBER SET PASSWORD = #{ password }
		WHERE USERID = #{ userId }
	</update>
	
	<select id="selectEmailCheck" parameterType="string" resultType="string">
		SELECT USERID FROM MEMBER
		WHERE EMAIL = #{ email }
	</select>
~~~

#

<img width="1011" alt="ThankYou" src="https://user-images.githubusercontent.com/83908822/144708026-86e2df72-f420-4cce-bc4c-c914208e0170.png">

