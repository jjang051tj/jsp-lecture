<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>

<h2 class="my-5">LIST</h2>
<p class="text-end">10개의 글이 있습니다.</p>
<table class="table">
    <colgroup>
        <col style="width:100px;">
        <col>
        <col style="width:150px;">
        <col style="width:250px;">
        <col style="width:50px;">
    </colgroup>
    <thead>

    <tr>
        <th scope="col" class="text-center p-3">NO</th>
        <th scope="col" class="p-3">TITLE</th>
        <th scope="col" class="text-center p-3">NAME</th>
        <th scope="col" class="text-center p-3">DATE</th>
        <th scope="col" class="text-center p-3">HIT</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${replyBoardList}" var="item">
        <tr>
            <th scope="row" class="text-center p-3">1</th>
            <td class="p-3"><a href="../board/view?no=${item.no}" class="step step${item.restep}">${item.title}</a></td>
            <td class="text-center p-3">${item.userName}</td>
            <td class="text-center p-3">${item.regDate}</td>
            <td class="text-center p-3">${item.hit}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="d-flex justify-content-center my-5">
    <a href="../board/write" class="btn btn-primary">WRITE</a>
</div>
<form action="../board/search" method="get" class="my-5 row gx-2 p-5 border">
    <div class="col-2">
        <select class="form-control w-100" name="category">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="userName">작성자</option>
        </select>
    </div>
    <div class="col-8">
        <input type="text" name="search" class="form-control">
    </div>
    <div class="col-2">
        <button class="btn btn-primary w-100">검색</button>
    </div>
</form>

<%@ include file="../include/footer.jsp" %>