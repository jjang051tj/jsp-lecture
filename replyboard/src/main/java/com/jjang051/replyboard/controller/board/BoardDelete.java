package com.jjang051.replyboard.controller.board;

import com.jjang051.replyboard.dao.BoardDao;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete")
public class BoardDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/board/delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao(req.getServletContext());
        if(req.getParameter("parentId")!=null && !req.getParameter("parentId").equals("")){
            int parentId =  Integer.parseInt(req.getParameter("parentId"));
            int no =  Integer.parseInt(req.getParameter("no"));
            String password = req.getParameter("password");
            ReplyBoardDto replyBoardDto = ReplyBoardDto.builder()
                    .no(no)
                    .password(password)
                    .parentId(parentId)
                    .build();
            boardDao.hardDeleteBoard(replyBoardDto);
            resp.sendRedirect("../board/list");
        } else {
            int no =  Integer.parseInt(req.getParameter("no"));
            String password = req.getParameter("password");
            ReplyBoardDto replyBoardDto = new ReplyBoardDto();
            replyBoardDto.setNo(no);
            replyBoardDto.setPassword(password);
            if(boardDao.softDeleteBoard(replyBoardDto)>0) {
                resp.sendRedirect("../board/list");
            }
        }
    }
}
