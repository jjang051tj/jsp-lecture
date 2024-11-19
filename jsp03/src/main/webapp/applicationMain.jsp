<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String useImplicitObject() {
        //jsp에서 사용되는
        return this.getServletContext().getRealPath("/jsp03_war_exploded");
    }
    public String useImplicitObject(ServletContext servletContext) {
        //jsp에서 사용되는
        return servletContext.getRealPath("/jsp03_war_exploded");
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>web.xml에 정의된 내용 읽기</h2>
<h3>초기화 변수 : <%= application.getInitParameter("INIT_PARAM")  %></h3>
<h2>Admin info</h2>
<h3>
    admin_id : <%= application.getInitParameter("ADMIN_ID") %> <br>
    admin_pw : <%= application.getInitParameter("ADMIN_PW") %>
</h3>
<h2>서버의 물리적 경로</h2>
<h3><%= application.getRealPath("/jsp03_war_exploded")  %></h3>
<h3><%= useImplicitObject() %></h3>
<h3><%= useImplicitObject(application) %></h3>
<a href="aaa.jsp">없는 페이지 가기</a>
</html>
