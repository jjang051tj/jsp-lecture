<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-20
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String strOneday = request.getParameter("oneday");
    if(strOneday!=null) {
        int oneday =  Integer.parseInt(request.getParameter("oneday"));
        System.out.println("oneday==="+oneday);
        if(oneday==1) {
            //오늘 하루 이창을 열지 않겠다고 체크한 상태
            Cookie onedayCookie = new Cookie("onedayCookie","off");
            onedayCookie.setPath(request.getContextPath());
            onedayCookie.setMaxAge(60*60*24);
            response.addCookie(onedayCookie);
        }
    }
    response.sendRedirect("popupMain.jsp");
    //client에서 서버로 데이터 전달방법
    //1. form
    //2. ajax
%>
