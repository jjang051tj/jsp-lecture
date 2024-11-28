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

@WebServlet("/member/member-info-change")
public class MemberInfoChange extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/member-info-change.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String zipcode = req.getParameter("zipcode");
        String addr01 = req.getParameter("addr01");
        String addr02 = req.getParameter("addr02");
        String tel = req.getParameter("tel");

        MemberDto changeMemberDto = new MemberDto();
        changeMemberDto.setUserId(userId);
        changeMemberDto.setUserPw(userPw);
        changeMemberDto.setUserName(userName);
        changeMemberDto.setUserEmail(userEmail);
        changeMemberDto.setZipcode(zipcode);
        changeMemberDto.setAddress(addr01+"/"+addr02);
        changeMemberDto.setTel(tel);

        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.updateMember(changeMemberDto);
        if(result>0) {
            HttpSession session = req.getSession();
            session.invalidate();
            JSFunction.alertAndLocation("회원정보 변경되었습니다. 다시 로그인 해주세요.", "../member/login",resp);
        } else {
            JSFunction.alertAndBack("알 수 없는 오류가 발생되었습니다. 다시 입력해 주세요..", resp);
        }
    }
}
