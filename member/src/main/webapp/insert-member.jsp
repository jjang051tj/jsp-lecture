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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <form action="insert-member-process.jsp" method="post" name="signup">
        <div>
            <label>아이디</label><input type="text" name="userId" id="user-id">
            <button id="btn-duplicate-id">아이디 중복체크</button>
        </div>
        <div><label>패스워드</label><input type="password" name="userPw"></div>
        <div><label>패스워드확인</label><input type="password" name="userPw02"></div>
        <div><label>이름</label><input type="text" name="userName"></div>
        <div><label>이메일</label><input type="text" name="userEmail"><button id="btn-duplicate-email">이메일 중복체크</button></div>
        <div><label>우편번호</label><input type="text" name="zipcode" readonly id="zipcode"><button id="btn-zipcode">우편번호찾기</button></div>
        <div><label>주소</label><input type="text" name="addr01" id="addr01"></div>
        <div><label>상세주소</label><input type="text" name="addr02" id="addr02"></div>
        <div><label>전화번호</label><input type="text" name="tel"></div>
        <div><button id="btn-signup">회원가입</button></div>
    </form>
    <script>
        function makeZipcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    let addr = ""; // 주소 변수
                    let extraAddr = ""; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.querySelector("#addr02").value = extraAddr;

                    } else {
                        document.querySelector("#addr02").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector("#zipcode").value = data.zonecode;
                    document.querySelector("#addr01").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("#addr02").focus();
                }
            }).open();
        }
        const btnDuplicateId = document.querySelector("#btn-duplicate-id");
        const btnDuplicateEmail = document.querySelector("#btn-duplicate-email");
        const btnSignup = document.querySelector("#btn-signup");
        const userId =  document.querySelector("#user-id");
        const btnZipcode =  document.querySelector("#btn-zipcode");
        btnZipcode.addEventListener("click",(e)=>{
            e.preventDefault();
            makeZipcode();
        });

        let isValid = false;
        let isEmailValid = false;
        btnDuplicateEmail.addEventListener("click",(e)=>{
            console.log(btnDuplicateEmail.value);
            e.preventDefault(); //아이디 중복체크 버튼 눌렀을때 form에 있는 action주소로 못 날아가게 하기...
            //여기서 아이디를 id-duplicate-check
            fetch("email-duplicate-check.jsp?userEmail="+btnDuplicateEmail.value)
                .then((response)=>response.json())
                .then((json)=>{
                    console.log(json);
                    if(json.count==1) {
                        alert("중복된 이메일입니다. 다른 걸로 다시 사용해 주세요.");
                    }else  {
                        alert("사용 가능한 이메일입니다.");
                        isEmailValid=true;
                    }
                })
        });
        btnDuplicateId.addEventListener("click",(e)=>{
            e.preventDefault(); //아이디 중복체크 버튼 눌렀을때 form에 있는 action주소로 못 날아가게 하기...
            //여기서 아이디를 id-duplicate-check
            fetch("id-duplicate-check.jsp?userId="+userId.value)
                .then((response)=>response.json())
                .then((json)=>{
                    console.log(json);
                    if(json.count==1) {
                        alert("중복된 아이디입니다. 다른 걸로 다시 사용해 주세요.");
                    }else  {
                        alert("사용 가능한 아이디입니다.");
                        isValid=true;
                    }
                })
        });
        btnSignup.addEventListener("click",(e)=>{
            if(!isValid) {
               e.preventDefault();
               alert("아이디 중목체크 해주세요.");
            }
            if(!isEmailValid) {
                e.preventDefault();
                alert("이메일 중목체크 해주세요.");
            }
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



