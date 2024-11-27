<%@ page import="com.jjang051.model2.dto.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-27
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var="myName" value="장성호" scope="page" />
    <c:set var="myName02" scope="page" >정우성</c:set>
    <c:set var="loginMember" scope="request" value='<%= new MemberDto("jjang051","장성호") %>' />
    <p>${pageScope.myName}</p>
    <p>${pageScope.myName02}</p>
    <p>${myName} / ${myName02}</p>
    <hr>
    <p>${requestScope.loginMember.userId} / ${requestScope.loginMember.userName}</p>
    <c:remove var="myName" scope="page" />
    <p>제거된 myName = ${pageScope.myName}</p>
    <hr>
    <c:set var="age" value="19" />
    <c:if test="${age le 19}">
        <p>미성년자입니다.</p>
    </c:if>
    <c:if test="${age gt 19}" var="result">
        <p>성인입니다.</p>
    </c:if>
    result = ${result}
    <hr>
    <c:choose>
        <c:when test="${age le 19}">
            <p>미성년자입니다.</p>
        </c:when>
        <c:otherwise>
            <p>성인입니다.</p>
        </c:otherwise>
    </c:choose>
    <hr>
    <table border="1">
        <tr>
            <c:forEach var="i" begin="1" end="10">
                <td>${i}</td>
            </c:forEach>
        </tr>
    </table>
</body>
</html>











