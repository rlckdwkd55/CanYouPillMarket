package com.fill.market.board.model.dao;

import java.util.List;
import java.util.Map;

import com.fill.market.board.model.vo.Board;

public interface BoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	Board selectOneBoard(int boardNo);
	
	int updateBoard(Board board);

	int deleteBoard(int boardNo);
}
