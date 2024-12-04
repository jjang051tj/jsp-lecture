package com.jjang051.review;

import com.jjang051.review.dao.FaqDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/faq")
public class Faq extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/faq.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String question = req.getParameter("question");
        String answer = req.getParameter("answer");
        FaqDao faqDao = new FaqDao(req.getServletContext());
        int result = faqDao.writeFaq(question, answer);
        if(result > 0) {
            resp.sendRedirect("./list");
        }
    }
}
