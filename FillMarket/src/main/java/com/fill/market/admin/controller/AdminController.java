package com.fill.market.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fill.market.admin.model.service.AdminService;
import com.fill.market.admin.model.vo.Member;
import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.admin.model.vo.QNA;
import com.fill.market.admin.model.vo.QNARE;
import com.fill.market.common.Utils;
import com.fill.market.order.model.vo.OrderList;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping("/admin/adminMain.do")
	public String adminMain() {

		return "admin/adminMain";
	}
	

	@RequestMapping("/admin/adminProductList.do")
	public String adminProductList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectProductList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectProductTotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminProductList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/adminProductList";

	}

	@RequestMapping("/admin/productFrom.do")
	public String productFrom() {

		return "admin/adminProductReg";

	}

	@RequestMapping("/admin/productRegEnd.do")
	public String productInset(Product product, Model model, HttpServletRequest req,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles) {

		System.out.println(product);

		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
		String savePath = req.getServletContext().getRealPath("/resources/productUpload");
		List<PAttachment> attachList = new ArrayList<PAttachment>();

		// 2. 파일 업로드
		for (MultipartFile f : upFiles) {
			if (f.isEmpty() == false) {

				// 3. 파일 이름 변경
				String originName = f.getOriginalFilename(); // 원본 이름
				String changeName = fileNameChanger(originName); // 서버에서 관리할 이름

				// 4. 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// 5. attachList에 담기
				PAttachment a = new PAttachment();

				a.setOriginalname(originName);
				a.setChangename(changeName);

				attachList.add(a);

			}
		}

		// 6. 게시글 DB에 등록
		int result = adminService.insertProduct(product, attachList);

		String loc = "/admin/adminProductList.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 등록 성공!";
		} else {
			msg = "게시글 등록 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	// 단순 파일 이름 변경 메소드
	public String fileNameChanger(String oldName) {

		String ext = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int) (Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}

	@RequestMapping("/admin/adminView.do")
	public String adminView(@RequestParam int pno, Model model) {

		Product product = adminService.selectOneProduct(pno);
		List<PAttachment> attachList = adminService.selectAttachment(pno);

		model.addAttribute("product", product);
		model.addAttribute("attachList", attachList);

		return "admin/adminProductView";

	}

	@RequestMapping("/admin/adminUpdateView.do")
	public String adminUpdateView(@RequestParam int pno, Model model) {

		Product product = adminService.selectOneProduct(pno);
		List<PAttachment> attachList = adminService.selectAttachment(pno);

		model.addAttribute("product", product);
		model.addAttribute("attachList", attachList);
		System.out.println(attachList);
		return "admin/adminUpdateView";

	}

	@RequestMapping("/admin/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName, HttpServletRequest request) {
		String savePath = request.getServletContext().getRealPath("/resources/productUpload");

		int result = adminService.deleteFile(attNo);

		if (result == 1) {
			File goodbye = new File(savePath + "/" + rName);

			goodbye.delete();

			return true;

		} else {

			return false;
		}
	}

	@RequestMapping("/admin/productUpdateEnd.do")
	public String productUpdateEnd(Product product, HttpServletRequest request, Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles) {
		System.out.println(product);

		int productNo = product.getPno();

		Product originPro = adminService.selectOneProduct(productNo);

		System.out.println(originPro);

		originPro.setCno(product.getCno());
		originPro.setPname(product.getPname());
		originPro.setPstock(product.getPstock());
		originPro.setPprice(product.getPprice());
		originPro.setPinfo(product.getPinfo());
		originPro.setFprec(product.getFprec());

		// 2. 첨부파일 수정하기
		String savePath = request.getServletContext().getRealPath("/resources/productUpload");

		List<PAttachment> attachList = adminService.selectAttachment(productNo);
		if (attachList == null)
			attachList = new ArrayList<PAttachment>();

		int idx = 0;
		for (MultipartFile f : upFiles) {
			PAttachment temp = null;

			if (f.isEmpty() == false) {

				if (attachList.size() > idx) { // 파일이 있다면
					File oldFile = new File(savePath + "/" + attachList.get(idx).getChangename());
					System.out.println("변경 전 파일 삭제 : " + oldFile.delete());

					temp = attachList.get(idx);
				} else {
					temp = new PAttachment();
					temp.setPno(productNo);

					attachList.add(temp);
				}

				// 파일 저장용 이름 바꾸기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);

				// 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				temp.setOriginalname(originName);
				temp.setChangename(changeName);

				attachList.set(idx, temp);
			}
			idx++;
		}

		int result = adminService.updateProduct(originPro, attachList); // 서비스 찾아가서 마저 구현해주기

		String loc = "/admin/adminProductList.do";
		String msg = "";

		if (result > 0)
			msg = "게시글 수정 성공!";
		else
			msg = "게시글 수정 실패!";

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	@RequestMapping("/admin/productDelete.do")
	public String productDelete(@RequestParam int pno, HttpServletRequest request, Model model) {

		String savePath = request.getServletContext().getRealPath("/resources/productUpload");

		// 첨부파일삭제 명단
		List<PAttachment> delList = adminService.selectAttachment(pno);

		// 게시글 삭제
		int result = adminService.deleteProdcut(pno); // 서비스 이동~!

		String loc = "/admin/adminProductList.do";
		String msg = "";

		if (result > 0) {
			msg = "삭제 완료!";

			for (PAttachment a : delList) {
				new File(savePath + "/" + a.getChangename()).delete();
			}
		} else {
			msg = "삭제 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	// ------------------- 사용자 관리
	// ----------------------------------------------------------------- //

	// 사용자 리스트 뽑아오기
	@RequestMapping("/admin/adminUserManageList.do")
	public String adminUserManageList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 15;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectUserList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectUserTotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminUserManageList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/adminUserManage";

	}

	@RequestMapping("/admin/adminUserView.do")
	public String adminUserView(@RequestParam String userid, Model model) {

		Member member = adminService.adminSelectUser(userid);

		model.addAttribute("member", member);

		return "admin/adminUserView";
	}

	@RequestMapping("/admin/userDelete.do")
	@ResponseBody
	public boolean userDelete(@RequestParam String userId) {

		int result = adminService.userDelete(userId);
		System.out.println(result);

		if (result == 1) {

			return true;

		} else {

			return false;
		}

	}

	@RequestMapping("/admin/userRes.do")
	@ResponseBody
	public boolean userRes(@RequestParam String userId) {

		int result = adminService.userRes(userId);
		// System.out.println(result);

		if (result == 1) {

			return true;

		} else {

			return false;
		}
	}

	@RequestMapping("/admin/checkNameList.do")
	public String checkNameList(@RequestParam String userName,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> listud = adminService.selectNameUserList(cPage, numPerPage, userName);

		// 전체 게시글 수
		int totalContents = adminService.selectUserNameTotalContents(userName);

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "checkNameList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("listud", listud);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/userNameList";

	}

	
	
	
	
	
	
	
	
// ---------------------------------- 문의 게시판 --------------------------------------------------------------------------//

	@RequestMapping("/admin/adminQNAList.do")
	public String adminQNAList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectQNAList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectQNATotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminQNAList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/adminQNAList";

	}

	@RequestMapping("admin/QnAView.do")
	public String qnaView(@RequestParam int qano, Model model) {

		QNA qna = adminService.selectQNAView(qano);
		List<QNARE> reply = adminService.selectReply(qano);

		// System.out.println(reply);
		// System.out.println(reply.size());

		model.addAttribute("reply", reply);
		model.addAttribute("qna", qna);

		return "admin/adminQNAView";
	}

	@RequestMapping("/admin/adminReplyReg.do")
	public String adminReplyReg(@RequestParam String comment, @RequestParam int qano, @RequestParam String userId,
			Model model) {

		System.out.println(comment + " / " + qano + " / " + userId);

		QNARE qna = new QNARE();

		qna.setQano(qano);
		qna.setQauserid(userId);
		qna.setRcontent(comment);
		qna.setRtitle("문의 제목");

		QNARE reply = adminService.inserReply(qna);

		model.addAttribute("reply", reply);

		return "admin/Reply";

	}

	@RequestMapping("/admin/adminQNADelete.do")
	public String adminQNADelete(@RequestParam int qano) {

		int result = adminService.qnaDelete(qano);

		return "redirect:/admin/adminQNAList.do";
	}

	
	
	
	
	
	
	
	
	
	// ------------------------------------ 매출 관리 -------------------------------------------------------//
	@RequestMapping("/admin/adminSalesManagement.do")
	public String adminSalesManagement(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 20;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectProductList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectProductTotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminSalesManagement.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);


		return "admin/adminSalesManagements";
		
		
	}
	
	
	@RequestMapping("/admin/productGraph.do")
	public String productGraph(Model model, @RequestParam int pno) {
		
		//System.out.println(pno);
		Product productDay = adminService.selectOneProduct(pno);
		
		//System.out.println(product.getPprice());
		//* product.getPprice();
		int result =  (int) (Math.random()* 100) * productDay.getPprice();
		productDay.setPsell(result);
		
		//System.out.println(product.getPsell());
		
		model.addAttribute("productDay", productDay);
		
		
		return "admin/graph";
	}
	
	
	//---------------------------관리자 정보-----------------------------//
	
	
	
	@RequestMapping("/admin/adminInfo.do")
	public String adminInfo(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, HttpSession session) {

			String myInfo = ((Member) (session.getAttribute("member"))).getUserId();
			
			Member myMember = adminService.adminSelectUser(myInfo);
			
			
		
		
			// 한 페이지당 게시글 수
			int numPerPage = 15;

			// 현재 페이지의 게시글 수
			List<Map<String, String>> list = adminService.selectUserList(cPage, numPerPage);

			// 전체 게시글 수
			int totalContents = adminService.selectUserTotalContents();

			// 페이지 처리 Utils 사용하기
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminInfo.do");

			// System.out.println("list : " + list);
			// System.out.println("pageBar : " + pageBar);

			model.addAttribute("myMember", myMember);
			model.addAttribute("list", list);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);

			return "admin/adminInfo";
		
	}
	
	
	
	
	
	@RequestMapping("/admin/memoSave.do")
	@ResponseBody
	public boolean memoSave(@RequestParam String memo, @RequestParam String userId) {
		
	
		Map<String, String> memoVal = new HashMap<String, String>();
		
		memoVal.put("memo", memo);
		memoVal.put("userId", userId);
		
		// System.out.println(memoVal);
		
		int result = adminService.adminMemoInsert(memoVal);
		
		if(result == 1) {
			return true;
		}else {
			return false;				
		}			
	}
	
	
	@RequestMapping("/admin/userClick.do")
	public String userClick(@RequestParam String userId, Model model) {
		
		Member userMember = adminService.adminSelectUser(userId);
		
		if(userMember != null) {
			
			model.addAttribute("userMember" ,userMember);
			
		}else {
			String str = "찾으신 사용자가 없습니다.";
			model.addAttribute("str", str);
			
		}
		
		return "admin/selectUser";
		
	}
	
	@RequestMapping("/admin/adminOrderList.do")
	public String orderList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, 
							Model model, @RequestParam String userId) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 4;

		// 현재 페이지의 게시글 수
		List<OrderList> orderlist = adminService.selectOrderList(userId);
		System.out.println(orderlist);

		// 전체 게시글 수
		int totalContents = adminService.selectOrderTotalContents(userId);
		System.out.println(totalContents);

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminOrderList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		
		
		
		if(orderlist.size() > 0) {
			
			model.addAttribute("orderlist", orderlist);
			return "admin/adminOrderList";
			
		}else {
			
			return "null";
			
		} 
		
	}

	
	
	@RequestMapping("/admin/userAuthorUpdate.do")
	@ResponseBody
	public boolean userAuthorUpdate(@RequestParam String userId, @RequestParam int selectAuthor) {
		System.out.println(userId + "/" +selectAuthor);
		
		Member member = new Member();
		
		member.setUserId(userId);
		member.setLevelType(selectAuthor);
		
		int result = adminService.updateUserAuthor(member);
		
		if(result > 0) {
			
			return true;
		}else {
			
			return false;
			
		}

	}
	
	
	
	//---------------------------------- 대시 보드 -----------------------------------------------------//
	@RequestMapping("/admin/admindashBoard.do")
	public String admindashBoard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 유저 수
		int memberCount = adminService.memberCount();
		// 상품 수
		int productCount = adminService.productCount();
		// 문의 수
		int qnaCount = adminService.qnaCount();
		
		// 상품리스트
		List<Map<String, String>> productList = adminService.selectProductList(cPage, numPerPage);
		// 사용자리스트
		List<Map<String, String>> userList = adminService.selectUserList(cPage, numPerPage);
		// 문의리스트
		List<Map<String, String>> QnAList = adminService.selectQNAList(cPage, numPerPage);
		
		
		int totalContents = adminService.selectProductTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "admindashBoard.do");

		//System.out.println(producList);
		//System.out.println(userList);
		//System.out.println(QnAList);
		
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		model.addAttribute("productList", productList);
		model.addAttribute("userList", userList);
		model.addAttribute("QnAList", QnAList);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("productCount", productCount);
		model.addAttribute("qnaCount", qnaCount);
		
		return "admin/dashBoard";
	}
	
}
