package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/delete")
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberDto loggedMemberDto = (MemberDto) session.getAttribute("loggedMemberDto");

        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        //System.out.println("loggedMemberDto.getUserId()==="+loggedMemberDto.getUserId());
        //System.out.println("req.getParameter(\"userId\")==="+userId);
        //System.out.println("req.getParameter(\"userPw\")==="+userPw);
        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.deleteMember(userId,userPw);
        if(result>0) {
            session.invalidate();
            JSFunction.alertAndLocation("회원탈퇴되었습니다.", "../index/index", resp);
        } else {
            JSFunction.alertAndBack("아이디 패스워드 확인해주세요.",  resp);
        }
    }
}
