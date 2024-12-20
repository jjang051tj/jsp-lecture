<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="my-5">MODIFY</h2>
        <form action="../board/modify" method="post">
            <div class="mb-3">
                <label for="title" class="form-label" >TITLE</label>
                <input type="text" class="form-control form-control-lg" name="title" id="title" value="${boardDto.title}" placeholder="제목을 입력하세요." readonly>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">CONTENT</label>
                <textarea class="form-control" id="content" name="content" rows="8">${boardDto.content}</textarea>
            </div>
            <input type="hidden" name="no" value="${param.no}">
            <div class="d-flex justify-content-center my-5">
                <button class="btn btn-primary">MODIFY</button>
                <button class="btn btn-secondary mx-2" type="reset">RESET</button>
            </div>

        </form>

    </div>
</main>
<%@ include file="../include/footer.jsp" %>
