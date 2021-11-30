package com.fill.market.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.review.exception.ReviewException;
import com.fill.market.review.model.dao.ReviewDAO;
import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage) {
		
		return reviewDAO.selectReviewList(cPage, numPerPage);
	}

	@Override
	public int selectReviewTotalContents() {
		
		return reviewDAO.selectReviewTotalContents();
	}

	@Override
	public int insertReview(Review review, List<RAttachment> rattachList) {
		
		int ReviewResult = reviewDAO.insertReview(review);
		
		// 첨부파일 존재 여부를 boardNo를 통해 알 수 있는 방법
		// 1. BoardDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기
		// 2. mapper 파일을 통해서 가장 최근에 추가된 게시글 번호 가져오기
		
		if( rattachList.size() > 0 ) {
			// 첨부파일이 있을 때만 실행해라
			
			for(RAttachment ra : rattachList ) {
				int rattachResult = reviewDAO.insertRAttachment(ra);
				if( rattachResult == 0 ) throw new ReviewException("첨부파일 전송 실패!");
			}
		}
				
		return ReviewResult;
	}

	
	@Override
	public Review selectOneReview(int reno) {
		
		Review review = reviewDAO.selectOneReview(reno);
		
		return review;
	}

	@Override
	public List<RAttachment> selectRAttachmentList(int reno) {
		
		return reviewDAO.selectRAttachmentList(reno);
	}

	@Override
	public Review updateView(int reno) {
		
		return reviewDAO.selectOneReview(reno);
	}

	
	@Override
	public int updateReview(Review review, List<RAttachment> rattachList) {
		
		int totalResult = 0;
		
		List<RAttachment> originList = reviewDAO.selectRAttachmentList(review.getReno());
		
		totalResult = reviewDAO.updateReview(review);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new ReviewException("게시글 수정 실패!");
		
		if( originList.size() > 0) { 
			// 기존 첨부파일이 DB에 있다면
			totalResult = reviewDAO.deleteRAttachment(review.getReno());
			
			if(totalResult == 0) throw new ReviewException("첨부파일 삭제 실패!");
		}
		
		if( rattachList.size() > 0) {
			for(RAttachment ra : rattachList) {
				totalResult = reviewDAO.updateRAttachment(ra);
				
				if(totalResult == 0) throw new ReviewException("게시글 첨부파일 수정 실패!");
			}
		}
		return totalResult;
		
	}

	@Override
	public int deleteReview(int reno) {
		
		return reviewDAO.deleteReview(reno);
	}

	@Override
	public int deleteFile(int reno) {
		
		return reviewDAO.deleteFile(reno);
	}

}
