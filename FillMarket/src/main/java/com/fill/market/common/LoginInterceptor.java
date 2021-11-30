package com.fill.market.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fill.market.admin.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		Member loginMember = (Member) session.getAttribute("member");

		if (loginMember == null) {
			System.out.println("비 로그인 상태에서 접근 시도 : " + request.getRequestURI());

			request.setAttribute("loc", "/member/memberLogin.do");
			request.setAttribute("msg", "로그인 후 이용해 주세요");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

			return false;
		}
		/*
		if (loginMember.getLevelType() != 2) {
			System.out.println("비 로그인 상태에서 접근 시도 : " + request.getRequestURI());

			request.setAttribute("loc", "/");
			request.setAttribute("msg", "당신은 관리자가 아닙니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

			return false;
		}*/

		return super.preHandle(request, response, handler);

	}

}
