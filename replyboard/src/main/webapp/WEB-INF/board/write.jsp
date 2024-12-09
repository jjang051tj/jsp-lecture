<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>

<h2 class="my-5">WRITE</h2>
<c:set var="action" value="${replyBoardDto==null ? '../board/write':'../board/reply'}"></c:set>
<form action="${action}" method="post">
    <div class="mb-5">
        <label for="title" class="form-label fw-bold fs-5">TITLE</label>
        <c:choose>
            <c:when test="${replyBoardDto ne null}">
                <input type="text" class="form-control form-control" name="title" id="title" placeholder="제목을 입력하세요."
                       value="[RE] ${replyBoardDto.title}">
            </c:when>
            <c:otherwise>
                <input type="text" class="form-control form-control" name="title" id="title" placeholder="제목을 입력하세요.">
            </c:otherwise>
        </c:choose>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label fw-bold fs-5">CONTENT</label>
        <textarea class="form-control" id="content" name="content" rows="8"></textarea>
    </div>
    <div class="mb-5">
        <label for="password" class="form-label fw-bold fs-5">PASSWORD</label>
        <input type="text" class="form-control form-control" name="password" id="password" placeholder="비밀번호를 입력하세요.">
    </div>
    <input type="hidden" name="userId" value="jjang051">
    <input type="hidden" name="userName" value="장성호">
    <c:if test="${not empty replyBoardDto}">
        <input type="hidden" name="regroup" value="${replyBoardDto.regroup}">
        <input type="hidden" name="relevel" value="${replyBoardDto.relevel}">
        <input type="hidden" name="restep" value="${replyBoardDto.restep}">
    </c:if>


    <div class="d-flex justify-content-center my-5">
        <button class="btn btn-primary">WRITE</button>
        <button class="btn btn-secondary mx-2" type="reset">RESET</button>
    </div>
</form>


<%@ include file="../include/footer.jsp" %>