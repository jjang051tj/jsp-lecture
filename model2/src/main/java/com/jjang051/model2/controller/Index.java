package com.jjang051.model2.controller;

import com.jjang051.model2.dao.VisualDao;
import com.jjang051.model2.dto.VisualDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/index/index")
public class Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VisualDao visualDao = new VisualDao(req.getServletContext());
        List<VisualDto> visualDtoList = visualDao.getCheckedAllVisual();
        req.setAttribute("visualDtoList", visualDtoList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/index/index.jsp");
        dispatcher.forward(req, resp);
//        String checkList[] = req.getParameterValues("check");
//        VisualDao visualDao = new VisualDao(req.getServletContext());
//        List<VisualDto> visualDtoList = visualDao.getCheckedVisual(checkList);
//        req.setAttribute("visualDtoList", visualDtoList);
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/index/index.jsp");
//        dispatcher.forward(req, resp);
    }
}
