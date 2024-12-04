package com.jjang051.review;

import com.jjang051.review.dao.FaqDao;
import com.jjang051.review.dto.FaqDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class FaqList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FaqDao faqDao = new FaqDao(req.getServletContext());
        List<FaqDto> faqList = faqDao.getFaqList();
        req.setAttribute("faqList", faqList);
        req.getRequestDispatcher("/WEB-INF/list.jsp").forward(req, resp);
    }
}
