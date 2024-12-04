<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-04
  Time: 오전 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
<table>
    <tr><td>${num}x1=${num*1}</td></tr>
    <tr><td>${num}x2=${num*2}</td></tr>
    <tr><td>${num}x3=${num*3}</td></tr>
    <tr><td>${num}x4=${num*4}</td></tr>
    <tr><td>${num}x5=${num*5}</td></tr>
    <tr><td>${num}x6=${num*7}</td></tr>
    <tr><td>${num}x7=${num*7}</td></tr>
    <tr><td>${num}x9=${num*8}</td></tr>
    <tr><td>${num}x9=${num*9}</td></tr>
</table>
--%>

<form action="" method="get">
    <input type="text" name="num" placeholder="출력할 구구단을 적어주세요.">
    <button>출력요청</button>
</form>

<table>
    <c:forEach begin="1" end="9" var="i">
        <tr><td>${num}x${i}=${num*i}</td></tr>
    </c:forEach>
</table>
</body>
</html>
