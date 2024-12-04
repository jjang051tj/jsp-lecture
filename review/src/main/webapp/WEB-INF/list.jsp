<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-04
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>faq</h1>
    <ul>
        <c:forEach items="${faqList}" var="faq">
            <li>
                <dl>
                    <dt>${faq.question}</dt>
                    <dd>${faq.answer}</dd>
                </dl>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
