<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <title>제목</title>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col col-3"></div>
        <div class="col col-6">
          <h2 class="mt-5 mb-5">회원가입</h2>

          <form action="signup-ok.jsp" method="post">
            <div class="mb-3">
              <label for="userId" class="form-label">아이디</label>
              <input
                type="text"
                class="form-control"
                id="userId"
                placeholder="user id"
                name="userId"
              />
            </div>
            <div class="mb-3">
              <label for="userPw" class="form-label">패스워드</label>
              <input
                type="password"
                class="form-control"
                id="userPw"
                placeholder="password"
                name="userPw"
              />
            </div>
            <div class="mb-3">
              <label for="userName" class="form-label">이름</label>
              <input
                type="text"
                class="form-control"
                id="userPw"
                placeholder="이름"
                name="userName"
              />
            </div>
            <div class="mb-3">
              <label for="userName" class="form-label">이메일</label>
              <input
                type="text"
                class="form-control"
                id="userPw"
                placeholder="이메일"
                name="userEmail"
              />
            </div>
            <div class="mb-3">
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="hobbies01"
                  value="영화보기"
                  name="hobbies"
                />
                <label class="form-check-label" for="hobbies01">영화보기</label>
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="hobbies02"
                  value="독서"
                  name="hobbies"
                />
                <label class="form-check-label" for="hobbies02">독서</label>
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="hobbies03"
                  value="테니스"
                  name="hobbies"
                />
                <label class="form-check-label" for="hobbies03">테니스</label>
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="hobbies04"
                  value="바둑"
                  name="hobbies"
                />
                <label class="form-check-label" for="hobbies04">바둑</label>
              </div>
            </div>
            <div class="mb-3 mt-5 d-flex justify-content-center">
              <button class="btn btn-primary">회원가입</button>
              <button class="btn btn-secondary mx-2">취소</button>
            </div>
          </form>
        </div>
        <div class="col col-3"></div>
      </div>
    </div>
    <!-- 아이디(userId) / 패스워드(userPw) / 이메일(userEmail) / 체크박스로 취미 보내보기 (hobbies) -->
  </body>
</html>
