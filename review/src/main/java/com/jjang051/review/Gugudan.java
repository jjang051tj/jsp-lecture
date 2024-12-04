package com.jjang051.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/gugudan")
public class Gugudan extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num =  req.getParameter("num")==null ? 1 : Integer.parseInt(req.getParameter("num"));
        req.setAttribute("num", num);
        req.getRequestDispatcher("/WEB-INF/gugudan.jsp").forward(req, resp);
        /*
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Title</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<table>");
        for (int i = 1; i < 10; i++) {
            out.println("<tr><td>" + num + "x"+i+"="+(num * i) + "</td></tr>");
        }
        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
         */

    }
}
