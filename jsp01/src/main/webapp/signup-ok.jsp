<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userEmail = request.getParameter("userEmail");
    String hobbies[] = request.getParameterValues("hobbies");
    String strHobbies = "";
    for(int i=0;i<hobbies.length;i++) {
        strHobbies+=hobbies[i]+",";
    }
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제목</title>
</head>
<body>
    <ul>
        <li>아이디 : <%= userId %></li>
        <li>아이디 : <% out.println(userId); %></li>
        <li>패스워드 : <%= userPw %></li>
        <li>이메일 : <%= userEmail %></li>
        <li>취미 : <%= strHobbies %></li>

    </ul>
</body>
</html>