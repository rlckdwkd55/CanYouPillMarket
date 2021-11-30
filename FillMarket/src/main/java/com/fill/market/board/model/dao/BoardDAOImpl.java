package com.fill.market.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.board.model.vo.Board;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override							
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("boardSQL.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return sqlSession.selectOne("boardSQL.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(Board board) {
		
		return sqlSession.insert("boardSQL.insertBoard", board);
	}


	@Override
	public Board selectOneBoard(int boardNo) {
		
		return sqlSession.selectOne("boardSQL.selectOneBoard", boardNo);
	}


	@Override
	public int updateBoard(Board board) {
		
		return sqlSession.update("boardSQL.updateBoard", board); // board-mapper.xml 찾아가서 SQL 작성하기
	}


	@Override
	public int deleteBoard(int boardNo) {
		
		return sqlSession.delete("boardSQL.deleteBoard", boardNo);
	}

}
