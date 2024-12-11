package com.jjang051.replyboard.controller.member;

import com.jjang051.replyboard.dao.MemberDao;
import com.jjang051.replyboard.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/signup")
@MultipartConfig
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDao memberDao = new MemberDao();
        MemberDto memberDto =
                MemberDto.builder()
                        .userId(req.getParameter("userId"))
                        .userName(req.getParameter("userName"))
                        .userPw(req.getParameter("userPw"))
                        .address(req.getParameter("addr01")+"-"+req.getParameter("addr02"))
                        .tel(req.getParameter("tel"))
                        .userEmail(req.getParameter("userEmail"))
                        .zipcode(Integer.parseInt(req.getParameter("zipcode")))
                        .originalProfile("originalProfile")
                        .renameProfile("renameProfile")
                        .build();
        memberDao.insertMember(memberDto);
    }
}
