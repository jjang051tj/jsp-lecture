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
        <h2 class="my-5">LIST</h2>
        <p class="text-end">${total}개의 글이 있습니다.</p>
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
            <c:forEach items="${boardList}" var="boardDto" varStatus="loop">
                <tr>
                    <th scope="row" class="text-center p-3">${total - boardDto.num + 1}</th>
                    <td class="p-3"><a href="../board/view?no=${boardDto.no}">${boardDto.title}</a></td>
                    <td class="text-center p-3">${boardDto.userName}</td>
                    <td class="text-center p-3">${boardDto.regDate}</td>
                    <td class="text-center p-3">${boardDto.hit}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-5">
                <c:if test="${serverStartPagination != 1}">
                    <li class="page-item">
                        <a class="page-link" href="../board/list?page=${serverPrevPagination}">
                            <i class="bi bi-chevron-double-left"></i>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="../board/list?page=${serverPrevPagination}">
                            <i class="bi bi-chevron-left"></i>
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
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="../board/list?page=${serverNextPagination}">
                            <i class="bi bi-chevron-double-right"></i>
                        </a>
                    </li>
                </c:if>
            </ul>

        </nav>
        <h2>${serverStartPagination} / ${serverEndPagination} / ${serverEndPagination} </h2>
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


        <c:if test="${not empty loggedMemberDto}">
            <div class="d-flex justify-content-center my-5">
                <a href="../board/write" class="btn btn-primary">WRITE</a>
            </div>
        </c:if>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>
