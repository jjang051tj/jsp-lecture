package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dto.BoardDto;
import com.jjang051.model2.utils.JSFunction;
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
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String userId = req.getParameter("userId");
        String userName = req.getParameter("userName");
        BoardDao boardDao = new BoardDao(req.getServletContext());
        BoardDto boardDto = new BoardDto();
        boardDto.setTitle(title);
        boardDto.setContent(content);
        boardDto.setUserId(userId);
        boardDto.setUserName(userName);
        int result = boardDao.writeBoard(boardDto);
        if (result > 0) {
            JSFunction.alertAndLocation("글이 입력되었습니다.", "../board/list",resp);
        } else {
            JSFunction.alertAndBack("알 수 없는 오류로 글이 입력되지 않았습니다. 잠시 후 다시 시도해 주새요.", resp);
        }
    }
}
