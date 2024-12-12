<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>

<h2 class="my-5">LIST</h2>
<p class="text-end">10개의 글이 있습니다.</p>
<table class="table">
    <colgroup>
        <col style="width:100px;">
        <col>
        <col style="width:150px;">
        <col style="width:250px;">
        <col style="width:50px;">
    </colgroup>
    <thead>

    <tr>
        <th scope="col" class="text-center p-3">NO</th>
        <th scope="col" class="p-3">TITLE</th>
        <th scope="col" class="text-center p-3">NAME</th>
        <th scope="col" class="text-center p-3">DATE</th>
        <th scope="col" class="text-center p-3">HIT</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${replyBoardList}" var="item">
        <tr>
            <th scope="row" class="text-center p-3">1</th>
            <td class="p-3">
                <c:choose>
                    <c:when test="${item.available > 0}">
                        <a href="../board/view?no=${item.no}&num=${item.num}" class="step step${item.restep}">
                            <c:if test="${item.restep > 0}"><i class="bi bi-arrow-return-right"></i></c:if>
                            <span>${item.title}</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <span  class="step step${item.restep}" >
                            <c:if test="${item.restep > 0}"><i class="bi bi-arrow-return-right"></i></c:if>
                            <span>삭제된 글입니다.</span>
                        </span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="text-center p-3">${item.userName}</td>
            <td class="text-center p-3">${item.regDate}</td>
            <td class="text-center p-3">${item.hit}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center mt-5">
        <c:if test="${serverStartPagination != 1}">
            <li class="page-item">
                <a class="page-link" href="../board/list?page=1">
                    <i class="bi bi-chevron-double-left fs-4"></i>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="../board/list?page=${serverPrevPagination}">
                    <i class="bi bi-chevron-left fs-4"></i>
                </a>
            </li>
        </c:if>
        <c:forEach begin="${serverStartPagination}" end="${serverEndPagination}" varStatus="loop" var="page" >
            <c:choose>
                <c:when test="${param.page eq page}">
                    <li class="page-item active"><a class="page-link" href="../board/list?page=${page}">${page}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="../board/list?page=${page}">${page}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${serverEndPagination != totalPagination}">
            <li class="page-item">
                <a class="page-link" href="../board/list?page=${serverNextPagination}">
                    <i class="bi bi-chevron-right fs-4"></i>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="../board/list?page=${totalPagination}">
                    <i class="bi bi-chevron-double-right fs-4"></i>
                </a>
            </li>
        </c:if>
    </ul>

</nav>
<h2>${serverStartPagination} / ${serverEndPagination}  </h2>

<div class="d-flex justify-content-center my-5">
    <a href="../board/write" class="btn btn-primary">WRITE</a>
</div>
<form action="../board/search" method="get" class="my-5 row gx-2 p-5 border">
    <div class="col-2">
        <select class="form-control w-100" name="category">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="userName">작성자</option>
        </select>
    </div>
    <div class="col-8">
        <input type="text" name="search" class="form-control">
    </div>
    <div class="col-2">
        <button class="btn btn-primary w-100">검색</button>
    </div>
</form>

<%@ include file="../include/footer.jsp" %>