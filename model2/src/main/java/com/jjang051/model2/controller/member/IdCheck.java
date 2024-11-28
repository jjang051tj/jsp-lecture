package com.jjang051.model2.controller.member;

import com.google.gson.Gson;
import com.jjang051.model2.dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/id-check")
public class IdCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String userId = req.getParameter("userId");
        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.idCheck(userId);
        //key:value
        Map<String,Integer> countMap = new HashMap<String,Integer>();
        countMap.put("result", result);
        //String resultJson =  "{\"result\":" + result + "}";  //{"result":1}
        Gson gson = new Gson();
        String resultJson = gson.toJson(countMap);
        req.setAttribute("resultJson", resultJson);
        req.getRequestDispatcher("/WEB-INF/member/id-check.jsp").forward(req, resp);
    }
}
