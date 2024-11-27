<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="mt-5 mb-5">SIGN UP</h2>
        <form action="../member/signup" method="post">
            <div class="mb-3">
                <label for="userId" class="form-label" >USER ID</label>
                <input type="text" class="form-control form-control-lg" name="userId" id="userId" placeholder="USER ID">
            </div>
            <div class="mb-3">
                <label for="userPw" class="form-label" >PASSWORD</label>
                <input type="text" class="form-control form-control-lg" name="userPw" id="userPw" placeholder="PASSWORD">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label" >USER NAME</label>
                <input type="text" class="form-control form-control-lg" name="userName" id="userName" placeholder="USER NAME">
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label" >EMAIL</label>
                <input type="text" class="form-control form-control-lg" name="userEmail" id="userEmail" placeholder="name@example.com">
            </div>
            <div class="mb-3">
                <label for="zipcode" class="form-label" >ZIPCODE</label>
                <input type="text" class="form-control form-control-lg" name="zipcode" id="zipcode" placeholder="ZIPCODE">
            </div>
            <div class="mb-3">
                <label for="addr01" class="form-label" >ADDRESS</label>
                <input type="text" class="form-control form-control-lg" name="addr01" id="addr01" placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label" >DETAIL ADDRESS</label>
                <input type="text" class="form-control form-control-lg" name="addr02" id="addr02" placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label" >TEL</label>
                <input type="text" class="form-control form-control-lg" name="tel" id="tel" placeholder="TEL">
            </div>
            <div class="mt-5">
                <button class="btn btn-primary">SIGN UP</button>
            </div>
        </form>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>

