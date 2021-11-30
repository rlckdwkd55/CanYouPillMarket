package com.fill.market.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage, int cno) {
		RowBounds rows = new RowBounds((cPage - 1 )* numPerPage, numPerPage);
		
		return sqlSession.selectList("productSQL.selectProductList", cno, rows);
	}

	@Override
	public int selectProductTotalContents(int cno) {
		
		return sqlSession.selectOne("productSQL.selectProductTotalContents", cno);
	}


	@Override
	public Product selectOneProduct(int pno) {
		
		return sqlSession.selectOne("productSQL.selectOneProduct", pno);
	}

	@Override
	public List<PAttachment> selectPAttachmentList(int pno) {
		
		return sqlSession.selectList("productSQL.selectPAttachmentList", pno);
	}

	@Override
	public Review selectOneReview(int pno) {
		
		return sqlSession.selectOne("productSQL.selectOneReview", pno);
	}

	@Override
	public RAttachment selectRAttachment(int reno) {
		
		return sqlSession.selectOne("productSQL.selectRAttachment", reno);
	}

	@Override
	public List<Review> selectReviewList(int pno) {
		
		return sqlSession.selectList("productSQL.selectReviewList", pno);
	}

	@Override
	public Product selectProduct(String pList) {
		
		return sqlSession.selectOne("productSQL.selectProduct", pList);
	}

	@Override
	public List<Product> selectSearch(int cPage, int numPerPage, Product pro) {
		
		RowBounds rows = new RowBounds((cPage - 1 )* numPerPage, numPerPage);
		
		return sqlSession.selectList("productSQL.selectSearch", pro, rows);
	}

	
	@Override
	public int selectAllSearch(Product pro) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productSQL.selectAllSearch", pro);
	}

}
