<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<main>
  <div class="container">
    <h2 class="my-5">회원탈퇴</h2>
    <form action="../member/delete" method="post">
      <input type="password" name="userPw" class="form-control-lg form-control">
      <input type="hidden" name="userId" value="${loggedMemberDto.userId}">
      <div class="mt-5">
        <button class="btn btn-danger">회원탈퇴</button>
      </div>
    </form>
  </div>

</main>
<%@ include file="../include/footer.jsp"%>
