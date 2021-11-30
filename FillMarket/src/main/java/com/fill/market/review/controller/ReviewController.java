package com.fill.market.review.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fill.market.common.Utils;
import com.fill.market.review.model.service.ReviewService;
import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/review/reviewList.do")
	public String selectReveiwList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 5;
		
		// 현재 페이지와 한 페이지당 게시글 수를 같이 가지고 DB에 조회
		// 현재  페이지의 게시글 수 
		List<Map<String, String>> list = reviewService.selectReviewList(cPage, numPerPage);
				//컬럼명  값
				// ㄴ> list에 저 둘이 담기고 담기고 담겨서 목록 생성
		
		// 전체 게시글 수
		int totalContents = reviewService.selectReviewTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "reviewList.do");
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "review/reviewList";
	}
	
	@RequestMapping("/review/reviewForm.do")
	public String reviewForm(String pno, String pname, Model model) { // 글쓰기 메소드!
		
		model.addAttribute("pno",  pno);
		model.addAttribute("pname",  pname);
		
		return "review/reviewForm";
	}
	
	@RequestMapping("/review/reviewFormEnd.do")
	public String insertReview(Review review, Model model, HttpServletRequest req,
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		System.out.println("review : " + review);
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
		String savePath = req.getServletContext().getRealPath("/resources/reviewUpload");
		List<RAttachment> rattachList = new ArrayList<RAttachment>();
		
		// 2. 파일 업로드
		for(MultipartFile f : upFiles) {
			if(f.isEmpty() == false) {
				
				// 3. 파일 이름 변경
				String originName = f.getOriginalFilename(); // 원본 이름
				String changeName = fileNameChanger(originName); // 서버에서 관리할 이름
				
				// 4. 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 5. rattachList에 담기
				RAttachment ra = new RAttachment();
				ra.setOriginalname(originName);
				ra.setChangename(changeName);
				
				rattachList.add(ra);
			}
		}
		
		// 6. 게시글 DB에 등록
		int result = reviewService.insertReview(review, rattachList);
		
		String loc = "/review/reviewList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "리뷰 등록 성공!";
		} else {
			msg = "리뷰 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	// 단순 파일 이름 변경 메소드
	public String fileNameChanger(String oldName) {

		String ext = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext; 
			
	}
	
	@RequestMapping("/review/reviewView.do")
	public String reviewView(@RequestParam int reno, String pname, Model model) {
		
		Review review = reviewService.selectOneReview(reno);
		List<RAttachment> rattachmentList = reviewService.selectRAttachmentList(reno);
		
		model.addAttribute("review", review);
		model.addAttribute("pname",  pname);
		model.addAttribute("rattachmentList", rattachmentList);
		// System.out.println("pname:"+pname);
		
		return "review/reviewView";
	}
	
	
	@RequestMapping("/review/reviewUpdateView.do")
	public String reviewUpdateView(@RequestParam int reno, String pname, Model model) {
		
		Review review = reviewService.updateView(reno);
		
		List<RAttachment> rattachmentList = reviewService.selectRAttachmentList(reno);
		
		model.addAttribute("review", review);
		model.addAttribute("pname",  pname);
		model.addAttribute("rattachmentList", rattachmentList);
		
		return "review/reviewUpdateView";		
	}
	
	@RequestMapping("/review/reviewUpdate.do")
	public String reviewUpdate(Review review, HttpServletRequest request, Model model, 
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
							  @RequestParam(value="rano", required=false, defaultValue="0") int rano) {
		// 1. 원본 게시글 불러와 수정하기
		int reno = review.getReno();
		
		Review originReview = reviewService.updateView(reno);
		
		originReview.setRetitle( review.getRetitle() );
		originReview.setRecontent( review.getRecontent() );
		
		// 2. 첨부파일 수정하기
		String savePath = request.getServletContext().getRealPath("/resources/reviewUpload");
		List<RAttachment> rattachList = null;
		
		if(rano != 0) {
			rattachList = reviewService.selectRAttachmentList(rano);
		}
		if( rano == 0 && rattachList == null ) rattachList = new ArrayList<RAttachment>();
		
		int idx = 0;
		for(MultipartFile f : upFiles) {
			RAttachment temp = null;
			
			//  !f.isEmpty()
			if( f.isEmpty() == false ) {
				
				if(rattachList.size() > idx) { // 파일이 있다면
					File oldFile = new File(savePath + "/" + rattachList.get(idx).getChangename());
					System.out.println("변경 전 파일 삭제 : " + oldFile.delete());
					
					temp = rattachList.get(idx);
				} else {
					temp = new RAttachment();
					temp.setReno(rano);
					
					rattachList.add(temp);
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
				temp.setReno(reno);
				temp.setOriginalname(originName);
				temp.setChangename(changeName);
				
				rattachList.set(idx, temp); // 새로 들어온 파일이 있으면 기존의 파일 기록 위에 덮어씌우는 과정
				
			}
			idx++;
		}
		
		int result = reviewService.updateReview(originReview, rattachList);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/review/reviewList.do";
		String msg = "";
		
		if( result > 0 ) msg = "게시글 수정 성공!";
		else msg ="게시글 수정 실패";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/review/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int reno,
							   @RequestParam String rName,
							   HttpServletRequest request) {
		
		String savePath = request.getServletContext().getRealPath("/resources/reviewUpload");
		
		// 1. DB에서 첨부파일 삭제
		int result = reviewService.deleteFile(reno);
		
		if( result == 1 ) {
			File goodbye = new File(savePath + "/" + rName);
			
			goodbye.delete();
			
			return true;
		} else {
			return false;
		}	
	}
	
	@RequestMapping("/review/reviewDelete.do")
	public String reviewDelete(@RequestParam int reno, 
							  HttpServletRequest request,
							  Model model) {
		
		String savePath = request.getServletContext().getRealPath("/resources/reviewUpload");
		
		// 첨부파일 삭제 명단
		List<RAttachment> deList = reviewService.selectRAttachmentList(reno);
		
		// 게시글 삭제
		int result = reviewService.deleteReview(reno); // 서비스 이동~!
		
		String loc = "/review/reviewList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "삭제 완료!";
			
			for(RAttachment ra : deList ) {
				new File(savePath + "/" + ra.getChangename()).delete();
			}
		} else { 
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}
