<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="my-5">VIEW</h2>
        <table class="table">
            <colgroup>
                <col style="width:15%">
                <col style="width:35%">
                <col style="width:15%">
                <col style="width:35%">
            </colgroup>
            <tbody>

                <tr>
                    <th scope="row">제목</th>
                    <td colspan="3">${boardDto.title}</td>
                <tr>
                <tr>
                    <th scope="row">글쓴이</th>
                    <td colspan="3">${boardDto.userName}</td>
                <tr>
                <tr>
                    <th scope="row">날짜</th>
                    <td>${boardDto.regDate}</td>
                    <th scope="row">조회수</th>
                    <td>${boardDto.hit}</td>
                <tr>
                <tr>
                    <th scope="row">내용</th>
                    <td colspan="3" style="white-space: pre">${boardDto.content}</td>
                <tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-center my-5">
<%--            <span>${loggedMemberDto.userId} / ${boardDto.userId}</span>--%>
            <a href="../board/list" class="btn btn-primary">LIST</a>
            <c:if test="${loggedMemberDto.userId ne null and loggedMemberDto.userId == boardDto.userId}">
                <a href="../board/delete?no=${boardDto.no}" class="btn btn-danger mx-1">DELETE</a>
                <a href="../board/modify" class="btn btn-secondary mx-1">MODIFY</a>
            </c:if>
        </div>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>
