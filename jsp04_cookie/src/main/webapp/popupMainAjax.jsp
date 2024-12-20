<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-20
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie cookies[] = request.getCookies();
    String onedayPopup = "on";
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("onedayCookie")&&cookieValue.equals("off")) {
            onedayPopup = "off";
        }
    }
%>
<html>
<head>
    <title>Title</title>
    <link href="css/layout.css" rel="stylesheet">
</head>
<body>
    <h1>오늘 하루 이창을 열지 않기 구현</h1>
    <%
        //String onedayPopup = "on";
        if(onedayPopup.equals("on")) {
    %>
    <aside id="popup">
        <div class="contents">
            여기에 내용 들어감
        </div>
        <div class="btn-box">
            <form action="popupCookie.jsp" method="get">
                <label>
                    <span>오늘 하루 이창을 열지 않기</span>
                    <input type="checkbox" id="oneday" value="1" name="oneday">
                </label>
                <button id="btn-close">닫기</button>
            </form>
        </div>
    </aside>
    <%
        }
    %>

<script>
    const btnClose = document.querySelector("#btn-close");
    const popup = document.querySelector("#popup");
    const onedayCheck =  document.querySelector("#oneday");
    btnClose.addEventListener("click",(e)=>{
        e.preventDefault();
        popup.style.display="none";
        if(onedayCheck.checked) {
            fetch("popupCookieAjax.jsp?oneday=1", {
                method: "GET",
            })
                .then((response)=>{
                    response.json()
                })
                .then((data)=>{
                    console.log(data);
                });
        }
    });
</script>
</body>
</html>
