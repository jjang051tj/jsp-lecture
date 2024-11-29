<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-28
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <main>
        <div class="container">
            <h2 class="my-5">비밀번호확인</h2>
            <form action="../member/password-check" method="post">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="userId" placeholder="name@example.com"
                           value="jjang051">
                    <label for="floatingInput">User ID</label>
                </div>
                <div class="form-floating mt-2">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPw">
                    <label for="floatingPassword">Password</label>
                </div>
                <button class="btn btn-primary mt-3 w-100 py-2" type="submit">확인</button>
                <p class="mt-5 mb-3 text-body-secondary">© 2017–2024</p>
            </form>
        </div>
    </main>
<%@ include file="../include/footer.jsp" %>