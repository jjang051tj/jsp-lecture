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
    <div class="container-md">
        <form>
            <div class="mb-3">
                <label for="userId" class="form-label" name="userId">USER ID</label>
                <input type="text" class="form-control form-control-lg" id="userId" placeholder="USER ID">
            </div>
            <div class="mb-3">
                <label for="userPw" class="form-label" name="userPw">PASSWORD</label>
                <input type="text" class="form-control form-control-lg" id="userPw" placeholder="PASSWORD">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label" name="userName">USER NAME</label>
                <input type="text" class="form-control form-control-lg" id="userName" placeholder="USER NAME">
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label" name="userEmail">EMAIL</label>
                <input type="text" class="form-control form-control-lg" id="userEmail" placeholder="name@example.com">
            </div>
            <div class="mb-3">
                <label for="zipcode" class="form-label" name="addr01">ZIPCODE</label>
                <input type="text" class="form-control form-control-lg" id="zipcode" placeholder="ZIPCODE">
            </div>
            <div class="mb-3">
                <label for="addr01" class="form-label" name="addr01">ADDRESS</label>
                <input type="text" class="form-control form-control-lg" id="addr01" placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label" name="addr02">DETAIL ADDRESS</label>
                <input type="text" class="form-control form-control-lg" id="addr02" placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label" name="tel">TEL</label>
                <input type="text" class="form-control form-control-lg" id="tel" placeholder="TEL">
            </div>
            <div class="mt-5">
                <button class="btn btn-primary">SIGN UP</button>
            </div>
        </form>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>

