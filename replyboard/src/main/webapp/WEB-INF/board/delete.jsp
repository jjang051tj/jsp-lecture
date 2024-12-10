<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>

<h2 class="my-5">DELETE</h2>
<form action="../board/delete" method="post">

    <div class="mb-5">
        <label for="password" class="form-label fw-bold fs-5">PASSWORD</label>
        <input type="text" class="form-control form-control" name="password" id="password" placeholder="비밀번호를 입력하세요.">
    </div>
    <input type="hidden" name="parentId" value="${param.parentId}">
    <input type="hidden" name="no" value="${param.no}">
    <div class="d-flex justify-content-center my-5">
        <button class="btn btn-danger">DELETE</button>
        <a href="../board/list" class="btn btn-primary">LIST</a>
    </div>
</form>


<%@ include file="../include/footer.jsp" %>