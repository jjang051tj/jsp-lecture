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
    <form action="signup-ok.jsp" method="post">
      <div>
        <label><span>아이디</span><input type="text" name="userId" /></label>
      </div>
      <div>
        <label
          ><span>패스워드</span><input type="password" name="userPw"
        /></label>
      </div>
      <div>
        <label><span>이메일</span><input type="text" name="userEmail" /></label>
      </div>
      <div>
        <label><span>취미</span></label>
        <label><span>영화보기</span><input type="checkbox" name="hobbies" value="영화보기"/></label>
        <label><span>바둑</span><input type="checkbox"    name="hobbies" value="바둑"/></label>
        <label><span>테니스</span><input type="checkbox"   name="hobbies" value="테니스"/></label>
        <label><span>게임</span><input type="checkbox"    name="hobbies" value="게임"/></label>
        <label><span>독서</span><input type="checkbox"    name="hobbies" value="독서"/></label>
      </div>
      <button>회원가입</button>
    </form>
    <!-- 아이디(userId) / 패스워드(userPw) / 이메일(userEmail) / 체크박스로 취미 보내보기 (hobbies) -->
  </body>
</html>
