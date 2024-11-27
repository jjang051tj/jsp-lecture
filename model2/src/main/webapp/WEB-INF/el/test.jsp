<%@ page import="com.jjang051.model2.dto.MemberDto" %>
<%@ page import="com.jjang051.model2.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-27
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDto loggedMemberDto = new MemberDto();
    loggedMemberDto.setUserId("jjang051");
    loggedMemberDto.setUserName("장성호");

    pageContext.setAttribute("scopeValue","페이지 영역");
    request.setAttribute("scopeValue","리퀘스트 영역");
    session.setAttribute("scopeValue","세션 영역");
    application.setAttribute("scopeValue","어플리케이션 영역");
    request.setAttribute("loggedMemberDto",loggedMemberDto);

    CookieManager.makeCookie(response,"cookieName", "1000",60*60);
%>
<html>
<head>
    <title>Title</title>
    <style>
        h2 {font-size:14px}
    </style>
</head>
<body>

    <h2>EL(expression language)로 출력하기</h2>
    <h2>${pageScope.scopeValue}</h2>
    <h2>${requestScope.scopeValue}</h2>
    <h2>${sessionScope.scopeValue}</h2>
    <h2>${applicationScope.scopeValue}</h2>
    <h2>${scopeValue}</h2>
    <hr>
    <h2>${param.age}</h2>
    <h2><%= request.getParameter("age")%></h2>
    <h2>${paramValues.inter[0]}</h2>
    <h2>${paramValues.inter[1]}</h2>
    <hr>
    <h2>${requestScope.loggedMemberDto.userId}</h2>
    <h2>${requestScope.loggedMemberDto.userName}</h2>
    <hr>
    <h2>${cookie.JSESSIONID.value}</h2>
    <h2>${cookie.cookieName.value}</h2>
    <hr>
    <h2>${header.host}</h2>
    <h2>${header["user-agent"]}</h2>
    <h2>${header.cookie}</h2>
    <h2>${pageContext.request.contextPath}</h2>
</body>
</html>
