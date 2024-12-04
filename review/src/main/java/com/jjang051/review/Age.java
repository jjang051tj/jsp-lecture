package com.jjang051.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/age")
public class Age extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int age = Integer.parseInt(req.getParameter("age"));
        String result = "";
        if(age>20) {
            result="성인";
        } else {
            result="미성년자";
        }
        req.setAttribute("result",result);
        req.getRequestDispatcher("/WEB-INF/age.jsp").forward(req, resp);
    }
}
