<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-22
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="insert-member-process.jsp" method="post">
        <div><label>아이디</label><input type="text" name="userId"><button>아이디 중복체크</button></div>
        <div><label>패스워드</label><input type="password" name="userPw"></div>
        <div><label>이름</label><input type="text" name="userName"></div>
        <div><label>이메일</label><input type="text" name="userEmail"></div>
        <div><label>우편번호</label><input type="text" name="zipcode"></div>
        <div><label>주소</label><input type="text" name="add01"></div>
        <div><label>상세주소</label><input type="text" name="add02"></div>
        <div><label>전화번호</label><input type="text" name="tel"></div>
        <div><button>회원가입</button></div>
    </form>
</body>
</html>



