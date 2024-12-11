<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <div class="container">
        <h2 class="mt-5 mb-5">SIGN UP</h2>
        <form action="../member/signup" method="post" >
            <div class="mb-3">

                <label for="userId" class="form-label fw-bold fs-5">USER ID</label>
                <div class="row g-2">
                    <div class="col-10">
                        <input type="text" class="form-control form-control" name="userId" id="userId"
                               placeholder="USER ID">
                    </div>
                    <div class="col-2">
                        <button class="btn  btn btn-primary w-100" id="btn-duplicate-id">아이디 중복 학인</button>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label for="userPw" class="form-label fw-bold fs-5">PASSWORD</label>
                <input type="text" class="form-control form-control" name="userPw" id="userPw"
                       placeholder="PASSWORD">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label fw-bold fs-5">USER NAME</label>
                <input type="text" class="form-control form-control" name="userName" id="userName"
                       placeholder="USER NAME">
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label fw-bold fs-5">EMAIL</label>
                <div class="row g-2">
                    <div class="col-10">
                        <input type="text" class="form-control form-control" name="userEmail" id="userEmail"
                               placeholder="name@example.com">
                    </div>
                    <div class="col-2">
                        <button class="btn  btn btn-primary w-100" id="btn-duplicate-email">이메일 중복 학인</button>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label for="zipcode" class="form-label fw-bold fs-5">ZIPCODE</label>
                <div class="row g-2">
                    <div class="col-10">
                        <input type="text" class="form-control form-control" name="zipcode" id="zipcode"
                               placeholder="ZIPCODE">
                    </div>
                    <div class="col-2">
                        <button class="btn btn-primary btn w-100" id="btn-zipcode">우편번호 검색</button>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label for="addr01" class="form-label fw-bold fs-5">ADDRESS</label>
                <input type="text" class="form-control form-control" name="addr01" id="addr01"
                       placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label fw-bold fs-5">DETAIL ADDRESS</label>
                <input type="text" class="form-control form-control" name="addr02" id="addr02"
                       placeholder="ADDRESS">
            </div>
            <div class="mb-3">
                <label for="addr02" class="form-label fw-bold fs-5">TEL</label>
                <input type="text" class="form-control form-control" name="tel" id="tel" placeholder="TEL">
            </div>
            <div class="mb-3">
                <label for="profile" class="form-label fw-bold fs-5">PROFILE</label>
                <input type="file" class="form-control form-control" name="profile" id="profile" placeholder="profile">
            </div>
            <div class="mt-5">
                <button class="btn btn-primary">SIGN UP</button>
            </div>
        </form>
    </div>
</main>
<script>
    const btnZipcode = document.querySelector("#btn-zipcode");
    const btnDuplicateId = document.querySelector("#btn-duplicate-id");
    const btnDuplicateEmail = document.querySelector("#btn-duplicate-email");
    const userId = document.querySelector("#userId");
    const userEmail = document.querySelector("#userEmail");

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
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

    btnZipcode.addEventListener("click", (e) => {
        e.preventDefault();
        execDaumPostcode();
    });

    btnDuplicateId.addEventListener("click", (e) => {

        e.preventDefault();
        e.stopImmediatePropagation(); //이벤트 전파 막기
        fetch("../member/id-check?userId=" + userId.value)
            .then(response => response.json())
            .then(json => {
                console.log(json);
                if (json.result > 0) {
                    alert("쓸 수 없는 아이디입니다. 다시 확인해 주세요");
                    userId.value = "";
                    userId.focus();
                }
            })
    });
    btnDuplicateEmail.addEventListener("click", (e) => {
        e.preventDefault();
        e.stopImmediatePropagation();
        fetch("../member/email-check?userEmail=" + userEmail.value)
            .then(response => response.json())
            .then(json => {
                console.log(json);
            })
    })
</script>
<%@ include file="../include/footer.jsp" %>

