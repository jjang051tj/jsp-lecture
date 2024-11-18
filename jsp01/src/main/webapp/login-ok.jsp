<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> 
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");
    String message = "";
    if(userId.equals("jjang051")&&userPw.equals("1234")) { 
        message = "alert('"+userName+"님 안녕하세요.');location.href='index.jsp'";
    } else {
        message = "alert('아이디 패스워드 확인해 주세요');history.back();";
    }
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>제목</title>
  </head>
  <body>
    <script>
        <%
            out.println(message);
        %>
    </script>
  </body>
</html>
