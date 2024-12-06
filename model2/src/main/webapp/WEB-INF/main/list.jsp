<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-06
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="my-5">LIST</h2>
        <p class="text-end">${total}개의 visual이 있습니다.</p>
        <form action="../main/list" method="post">
            <table class="table main-visual-table">
                <colgroup>
                    <col style="width:100px;">
                    <col>
                    <col style="width:500px;">
                    <col style="width:350px;">
                    <col style="width:50px;">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col" class="text-center p-3">NO</th>
                    <th scope="col" class="p-3">VISUAL</th>
                    <th scope="col" class="text-center p-3">MAIN-MESSAGE</th>
                    <th scope="col" class="text-center p-3">SUB-MESSAGE</th>
                    <th scope="col" class="text-center p-3"><input type="checkbox" id="all-check" class="form-check-input"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${visualDtoList}" var="visualDto" varStatus="loop">
                    <tr>
                        <th scope="row" class="text-center p-3">${total - visualDto.no + 1}</th>
                        <td class="p-3"><img src="${pageContext.request.contextPath}/upload/${visualDto.renameFile}"
                                             class="img"></td>
                        <td class="text-center p-3">${visualDto.mainTxt}</td>
                        <td class="text-center p-3">${visualDto.subTxt}</td>
                        <td class="text-center p-3"><input type="checkbox" name="check" class="form-check-input" value="${visualDto.no}"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="mt-5">
                <button class="btn btn-primary">CONFIRM</button>
            </div>
        </form>
</main>
<%@ include file="../include/footer.jsp" %>
