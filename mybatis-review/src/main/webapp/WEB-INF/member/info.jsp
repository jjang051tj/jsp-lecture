<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-28
  Time: 오후 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <main>
        <div class="container">
            <h2 class="my-5">회원정보</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">아이디</th>
                        <td>${loggedMemberDto.userId}</td>
                    </tr>
                    <tr>
                        <th scope="row">이름</th>
                        <td>${loggedMemberDto.userName}</td>
                    </tr>
                    <tr>
                        <th scope="row">이메일</th>
                        <td>${memberDto.userEmail}</td>
                    </tr>
                    <tr>
                        <th scope="row">주소</th>
                        <td>${memberDto.address}</td>
                    </tr>
                    <tr>
                        <th scope="row">tel</th>
                        <td>${memberDto.tel}</td>
                    </tr>
                    <tr>
                        <th scope="row">등록날짜</th>
                        <td>${memberDto.regDate}</td>
                    </tr>
                </tbody>
            </table>
            <div class="mt-5 d-flex justify-content-center">
                <a href="../member/password-check" class="btn btn-primary">MODIFY</a>
                <a href="../member/delete" class="btn btn-secondary mx-2">DELETE</a>
            </div>
        </div>
    </main>
<%@ include file="../include/footer.jsp" %>
