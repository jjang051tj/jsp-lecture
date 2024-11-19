<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String error = request.getParameter("error");
        if(error!=null) {
            out.println("아이디 패스워드 확인해 주세요.");
        }
    %>

    <form action="responseLogin.jsp" method="post">
        <div>아이디 : <input type="text" name="userId"></div>
        <div>패스워드 : <input type="password" name="userPw"></div>
        <div><button>로그인</button></div>
    </form>
    <hr>
    <h2>응답 헤더 설정</h2>
    <form action="responseHeader.jsp" method="get">
        <div>
            <label><span>날짜</span><input type="text" value="2024-11-19 11:30" name="addDate"> </label>
        </div>
        <div>
            <label><span>숫자</span><input type="text" value="88" name="addInt"> </label>
        </div>
        <div>
            <label><span>문자</span><input type="text" value="홍길동" name="addString"> </label>
        </div>
        <div><button>응답헤더 설정 및 출력</button></div>
    </form>
</body>
</html>
