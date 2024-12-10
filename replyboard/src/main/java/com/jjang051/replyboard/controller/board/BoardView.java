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

@WebServlet("/board/view")
public class BoardView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao(req.getServletContext());
        int no=0;
        //int no =  req.getParameter("no")==null?0:Integer.parseInt(req.getParameter("no"));
        String strNo = req.getParameter("no");
        if(strNo == null || "".equals(strNo)){
            JSFunction.alertAndLocation("해당하는 페이지가 없습니다.", "../board/list",resp);
        } else {
            no =  Integer.parseInt(req.getParameter("no"));
        }
        int num =  Integer.parseInt(req.getParameter("num"));
        ReplyBoardDto replyBoardDto =boardDao.getBoard(no);
        BoardDao prevBoardDao = new BoardDao(req.getServletContext());
        ReplyBoardDto prevReplyBoardDto = prevBoardDao.getPrevNextSelect(num-1);
        BoardDao nextBoardDao = new BoardDao(req.getServletContext());
        ReplyBoardDto nextReplyBoardDto = nextBoardDao.getPrevNextSelect(num+1);
        req.setAttribute("prevReplyBoardDto", prevReplyBoardDto);
        req.setAttribute("nextReplyBoardDto", nextReplyBoardDto);
        req.setAttribute("replyBoardDto", replyBoardDto);
        req.getRequestDispatcher("/WEB-INF/board/view.jsp").forward(req, resp);
    }
}
