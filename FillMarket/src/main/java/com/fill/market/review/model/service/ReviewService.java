package com.fill.market.review.model.service;

import java.util.List;
import java.util.Map;

import com.fill.market.board.model.vo.Board;
import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

public interface ReviewService {
	
	List<Map<String, String>> selectReviewList(int cPage, int numPerPage);

	int selectReviewTotalContents();

	int insertReview(Review review, List<RAttachment> rattachList);

	Review selectOneReview(int reno);

	List<RAttachment> selectRAttachmentList(int reno);

	Review updateView(int reno);
	
	int updateReview(Review review, List<RAttachment> rattachList);
	
	int deleteReview(int reno);

	int deleteFile(int attNo);

}
