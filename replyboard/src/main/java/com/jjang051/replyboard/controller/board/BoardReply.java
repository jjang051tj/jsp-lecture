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

@WebServlet("/board/reply")
public class BoardReply extends HttpServlet {
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
        ReplyBoardDto replyBoardDto =boardDao.getBoard(no);
        req.setAttribute("replyBoardDto", replyBoardDto);
        req.getRequestDispatcher("/WEB-INF/board/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao maxBoardDao = new BoardDao(req.getServletContext());
        ReplyBoardDto maxReplyBoardDto = ReplyBoardDto.builder()
                .regroup(Integer.parseInt(req.getParameter("regroup")))
                .relevel(Integer.parseInt(req.getParameter("relevel")))
                .build();
        maxBoardDao.updateRelevel(maxReplyBoardDto);
        BoardDao replyBoardDao = new BoardDao(req.getServletContext());
        ReplyBoardDto replyBoardDto =
                ReplyBoardDto.builder()
                        .title(req.getParameter("title"))
                        .content(req.getParameter("content"))
                        .password(req.getParameter("password"))
                        .userId(req.getParameter("userId"))
                        .userName(req.getParameter("userName"))
                        .regroup(Integer.parseInt(req.getParameter("regroup")))
                        .relevel(Integer.parseInt(req.getParameter("relevel"))+1)
                        .restep(Integer.parseInt(req.getParameter("restep"))+1)
                        .build();
        BoardDao boardDao = new BoardDao(req.getServletContext());
        int result = boardDao.replyBoard(replyBoardDto);
        if(result>0) {
            resp.sendRedirect("../board/list");
        } else {
            JSFunction.alertAndBack("오류", resp);
        }
    }
}
