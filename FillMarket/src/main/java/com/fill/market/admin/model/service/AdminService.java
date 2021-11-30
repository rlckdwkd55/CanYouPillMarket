package com.fill.market.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.admin.model.dao.AdminDAO;
import com.fill.market.admin.model.vo.Member;
import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.admin.model.vo.QNA;
import com.fill.market.admin.model.vo.QNARE;
import com.fill.market.order.model.vo.OrderList;


@Service
public class AdminService {

	@Autowired
	AdminDAO adminDAO;

	public List<Map<String, String>> selectProductList(int cPage, int numPerPage) {

		return adminDAO.selectProductList(cPage, numPerPage);
	}

	public int selectProductTotalContents() {

		return adminDAO.selectProductTotalContents();
	}

	public int insertProduct(Product product, List<PAttachment> attachList) {
		int productResult = adminDAO.insertBoard(product);

		// 첨부파일이 boardNo를 알 수 있는 방법
		// 1. BoardDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기 ( O )
		// 2. mapper 파일을 통해서 가장 최근에 추가된 게시글 번호 가져오기

		if (attachList.size() > 0) {
			// 첨부파일이 있을때만 실행해라

			for (PAttachment a : attachList) {
				int attachResult = adminDAO.insertAttachment(a);
				if (attachResult == 0)
					System.out.println("실패ㅠ");

			}
		}
		return productResult;

	}

	public Product selectOneProduct(int pno) {

		return adminDAO.selectOneProduct(pno);
	}

	public List<PAttachment> selectAttachment(int pno) {
		// TODO Auto-generated method stub
		return adminDAO.selectPAttachment(pno);
	}

	public int deleteFile(int attNo) {

		return adminDAO.deleteFile(attNo);
	}

	public int updateProduct(Product originPro, List<PAttachment> attachList) {

		int totalResult = 0;

		List<PAttachment> originList = adminDAO.selectPAttachment(originPro.getPno());

		totalResult = adminDAO.updateProduct(originPro);
		
		if (totalResult == 0)
			System.out.println("실패ㅠㅠ");

		if (originList.size() > 0) {
			// 기존 첨부파일이 DB에 있다면
			totalResult = adminDAO.deleteAttachment(originPro.getPno());

			if (totalResult == 0)
				System.out.println("첨부파일 삭제 실패ㅠㅠ");
		}
		if (attachList.size() > 0) {

			for (PAttachment a : attachList) {

				totalResult = adminDAO.updateAttachment(a);

				if (totalResult == 0)
					System.out.println("게시글 첨부파일 수정 실패ㅠㅠ");
			}
		}

		return totalResult;
	}

	public int deleteProdcut(int pno) {
		
		return adminDAO.deleteProduct(pno);
	}


	
	
	
	// ----------------------------------- 사용자 관리 ------------------------------------------- //
	public List<Map<String, String>> selectUserList(int cPage, int numPerPage) {

		return adminDAO.selectUserList(cPage, numPerPage);
	}

	public int selectUserTotalContents() {
		
		return adminDAO.selectUserTotalContents();
	}

	public Member adminSelectUser(String userid) {
		
		return adminDAO.adminSelectUser(userid);
	}

	public int userDelete(String userId) {
		
		return adminDAO.userDelete(userId);
	}

	public int userRes(String userId) {
	
		return adminDAO.userRes(userId);
	}

	
	
	
	
	
	
	// ------------------------------- 문의 게시판 --------------------------------------//
	public List<Map<String, String>> selectQNAList(int cPage, int numPerPage) {

		return adminDAO.selectQNAList(cPage, numPerPage);
	}

	public int selectQNATotalContents() {
		
		return adminDAO.selectQNATotalContents();
	}

	public QNA selectQNAView(int qano) {
		
		return adminDAO.selectQNAView(qano);
	}

	public List<QNARE> selectReply(int qano) {
		
		return adminDAO.selectReply(qano);
	}

	public QNARE inserReply(QNARE qna) {
		
		int result = adminDAO.insertReply(qna);
		
		if(result > 0) {
			
			return adminDAO.selectQNARE();
			
		}else {
			
			return qna;
		}
	
	}

	public int qnaDelete(int qano) {
		
		return adminDAO.deleteQNA(qano);
	}

	public List<Map<String, String>> selectNameUserList(int cPage, int numPerPage, String userName) {
		
		return adminDAO.selectNameUserList(cPage, numPerPage, userName);
	}

	public int selectUserNameTotalContents(String userName) {
		
		return adminDAO.selectUserNameTotalList(userName);
	}

	public Member selectAdmin(String userId) {
		
		return adminDAO.selectAdmin(userId);
	}

	public int adminMemoInsert(Map<String, String> memoVal) {
		
		return adminDAO.adminMemoInsert(memoVal);
	}

	public List<OrderList> selectOrderList(String userId) {
		
		return adminDAO.adminOrderList(userId);
	}

	public int selectOrderTotalContents(String userId) {
		// TODO Auto-generated method stub
		return adminDAO.selectOrderTotal(userId);
	}

	public int updateUserAuthor(Member member) {
		
		return adminDAO.updateUserAuthor(member);
	}

	public int memberCount() {
		
		return adminDAO.memberCount();
	}

	public int productCount() {
		
		return adminDAO.productCount();
	}

	public int qnaCount() {
		
		return adminDAO.qnaCount();
	}

	
	
}
