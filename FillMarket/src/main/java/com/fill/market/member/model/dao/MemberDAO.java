package com.fill.market.member.model.dao;

import com.fill.market.admin.model.vo.Member;

public interface MemberDAO {

	/**
	 * 회원가입 기능 구현 메소드 
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	/**
	 * 로그인 기능 구현 메소드 
	 * @param userId
	 * @return
	 */
	Member selectOneMember(String userId);

	int updateMember(Member member);

	int deleteMember(String userId);

	Member memberFindId(Member m);

	Member selectMemberID(Member member);

	int updateNewPass(Member m);

	String selectEmailCount(String email);

	
	
	
	
}
