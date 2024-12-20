<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<main class="form-signin w-100 m-auto">
    <form action="../member/login" method="post">
        <img class="mt-4" src="../images/bootstrap-logo.svg" alt="" width="72" height="57">
        <h2 class="h3 my-5 fw-bold">Please sign in</h2>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="userId" placeholder="name@example.com"
                   value="${cookie.rememberMe.value}">
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating mt-2">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPw">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" name="rememberMe" value="remember-me" id="flexCheckDefault"
                <c:if test="${not empty cookie.rememberMe}">checked</c:if>
            >
            <label class="form-check-label" for="flexCheckDefault">
                Remember me
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-body-secondary">© 2017–2024</p>
    </form>
</main>
<%@ include file="../include/footer.jsp"%>