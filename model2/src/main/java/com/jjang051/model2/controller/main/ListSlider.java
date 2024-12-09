package com.jjang051.model2.controller.main;

import com.jjang051.model2.dao.VisualDao;
import com.jjang051.model2.dto.VisualDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/main/list")
public class ListSlider extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VisualDao visualDao = new VisualDao(req.getServletContext());
        List<VisualDto> visualDtoList = visualDao.getAllVisual();
        req.setAttribute("visualDtoList", visualDtoList);
        req.setAttribute("total", visualDtoList.size());
        req.getRequestDispatcher("/WEB-INF/main/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String checkList[] = req.getParameterValues("check");
        VisualDao visualDao = new VisualDao(req.getServletContext());
        int result = visualDao.getCheckedVisual(checkList);
        resp.sendRedirect("../index/index");
        /*
        for (int i = 0; i < checkList.length; i++) {
            System.out.print(checkList[i]+",");
        }
         */
    }
}
