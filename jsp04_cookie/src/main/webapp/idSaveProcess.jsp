<%@ page import="com.jjang051.jsp04_cookie.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-20
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String saveIdCheck= request.getParameter("saveIdCheck");
    System.out.println("userId : "+userId+",userPw : "+userPw+",saveIdCheck : "+saveIdCheck);
    if(userId.equals("jjang051")&&userPw.equals("1234")){
        if(saveIdCheck!=null && saveIdCheck.equals("yes")) {
            /*
            Cookie cookie = new Cookie("loginId",userId);
            cookie.setPath(request.getContextPath());
            cookie.setMaxAge(60*60*24*30);
            response.addCookie(cookie);
            */
            CookieManager.makeCookie(response,"loginId",userId,60*60*24);

        } else {
            /*
            Cookie cookie = new Cookie("loginId",userId);
            cookie.setPath(request.getContextPath());
            cookie.setMaxAge(0);
            response.addCookie(cookie);
             */
            CookieManager.deleteCookie(response,"loginId");
        }
        out.println("<script>alert(\"로그인 되었습니다.\");location.href=\"idSaveMain.jsp\";</script>");
    } else {
        out.println("<script>alert(\"아이디 패스워드 확인해 주세요.\");location.href=\"idSaveMain.jsp\";</script>");
    }
%>