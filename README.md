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

### 회원가입, 로그인, 로그아웃
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
4. 비밀번호 암호화를 통하여 보안향상

**정규표현식 일부**
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
**코드 일부**
~~~ java

@SessionAttributes({ "member" })
@Controller
public class MemberController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	/**
	 * Auth : GiChang Date : 2021-11-18 로그인 이동 처리
	 * 
	 */
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {

		return "member/memberLogin";

	}

	/**
	 * Auth : GiChang Date : 2021-11-18 이용약관 이동 처리
	 * 
	 */
	@RequestMapping("/member/agreement.do")
	public String agreement() {

		return "member/agreement";

	}

	/**
	 * Auth : GiChang Date : 2021-11-19 회원가입 이동 처리
	 * 
	 */
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {

		return "member/memberEnroll";
	}

	/**
	 * Auth : GiChang Date : 2021-11-19 회원가입 처리
	 * 
	 */
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(SessionStatus status, Member m, Model model) { // HttpServletRequest / RequestParam /
																					// CommandMap

		System.out.println("받아온 정보 확인 : " + m);

		String pass1 = m.getPassword(); // 원래 비밀번호
		String pass2 = bcryptPasswordEncoder.encode(pass1); // 비밀번호 암호화

		System.out.println(pass1 + " / " + pass2);
		m.setPassword(pass2);

		// yyyy-MM-dd 변경
		String birthCheck = m.getBirthYear() + "-" + m.getBirthMonth() + "-" + m.getBirthDay();
		m.setBirth(Date.valueOf(birthCheck));

		try {
			// 1. 서비스로 비즈니스(업무) 로직 수행하기
			int result = memberService.insertMember(m);

			// 2. 처리 결과에 따른 화면 처리
			String loc = "/"; // welcome-file
			String msg = "";

			if (result > 0) {
				msg = "회원 가입 성공!";
			} else {
				msg = "회원 가입 실패!";
			}

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 시 에러 발생!");
			System.out.println("Err :: " + e.getMessage());

		}

		return "common/msg";

	}

	/**
	 * Auth : GiChang Date : 2021-11-19 로그인 처리
	 * 
	 **/
	@RequestMapping("/member/memberLoginEnd.do")
	public String memberLogin(@RequestParam String userId, @RequestParam String password, Model model) {

		HttpSession session;

		System.out.println("로그인 기능 접근 확인!");

		// 1. 아이디를 통해 회원 정보 조회
		Member result = memberService.selectOneMember(userId); 

		String loc = "/";
		String msg = "";

		if (result != null) {
			// 아이디는 있었다!
			if (bcryptPasswordEncoder.matches(password, result.getPassword())) {
				// bcrypt에서 비교를 위한 메소드를 제공해준다!
				msg = "로그인 성공!";

				model.addAttribute("member", result);
				// model은 기본적으로 객체를 request 영역에 저장한다.
				// @SessionAttributes 어노테이션을 통해 세션에 저장할 수 있다!
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "존재하지 않는 아이디입니다!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	/**
	 * Auth : GiChang Date : 2021-11-19 로그아웃 처리
	 * 
	 **/
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status, Model model) {

		String loc = "/";
		String msg = "";

		if (!status.isComplete()) {
			status.setComplete();

			msg = "로그아웃 되셨습니다!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}
~~~



### 마이페이지
![MyPage](https://user-images.githubusercontent.com/83908822/144707433-92a26414-39cc-49f3-827e-0f763a0f0855.png)
1. 부트스트랩 활용 사이트의 디자인방향에 맞도록 액자형식으로 구성
2. 상단 'OOO님 환영합니다' 부분 userName을 받아옴  

#

### 회원정보 수정
![Update](https://user-images.githubusercontent.com/83908822/144707190-1898f946-b4f1-4d27-912e-6b1c9e30f1a9.gif)
1. userId를 받아온 후 readonly속성을 주어 수정하지 못하도록 구현
2. 회원가입 시 사용하였던 정규표현식 일부를 가져와 정보입력의 제한부여

**코드일부**
~~~ java
/**
	 * Auth : GiChang Date : 2021-11-22 정보수정 페이지 이동
	 * 
	 **/
	@RequestMapping("/member/memberView.do")
	public String memberView() {

		return "member/memberView";

	}

	/**
	 * Auth : GiChang Date : 2021-11-22 회원정보 수정
	 * 
	 **/
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {

		String pass1 = member.getPassword(); // 원래 비밀번호
		String pass2 = bcryptPasswordEncoder.encode(pass1); // 비밀번호 암호화

		System.out.println(pass1 + " / " + pass2);
		member.setPassword(pass2);

		String loc = "/";
		String msg = "";

		// yyyy-MM-dd 변경
		String birthCheck = member.getBirthYear() + "-" + member.getBirthMonth() + "-" + member.getBirthDay();
		System.out.println(birthCheck);
		member.setBirth(Date.valueOf(birthCheck));

		int result = memberService.updateMember(member);

		System.out.println("받아온 정보 확인 : " + member);

		if (result > 0) {
			msg = "정보 수정 성공!";
			model.addAttribute("member", member);
		} else {
			msg = "정보 수정 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	/**
	 * Auth : GiChang Date : 2021-11-22 회원정보 수정
	 * 
	 **/
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(Member member, SessionStatus status, Model model) {

		int result = memberService.deleteMember(member.getUserId());

		String loc = "/";
		String msg = "";

		if (result > 0) {
			msg = "회원 탈퇴 성공!";
			status.setComplete();
		} else {
			msg = "회원 탈퇴 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}
~~~
#

### 아이디 찾기 
![FindID](https://user-images.githubusercontent.com/83908822/144707761-29e702cb-84a6-4d97-856c-fe226e2e80a2.gif)
1. 회원정보(이름, 이메일)정보를 입력받아 값이 있다면 그 정보의 userId를 alert창으로 출력

**코드 일부**
~~~java
@RequestMapping("/member/memberFindId.do")
	public String memberFindId(@RequestParam String userName, @RequestParam String email, Model model) {
		
		Member m = new Member();
		m.setUserName(userName);
		m.setEmail(email);
		
		String msg = "";
		String loc = "";

		System.out.println("전달받은 데이터 : " + userName + "/" + email);
		
		Member member = memberService.memberFindId(m);
		System.out.println("member 데이터 : " + userName + "/" + email);

		// 해당 이름과 이메일주소를 가진 회원이 존재하는지 확인
		if (member == null) {
			msg = "일치하는 회원이 존재하지 않습니다.";
			
			loc = "/member/memberFind.do";
			
			System.out.println("조건문(if) 결과 : " + member);
			
			
		} else {
			
			loc ="/member/memberLogin.do"; 
			
		// 로그인아이디 알림창 보여주고 로그인화면으로 이동
			msg = userName + " 회원님의 아이디는 /" + member.getUserId() + "/ 입니다.";
		
		System.out.println("조건문(else) 결과 : " + member.getUserId());
		
		
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
~~~

#

### 비밀번호 찾기
![FindPW](https://user-images.githubusercontent.com/83908822/144707905-0a2ddd27-5da5-48bd-899b-bd64b7ef8fc5.gif)
1. 함수값을 주어 페이지이동 없이 아이디찾기, 비밀번호 찾기 화면전환
2. 회원정보(아이디, 이름, 이메일)이 있다면 javaMail API를 활용하여 임의 비밀번호 변경, 업데이트 후 가입시 작성한 이메일로 전송

**코드 일부**
~~~java
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
~~~
~~~ java	
// 다음 과정을 거친 후 메일 전송
@RequestMapping("member/memberFindPw.do")
	public String sendPwMail(
			final MailVO vo,
			Member member,
			Model model,
			SessionStatus status
			) {
		
		System.out.println("sendMail Controller 접근 : " + member);
		
		Member m;
		String msg = "";
		
		m = memberService.selectMemberID(member);
		
		System.out.println("sendMail selectMemberId : " + m );
		
		if( m != null) {
			// member가 있다면
			
			String newPass = randomCode(); // 랜덤비밀번호 생성
			String encryptPass = bcryptPasswordEncoder.encode(newPass); // 생성한 비밀번호 암호화 
			
			m.setPassword(encryptPass); // 암호화 한 비밀번호 등록
			
			int updateResult = memberService.updateNewPass(m); // 업데이트 정보 숫자로 받아오기
			
			if( updateResult > 0) {
				// 업데이트가 됐다면 
				vo.setFrom("CanYouPillMarket@gmail.com"); // 보내는사람
				vo.setTo(m.getEmail());
				vo.setSubject("[캔유필마켓] 임시 비밀번호 관련 메일");
				vo.setContents(
							"<html><body><div style=\"width: 400px; height: 300px; padding: 50px; background: black; text-align: center; color: white;\">"
							+ "<h2>캔유필마켓 에서 알려드립니다.</h2><br>"
							+ "<p>비밀번호 찾기 요청을 주신 " + m.getUserId()
							+ "님의 임시 비밀번호는 <p style='font-weight:bolder; font-size:larger;'>" 
							+ newPass + "</p> 입니다.<br>"
							+ "확인 후 캔유필마켓 홈페이지에서 로그인해주세요.<br>"
							+ "로그인 후 마이페이지 > 회원정보수정 에서 반드시 비밀번호를 재설정 해 주시길 바랍니다."
							+ "</p></div>"
							+ "</body></html>"
						);
			
				// 메일 전송을 위해 MimeMessagePreparator 클래스를 사용하는 방식입니다.
				// 이방식을 사용하기위해 import 되는 클래스는 다음과 같습니다.
				// import javax.mail.internet.MimeMessage;
				// import org.springframework.mail.javamail.JavaMailSenderImpl;
				// import org.springframework.mail.javamail.MimeMessageHelper;
				// import org.springframework.mail.javamail.MimeMessagePreparator;
				final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
					@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
						
						// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			            // mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
						// 보내는이(from)은 반드시 있어야합니다. 
						// mailSender 빈에서 아이디를 기입하였지만 이는 SMTP 사용 권한을 얻어 오는 역할을 수행합니다.
						helper.setFrom("CanYouPillMarket <CanYouPillMarket@gmail.com>"); 
						helper.setTo(vo.getTo()); 
						helper.setSubject(vo.getSubject()); 
						helper.setText(vo.getContents(), true); // true는 html을 사용하겠다는 의미 
					} 
				}; 
				
				// @Autowired
				// private JavaMailSenderImpl mailsender;를 잡아주어야 한다.
				mailSender.send(preparator); 
				
				msg = m.getUserName() + "님의 메일주소로 임시 비밀번호를 발송했습니다. 확인 후 로그인해주세요.";
			
			} else { // 비밀번호 업데이트 되지 않았다면.
				System.out.println("임시 비밀번호 업데이트 실패!");
			}
			
		} else { // member가 없다면.
			msg = "입력하신 정보로 가입된 정보가 없습니다.";
		}
		
		// 세션 등록 방지
		status.setComplete();
				
		model.addAttribute("msg", msg);
						
		return "common/msg";
	}
	
	
	// 랜덤한 임시 비밀번호 생성 메소드
		public String randomCode() {
			
			int leftLimit = 48; // numeral '0'
			int rightLimit = 122; // letter 'z'
			int targetStringLength = 8;
			Random random = new Random();

			String generatedString = random.ints(leftLimit,rightLimit + 1)
			  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
			  .limit(targetStringLength)
			  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			  .toString();

			System.out.println(generatedString);
			
			return generatedString;
		}
	
		@RequestMapping(value={"member/emailCheck.do", "*/member/emailCheck.do"})
	    @ResponseBody
	    public String emailCheck(@RequestParam String email) {
	        
	        System.out.println("kakaoCheck Controller Access");
	        
	        String userId = memberService.selectEmailCount(email);
	        
	        
	        return userId;
	    }

		// sns로그인 시 해당 메일주소의 회원이 없다면, 
	    // sns로그인으로 얻은 정보와 함께 회원 가입페이지로 가기
	    @RequestMapping("/member/snsMemberJoin.do")
	    public String kakaoMemberJoin(
	                Model model
	            ) {
	        // 임의로 비밀번호 생성
	        String password = randomCode();
	        System.out.println("확인완");
	        return "member/memberEnroll";
	    }
	    
	    // sns 로그인 시 받아오는 정보로 로그인
	    @RequestMapping(value={"member/snsLogin.do", "*/member/snsLogin.do"})
	    public String kakaoLogin(
	                @RequestParam String userId,
	                Model model,
	                SessionStatus status
	            ) {
	        
	        System.out.println("login Access");
	        
	        // 이미 sns 로그인 계정이 확인되었기 때문에 비밀번호는 검사하지 않음
	        Member result = memberService.selectOneMember(userId);
	        
	        System.out.println("로그인 조회 결과 : " + result);
	        
	        String loc = "/";
	        String msg = "";
	        
	        if ( result != null ) {
	            
	            msg = "로그인 성공";
	            model.addAttribute("member", result);
	                
	        } else {
	            msg = "아이디를 다시 확인해주세요.";
	        }
	        
	        
	        model.addAttribute("msg", msg);
	        model.addAttribute("loc", loc);
	        
	        return "common/msg";
	    }
~~~

#

<img width="1011" alt="ThankYou" src="https://user-images.githubusercontent.com/83908822/144708026-86e2df72-f420-4cce-bc4c-c914208e0170.png"> 

