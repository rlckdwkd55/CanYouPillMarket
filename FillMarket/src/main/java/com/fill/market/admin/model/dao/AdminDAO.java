package com.fill.market.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.admin.model.vo.QNA;
import com.fill.market.admin.model.vo.QNARE;
import com.fill.market.order.model.vo.OrderList;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Map<String, String>> selectProductList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		return sqlSession.selectList("adminSQL.selectProductList", null, rows);
	}

	public int selectProductTotalContents() {
		
		return sqlSession.selectOne("adminSQL.selectProductTotalContents");
	}

	public int insertBoard(Product product) {
		
		return sqlSession.insert("adminSQL.insertProduct", product);
	}

	public int insertAttachment(PAttachment a) {
		
		return sqlSession.insert("adminSQL.insertPAttachment", a);
	}

	public Product selectOneProduct(int pno) {
		
		return sqlSession.selectOne("adminSQL.selectOneProduct", pno);
	}

	public List<PAttachment> selectPAttachment(int pno) {
		
		return sqlSession.selectList("adminSQL.selectListAttch", pno);
	}

	public int deleteFile(int attNo) {
		
		return sqlSession.delete("adminSQL.deleteFile", attNo);
	}

	public int updateProduct(Product originPro) {
		
		return sqlSession.update("adminSQL.updateProduct", originPro);
	}

	public int deleteAttachment(int pno) {
		
		return sqlSession.delete("adminSQL.deleteAttachment", pno);
	}

	public int updateAttachment(PAttachment a) {

		
		return sqlSession.insert("adminSQL.updateAttachment", a);
	}

	public int deleteProduct(int pno) {
		
		return sqlSession.delete("adminSQL.deleteProdcut", pno);
	}
	
	
	
	
	
	
	
	
	
	
	// ------------------------------------ 사용자 관리 --------------------------------------------- //

	public List<Map<String, String>> selectUserList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		return sqlSession.selectList("adminSQL.selectUserList", null, rows);
	}

	public int selectUserTotalContents() {
		
		return sqlSession.selectOne("adminSQL.selectUserTotalContents");

	}

	public Member adminSelectUser(String userid) {
		
		return sqlSession.selectOne("adminSQL.selectUser", userid);
	}

	public int userDelete(String userId) {
		
		return sqlSession.update("adminSQL.userDelete",userId);
	}

	public int userRes(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminSQL.userRes",userId);
	}

	
	
	
	
	
	
	
	
	
	
	// ------------------------------- 문의 게시판 --------------------------------------------- //
	
	public List<Map<String, String>> selectQNAList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("adminSQL.selectQNAList", null, rows);
	}

	public int selectQNATotalContents() {
		
		return sqlSession.selectOne("adminSQL.selectQNATotalContents");
	}

	public QNA selectQNAView(int qano) {
		
		return sqlSession.selectOne("adminSQL.selectQNAView", qano);
	}

	public List<QNARE> selectReply(int qano) {
		
		return sqlSession.selectList("adminSQL.selectReply", qano);
	}

	public int insertReply(QNARE qna) {
		
		return sqlSession.insert("adminSQL.insertReply", qna);
	}


	public QNARE selectQNARE() {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("adminSQL.selectQNARE");
	}

	public int deleteQNA(int qano) {
		
		return sqlSession.delete("adminSQL.deleteQNA", qano);
	}

	public List<Map<String, String>> selectNameUserList(int cPage, int numPerPage, String userName) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("adminSQL.selectUserNameList", userName, rows);
	}

	public int selectUserNameTotalList(String userName) {
		
		return sqlSession.selectOne("adminSQL.selectUserNameTotalList", userName);
	}

	public Member selectAdmin(String userId) {
		
		return sqlSession.selectOne("adminSQL.selectAdmin", userId);
	}

	public int adminMemoInsert(Map<String, String> memoVal) {
		
		return sqlSession.insert("adminMemoInsert", memoVal);
	}

	public List<OrderList> adminOrderList(String userId) {
		
		return sqlSession.selectList("adminOrderList",userId);
	}

	public int selectOrderTotal(String userId) {
		
		return sqlSession.selectOne("selectOrderTotal", userId);
	}

	public int updateUserAuthor(Member member) {
		
		return sqlSession.update("updateUserAuthor", member);
	}

	public int memberCount() {
		
		return sqlSession.selectOne("memberCount");
	}

	public int productCount() {
		
		return sqlSession.selectOne("productCount");
	}

	public int qnaCount() {
		
		return sqlSession.selectOne("qnaCount");
	}



	


}
