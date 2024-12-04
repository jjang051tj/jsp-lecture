<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-04
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="file-upload" method="post" enctype="multipart/form-data">
    <div><input type="text" name="title"></div>
    <div><input type="file" name="attachFile"></div>
    <div><button>등록</button></div>
  </form>
</body>
</html>
