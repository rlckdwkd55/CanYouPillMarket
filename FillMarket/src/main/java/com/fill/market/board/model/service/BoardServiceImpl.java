package com.fill.market.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.board.model.dao.BoardDAO;
import com.fill.market.board.model.vo.Board;
import com.fill.market.board.exception.BoardException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
		
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		return boardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return boardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(Board board) {
		
		int boardResult = boardDAO.insertBoard(board);

		return boardResult;
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		
		Board board = boardDAO.selectOneBoard(boardNo);
		
		return board;
	}


	@Override
	public Board updateView(int boardNo) {
		
		return boardDAO.selectOneBoard(boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		
		int totalResult = 0;
		
		totalResult = boardDAO.updateBoard(board);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");
		
		return totalResult;
	}

	@Override
	public int deleteBoard(int boardNo) {
		
		return boardDAO.deleteBoard(boardNo);
	}
}
