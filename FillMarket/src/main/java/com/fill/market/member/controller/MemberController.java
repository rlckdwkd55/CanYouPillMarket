package com.fill.market.member.controller;

import java.sql.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.member.model.service.MemberService;
import com.fill.market.member.model.vo.MailVO;

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

	@RequestMapping("/member/myPage.do")
	public String myPage() {

		return "member/myPage";
	}

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

	/**
	 * Auth : GiChang Date : 2021-11-22 아이디 비밀번호 찾기 화면이동
	 * 
	 **/
	@RequestMapping("/member/memberFind.do")
	public String memberFind() {

		return "member/memberFind";

	}

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

}


