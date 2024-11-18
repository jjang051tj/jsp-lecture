<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>request</title>
  </head>
  <body>
    <a href="request-receive.jsp?name=장동건&age=30&weight=80&height=180&sex=male"
      >GET방식을 보내기</a
    >
    <form method="post" action="request-receive.jsp">
      <div><label><span>이름</span><input type="text" name="name" /></label></div>
      <div><label><span>나이</span><input type="text" name="age" /></label></div>
      <div><label><span>키</span><input type="text" name="height" /></label></div>
      <div><label><span>몸무게</span><input type="text" name="weight" /></label></div>
      <div>
        <label><span>성별</span></label>
        <span>남자</span><input type="radio" name="sex" value="male" />
        <span>여자</span><input type="radio" name="sex" value="female" />
      </div>
      <button>보내기</button>
    </form>
  </body>
</html>
