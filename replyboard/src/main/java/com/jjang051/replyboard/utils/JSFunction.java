package com.jjang051.replyboard.utils;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JSFunction {
    //1. 경고창만 띄우기
    //2. 경고창 띄우고 뒤로 돌아가기
    //3. 경고창 띄우고 특정 페이지도 가기.
    public static void alert(String msg, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8"); //한글깨짐 방지
        try {
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\");</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void alertAndBack(String msg, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8"); //한글깨짐 방지
        try {
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\");history.back();</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void alertAndLocation(String msg,String url, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8"); //한글깨짐 방지
        try {
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\");location.href=\""+url+"\";</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}