package com.jjang051.model2.controller.el;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/el/test")
public class El extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath()+"/el/test.jsp");
//        dispatcher.forward(req, resp);
        req.getRequestDispatcher("/WEB-INF/el/test.jsp").forward(req, resp);
    }
}
