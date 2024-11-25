<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-22
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="insert-member-process.jsp" method="post" name="signup">
        <div><label>아이디</label><input type="text" name="userId" id="user-id"><button id="btn-duplicate-id">아이디 중복체크</button></div>
        <div><label>패스워드</label><input type="password" name="userPw"></div>
        <div><label>패스워드확인</label><input type="password" name="userPw02"></div>
        <div><label>이름</label><input type="text" name="userName"></div>
        <div><label>이메일</label><input type="text" name="userEmail"></div>
        <div><label>우편번호</label><input type="text" name="zipcode"></div>
        <div><label>주소</label><input type="text" name="addr01"></div>
        <div><label>상세주소</label><input type="text" name="addr02"></div>
        <div><label>전화번호</label><input type="text" name="tel"></div>
        <div><button id="btn-signup">회원가입</button></div>
    </form>
    <script>
        const btnDuplicateId = document.querySelector("#btn-duplicate-id");
        const btnSignup = document.querySelector("#btn-signup");
        const userId =  document.querySelector("#user-id");

        btnDuplicateId.addEventListener("click",(e)=>{
            e.preventDefault(); //아이디 중복체크 버튼 눌렀을때 form에 있는 action주소로 못 날아가게 하기...

        });
        btnSignup.addEventListener("click",(e)=>{
            if(document.signup.userId.value==="") {
                alert("회원아이디는 필수 입력 사항입니다.");
                e.preventDefault();
            } else if(document.signup.userPw.value==="") {
                alert("패스워드는 필수 입력 사항입니다.");
                e.preventDefault();
            } else if(document.signup.userName.value==="") {
                alert("사용자 이름은 필수 입력 사항입니다.");
                e.preventDefault();
            }else if(document.signup.userEmail.value==="") {
                alert("사용자 이름은 필수 입력 사항입니다.");
                e.preventDefault();
            }
            if(document.signup.userPw.value!=document.signup.userPw02.value) {
                e.preventDefault();
                alert("비밀번호가 맞지 않습니다. 비밀번호 확인해주세요.");
            }
        });
    </script>
</body>
</html>



