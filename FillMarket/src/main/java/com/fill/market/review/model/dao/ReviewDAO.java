package com.fill.market.review.model.dao;

import java.util.List;
import java.util.Map;

import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

public interface ReviewDAO {

	List<Map<String, String>> selectReviewList(int cPage, int numPerPage);

	int selectReviewTotalContents();

	int insertReview(Review review);

	int insertRAttachment(RAttachment ra);

	Review selectOneReview(int reno);

	List<RAttachment> selectRAttachmentList(int reno);
	
	int updateReview(Review review);

	int updateRAttachment(RAttachment ra);

	int deleteReview(int reno);

	int deleteRAttachment(int reno);

	int deleteFile(int attNo);
	
}
