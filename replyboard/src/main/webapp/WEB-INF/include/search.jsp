<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-12
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="../board/search" method="get" class="my-5 row gx-2 p-5 border">
  <div class="col-2">
    <select class="form-control w-100" name="category">
      <option value="title"    ${param.category == "title"?"selected":""}>제목</option>
      <option value="content"  ${param.category == "content"?"selected":""}>내용</option>
      <option value="userName" ${param.category == "userName"?"selected":""}>작성자</option>
    </select>
  </div>
  <div class="col-8">
    <input type="text" name="search" class="form-control" value="${param.search}">
  </div>
  <div class="col-2">
    <button class="btn btn-primary w-100">검색</button>
  </div>
</form>