package com.fill.market.board.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fill.market.board.model.service.BoardService;
import com.fill.market.board.model.vo.Board;
import com.fill.market.common.Utils;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/qna/qnaList.do")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = boardService.selectBoardList(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = boardService.selectBoardTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "qnaList.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "qna/qnaList";
	}
	
	@RequestMapping("/qna/qnaWrite.do")
	public String boardForm() { // 글쓰기 메소드!
		
		return "qna/qnaWrite";
	}
	
	@RequestMapping("/qna/qnaWriteEnd.do")
	public String insertBoard(Board board, Model model, HttpServletRequest req) {

		System.out.println("board : " + board);
		
		// 게시글 DB에 등록
		int result = boardService.insertBoard(board);
		
		String loc = "/qna/qnaList.do";
		String msg = "";
		
		if( result > 0) {
			msg = "게시글 등록 성공!";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/qna/qnaView.do")
	public String boardView(@RequestParam int no, Model model) {
		
		Board board = boardService.selectOneBoard(no);
		
		model.addAttribute("board", board);
		
		return "qna/qnaView";
	}
	
	
	@RequestMapping("/qna/qnaUpdateView.do")
	public String boardUpdateView(@RequestParam int boardNo, Model model) {
		
		Board board = boardService.updateView(boardNo);

		model.addAttribute("board", board);

		return "qna/qnaUpdateView";		
	}
	
	@RequestMapping("/qna/qnaUpdate.do")
	public String boardUpdate(Board board, HttpServletRequest request, Model model){
		// 1. 원본 게시글 불러와 수정하기
		int boardNo = board.getQano();
		System.out.println(boardNo);
		Board originBoard = boardService.updateView(boardNo);
		
		originBoard.setQatitle(board.getQatitle() );
		originBoard.setQacontent(board.getQacontent() );
		originBoard.setQasel(board.getQasel() );

		int result = boardService.updateBoard(originBoard);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/qna/qnaList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/qna/qnaDelete.do")
	public String boardDelete(@RequestParam int boardNo,
							  Model model) {
		
		
		// 게시글 삭제
		int result = boardService.deleteBoard(boardNo); // 서비스 이동~!
		
		String loc = "/qna/qnaList.do";
		String msg = "";

		if( result > 0 ) {
			msg = "삭제 완료!";	
		} else {
			msg = "삭제 실패!";
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}














