package com.fill.market.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override							// 1페이지면 0~9 / 2페이지면 10~19 / 3페이지면 20~29
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1 )* numPerPage, numPerPage);
		
		return sqlSession.selectList("reviewSQL.selectReviewList", null, rows);
	}

	@Override
	public int selectReviewTotalContents() {
		
		return sqlSession.selectOne("reviewSQL.selectReviewTotalContents");
	}

	@Override
	public int insertReview(Review review) {
		
		return sqlSession.insert("reviewSQL.insertReview", review);
	}

	@Override
	public int insertRAttachment(RAttachment ra) {
		
		return sqlSession.insert("reviewSQL.insertRAttachment", ra);

	}

	@Override
	public Review selectOneReview(int reno) {
		
		return sqlSession.selectOne("reviewSQL.selectOneReview", reno);
	}

	@Override
	public List<RAttachment> selectRAttachmentList(int reno) {
		
		return sqlSession.selectList("reviewSQL.selectRAttachmentList", reno);
	}

	@Override
	public int updateReview(Review review) {
		
		return sqlSession.update("reviewSQL.updateReview", review);
	}

	@Override
	public int updateRAttachment(RAttachment ra) {
		
		return sqlSession.insert("reviewSQL.updateRAttachment", ra);
	}

	@Override
	public int deleteReview(int reno) {
		
		return sqlSession.delete("reviewSQL.deleteReview", reno);
	}

	@Override
	public int deleteRAttachment(int rano) {
		
		return sqlSession.delete("reviewSQL.deleteRAttachment", rano);
	}

	@Override
	public int deleteFile(int reno) {
		
		return sqlSession.delete("reviewSQL.deleteFile", reno);
	}

}
