package com.jjang051.replyboard.controller.board;

import com.jjang051.replyboard.dao.BoardDao;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import com.jjang051.replyboard.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/write")
public class BoardWrite extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/board/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao maxBoardDao = new BoardDao(req.getServletContext());
        int maxRegroup = maxBoardDao.getMaxRegroup();  //0
        ReplyBoardDto replyBoardDto =
                ReplyBoardDto.builder()
                        .title(req.getParameter("title"))
                        .content(req.getParameter("content"))
                        .password(req.getParameter("password"))
                        .regroup(maxRegroup+1)
                        .userId(req.getParameter("userId"))
                        .userName(req.getParameter("userName"))
                        .build();
        BoardDao boardDao = new BoardDao(req.getServletContext());
        int result = boardDao.writeBoard(replyBoardDto);
        if(result>0) {
            resp.sendRedirect("../board/list");
        } else {
            JSFunction.alertAndBack("오류", resp);
        }
    }
}
