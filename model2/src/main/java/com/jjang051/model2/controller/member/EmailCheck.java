package com.jjang051.model2.controller.member;

import com.google.gson.Gson;
import com.jjang051.model2.controller.Index;
import com.jjang051.model2.dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/email-check")
public class EmailCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");
        MemberDao memberDao = new MemberDao(request.getServletContext());
        int result = memberDao.emailCheck(userEmail);
        Map<String, Integer> countMap = new HashMap<String, Integer>();
        countMap.put("result",result);
        Gson gson = new Gson();
        String resultJson = gson.toJson(countMap);
        request.setAttribute("resultJson", resultJson);
        request.getRequestDispatcher("/WEB-INF/member/email-check.jsp").forward(request, response);
    }
}
