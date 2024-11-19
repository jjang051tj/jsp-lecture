<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
   public int add(int num01,int num02) {
       return num01 + num02;
   }
%>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    System.out.println(userId+"==="+userPw);
    int result01 = add(10,20);
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<h2><% out.println(userId); %></h2>
<h2><%= userId %></h2>
<h2><%= result01 %></h2>
<h2><%= add(100,200) %></h2>
<h2><% out.println(add(300,400)); %></h2>
<%
    if(userId.equals("jjang051")&&userPw.equals("1234")) {
        out.println("<h2>로그인 되었습니다.</h2>");
    } else {
        out.println("<h2>아이디 패스워드 확인해 주세요,</h2>");
    }
%>
<h2>클라이언트(요청 resuest)/서버(응답 response) 프로그래밍</h2>

</body>
</html>