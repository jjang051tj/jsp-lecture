package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/signup")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/member/signup.jsp");
        dispatcher.forward(req, resp);
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

        MemberDto insertMemberDto = new MemberDto();
        insertMemberDto.setUserId(userId);
        insertMemberDto.setUserPw(userPw);
        insertMemberDto.setUserName(userName);
        insertMemberDto.setUserEmail(userEmail);
        insertMemberDto.setZipcode(zipcode);
        insertMemberDto.setAddress(addr01+"/"+addr02);
        insertMemberDto.setTel(tel);

        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.insertMember(insertMemberDto);
        if(result>0) {
            JSFunction.alertAndLocation("회원가입되었습니다. 로그인 페이지로 이동합니다.", "../member/login",resp);
        } else {
            JSFunction.alertAndBack("알 수 없는 오류가 발생되었습니다. 다시 입력해 주세요..", resp);
        }
    }
}
