package com.fill.market.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectOneMember(String userId) {
		
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDAO.deleteMember(userId);
	}

	@Override
	public Member memberFindId(Member m) {
		
		return memberDAO.memberFindId(m);
	}

	@Override
	public Member selectMemberID(Member member) {
		
		return memberDAO.selectMemberID(member);
	}

	@Override
	public int updateNewPass(Member m) {
		
		return memberDAO.updateNewPass(m);
	}

	@Override
	public String selectEmailCount(String email) {
		
		return memberDAO.selectEmailCount(email);
	}

	
		
	}
	
	
	



