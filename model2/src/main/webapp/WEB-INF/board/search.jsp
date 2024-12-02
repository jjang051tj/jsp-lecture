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
        <th scope="col">NO</th>
        <th scope="col">TITLE</th>
        <th scope="col">NAME</th>
        <th scope="col">DATE</th>
        <th scope="col">HIT</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${searchBoardList}" var="boardDto" varStatus="loop">
        <tr>
          <th scope="row">${boardList.size() - loop.index}</th>
          <td><a href="../board/view?no=${boardDto.no}">${boardDto.title}</a></td>
          <td>${boardDto.userName}</td>
          <td>${boardDto.regDate}</td>
          <td>${boardDto.hit}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <form action="../board/search" method="get" class="my-5">
      <input type="text" name="search" class="form-control">
      <button class="btn btn-primary">검색</button>
    </form>


    <c:if test="${not empty loggedMemberDto}">
      <div class="d-flex justify-content-center my-5">
        <a href="../board/write" class="btn btn-primary">WRITE</a>
      </div>
    </c:if>
  </div>
</main>
<%@ include file="../include/footer.jsp" %>
