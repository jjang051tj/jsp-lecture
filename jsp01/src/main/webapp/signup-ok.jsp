<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Arrays, java.util.stream.*"
%>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userEmail = request.getParameter("userEmail");
    String hobbies[] = request.getParameterValues("hobbies");
    String strHobbies01 = "";
    String strHobbies02 = "";

    for(int i=0;i<hobbies.length;i++) {
        if(i+1==hobbies.length){
            strHobbies01+=hobbies[i];
            break;
        }
        strHobbies01+=hobbies[i]+",";
    }
    //1. 마지막에 컴마 없애기
    //2. 람다식으로 Stream으로 바꿔서 람다로 바꿔보기
    strHobbies02 = Arrays.stream(hobbies)
                       .collect(Collectors.joining(","));

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제목</title>
</head>
<body>
    <ul>
        <li>아이디 : <%= userId %></li>
        <li>아이디 : <% out.println(userId); %></li>
        <li>패스워드 : <%= userPw %></li>
        <li>이메일 : <%= userEmail %></li>
        <li>취미 일반 반복문 : <%= strHobbies01 %></li>
        <li>취미 람다 : <%= strHobbies02 %></li>
    </ul>
</body>
</html>