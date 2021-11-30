package com.fill.market.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.product.model.dao.ProductDAO;
import com.fill.market.review.model.vo.RAttachment;
import com.fill.market.review.model.vo.Review;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage, int cno) {
		
		return productDAO.selectProductList(cPage, numPerPage, cno);
	}

	@Override
	public int selectProductTotalContents(int cno) {
		
		return productDAO.selectProductTotalContents(cno);
	}


	@Override
	public Product selectOneProduct(int pno) {
		
		return productDAO.selectOneProduct(pno);
	}

	@Override
	public List<PAttachment> selectPAttachmentList(int pno) {
		
		return productDAO.selectPAttachmentList(pno);
	}

	@Override
	public Review selectOneReview(int pno) {
		
		return productDAO.selectOneReview(pno);
	}

	@Override
	public RAttachment selectRAttachment(int reno) {
		
		return productDAO.selectRAttachment(reno);
	}

	@Override
	public List<Review> selectReviewList(int pno) {
		
		return productDAO.selectReviewList(pno);
	}

	@Override
	public Product selectProduct(String pList) {
		
		return productDAO.selectProduct(pList);
	}

	@Override
	public List<Product> selectSearch(int cPage, int numPerPage, Product pro) {
		
		return productDAO.selectSearch(cPage, numPerPage, pro);
	}


	@Override
	public int selectAllSearch(Product pro) {
		// TODO Auto-generated method stub
		return productDAO.selectAllSearch(pro);
	}


}
