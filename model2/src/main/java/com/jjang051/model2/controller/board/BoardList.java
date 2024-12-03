package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dto.BoardDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/list")
public class BoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao(req.getServletContext());
        BoardDao pageBoardDao = new BoardDao(req.getServletContext());
        int listPerPage = 10; // 한번에 보여지는 게시글 수
        int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
        // 클라이언트에서 넘어오는 페이지 수 즉 몇번 페이지네이션을 보여달라 1 ==  1~10, 2 == 21~30, 3 == 31~40
        int total = pageBoardDao.getTotalCount(); // 전체 게시글 수
        int serverStartPage = (page - 1) * listPerPage + 1;  // 서버에서 db로 가는 계산된 페이지  between 시작 되는 수
        int serverEndPage = page * listPerPage;           // 서버에서 db로 가는 계산된 페이지  between 끝나는 수

        int listPerPagination = 5; // 아래쪽 페이지네이션에 한번에 보여지는 수
        int totalPagination = (int) Math.ceil((double) total / listPerPage);   //  전체 페이지네이션의 수

        System.out.println("total===" + total + " / totalPagination===" + totalPagination);

        int serverStartPagination = ((page - 1) / listPerPagination) * listPerPagination + 1;  //1~5 =  1 , 6~10  =  6, 11~15 = 11
        int serverEndPagination = serverStartPagination + listPerPagination - 1;
        int serverNextPagination = serverStartPagination + listPerPagination;
        if (serverNextPagination >= totalPagination) {
            serverNextPagination = totalPagination;

        }
        if (serverEndPagination >= totalPagination) {
            serverEndPagination = totalPagination;
        }

        List<BoardDto> boardList = boardDao.getPageBoard(serverStartPage, serverEndPage);
        req.setAttribute("boardList", boardList); //Collection
        req.setAttribute("total", total);

        //req.setAttribute("totalPagination", totalPagination);
        req.setAttribute("serverStartPagination", serverStartPagination); //1 == 1~5 , 2 == 6~10
        req.setAttribute("serverEndPagination", serverEndPagination);
        req.setAttribute("serverNextPagination", serverNextPagination);


        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
