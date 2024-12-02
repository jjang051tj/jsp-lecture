<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-02
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="my-5">MODIFY</h2>
        <form action="../board/modify-password" method="post">
            <input type="password" name="userPw" class="form-control-lg form-control">
            <input type="hidden" name="userId" value="${loggedMemberDto.userId}">
            <input type="hidden" name="no" value="${param.no}">
            <div class="mt-5">
                <button class="btn btn-danger">수정</button>
            </div>
        </form>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>
