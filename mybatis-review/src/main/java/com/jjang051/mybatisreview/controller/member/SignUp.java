package com.jjang051.mybatisreview.controller.member;

import com.jjang051.mybatisreview.dao.MemberDao;
import com.jjang051.mybatisreview.dto.ErrorDto;
import com.jjang051.mybatisreview.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/signup")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        String userEmail = req.getParameter("userEmail");
        String addr01 = req.getParameter("addr01");
        String addr02 = req.getParameter("addr02");
        String tel = req.getParameter("tel");
        String zipcode = req.getParameter("zipcode");
        String userName = req.getParameter("userName");

        MemberDto signupMemberDto =
                MemberDto.builder()
                        .userId(userId)
                        .userName(userPw)
                        .userEmail(req.getParameter("userEmail"))
                        .tel(req.getParameter("tel"))
                        .zipcode(req.getParameter("zipcode"))
                        .userPw(req.getParameter("userPw"))
                        .address(req.getParameter("addr01")+"-"+req.getParameter("addr02"))
                        .build();
        boolean hasError = false;
        ErrorDto errorDto = new ErrorDto();
        Map<String, String> errorMap = new HashMap<>();
        if(userId.isBlank() || userId==null){
            hasError = true;
            errorMap.put("userId", "아이디는 필수입력사항입니다.");
        }
        if(userPw.isBlank() || userPw==null){
            hasError = true;
            errorMap.put("userPw", "패스워드는 필수입력사항입니다.");
        }
        if(userEmail.isBlank() || userEmail==null){
            hasError = true;
            errorMap.put("userEmail", "이메일은 필수입력사항입니다.");
        }
        if(userName.isBlank() || userName==null){
            hasError = true;
            errorMap.put("userName", "이름은 필수입력사항입니다.");
        }
        if(hasError) {
            req.setAttribute("errorMap", errorMap);
            req.setAttribute("signupMemberDto", signupMemberDto);
            req.getRequestDispatcher("/WEB-INF/member/signup.jsp").forward(req, resp);
        }

        MemberDao memberDao = new MemberDao();
        int result = memberDao.signupMember(signupMemberDto);


        if (result > 0) {
            resp.sendRedirect("../member/login");
        }
    }
}
