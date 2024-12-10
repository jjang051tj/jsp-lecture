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
                <th scope="row"   class="p-3">제목</th>
                <td colspan="3"   class="p-3">${replyBoardDto.title}</td>
            <tr>
            <tr>
                <th scope="row"   class="p-3">글쓴이</th>
                <td colspan="3"   class="p-3">${replyBoardDto.userName}</td>
            <tr>
            <tr>
                <th scope="row"   class="p-3">날짜</th>
                <td   class="p-3">${replyBoardDto.regDate}</td>
                <th scope="row"   class="p-3">조회수</th>
                <td   class="p-3">${replyBoardDto.hit}</td>
            <tr>
            <tr>
                <th scope="row"   class="p-3">내용</th>
                <td colspan="3" style="white-space: pre"   class="p-3">${replyBoardDto.content}</td>
            <tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-center my-5">
            <%--            <span>${loggedMemberDto.userId} / ${replyBoardDto.userId}</span>--%>
            <a href="../board/list" class="btn btn-primary">LIST</a>
            <a href="../board/reply?no=${replyBoardDto.no}" class="btn btn-primary mx-1">REPLY</a>
            <a href="../board/delete?regroup=${replyBoardDto.regroup}" class="btn btn-primary mx-1">HARD DELETE</a>
            <a href="../board/delete?no=${replyBoardDto.no}" class="btn btn-primary mx-1">SOFT DELETE</a>
        </div>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>