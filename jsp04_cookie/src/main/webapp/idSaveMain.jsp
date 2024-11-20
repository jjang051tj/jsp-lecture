<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-20
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie cookies[] = request.getCookies();
    String saveLoginId = "";
    if(cookies!=null) {
        for(Cookie c: cookies) {
            String cookieName = c.getName();
            String cookieValue =  c.getValue();
            if(cookieName.equals("loginId")) {
                saveLoginId = cookieValue;
            }
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <form action="idSaveProcess.jsp" method="post">
        <div><label><span>아이디</span><input type="text" name="userId" value="<%=saveLoginId%>"></label></div>
        <div><label><span>패스워드</span><input type="password" name="userPw"></label></div>
        <div><label><input type="checkbox" name="saveIdCheck" value="yes" checked><span>아이디 저장하기</span></label></div>
        <div><button>로그인</button></div>
    </form>
</body>
</html>
