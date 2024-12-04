package com.jjang051.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/biman")
public class Biman extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double height = Double.parseDouble(req.getParameter("height"));   //"180"
        double weight = Double.parseDouble(req.getParameter("weight"));   //"88"
        height = height/100;
        double bmi =  weight/(height*height);
        String result = "";
        if(bmi<18.5) {
            result = "저체중";
        } else if(bmi>25) {
            result="비만";
        }else {
            result="정상";
        }
        req.setAttribute("result", result);
        req.setAttribute("bmi", bmi);
        req.getRequestDispatcher("/WEB-INF/biman.jsp").forward(req, resp);
    }
}
