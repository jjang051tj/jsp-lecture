package com.jjang051.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/hi")
public class HiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("name", "장동건");
        String clientName = req.getParameter("clientName");
        String changeName="";
        if(clientName.equals("정형돈")) {
            changeName="개그맨 정형돈";
        } else if(clientName.equals("정우성")) {
            changeName="영화배우 정우성";
        } else {
            changeName="일반인 "+clientName;
        }
        req.setAttribute("name", "~~m^^m~~"+changeName);
        req.getRequestDispatcher("/WEB-INF/hi.jsp").forward(req, resp);  // 템플릿 view
    }
}
