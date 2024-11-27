<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
    <main>
        <div class="container">
            <h1>main</h1>
        </div>
        <c:set var="directVar" value="100" />
        <h2>${pageScope.directVar}</h2>
    </main>
<%@ include file="../include/footer.jsp"%>