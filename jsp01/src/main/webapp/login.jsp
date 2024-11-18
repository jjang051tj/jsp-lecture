<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>제목</title>
  </head>
  <body>
    <form action="login-ok.jsp" method="post">
      <div>
        <label>
          <span>아이디</span>
          <input type="text" name="userId" />
        </label>
      </div>
      <div>
        <label>
          <span>패스워드</span>
          <input type="password" name="userPw" />
        </label>
      </div>
      <input type="hidden" name="userName" value="장동건" />
      <button>로그인</button>
    </form>
  </body>
</html>
