<%@ page import="com.jjang051.model2.dto.MemberDto" %>
<%@ page import="com.jjang051.model2.utils.CookieManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-27
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDto loggedMemberDto = new MemberDto();
    loggedMemberDto.setUserId("jjang051");
    loggedMemberDto.setUserName("장성호");

    pageContext.setAttribute("scopeValue","페이지 영역");
    request.setAttribute("scopeValue","리퀘스트 영역");
    session.setAttribute("scopeValue","세션 영역");
    application.setAttribute("scopeValue","어플리케이션 영역");
    request.setAttribute("loggedMemberDto",loggedMemberDto);

    CookieManager.makeCookie(response,"cookieName", "1000",60*60);

    List<String> list = new ArrayList<>();
    list.add("눈온다");
    list.add("열라 온다");
    list.add("집에 어떻게 가지...");
    Map<String,String> hashMap = new HashMap<>();
    hashMap.put("snow","눈");
    hashMap.put("snowman","눈사람");
    pageContext.setAttribute("list",list);
    pageContext.setAttribute("hashMap",hashMap);
    int num01= 10;
    pageContext.setAttribute("num01",10);
    pageContext.setAttribute("num02",20);


    pageContext.setAttribute("nullStr",null);
    pageContext.setAttribute("emptyStr","");
    pageContext.setAttribute("lengthZero",new Integer[0]);
    pageContext.setAttribute("sizeZero",new ArrayList<Object>());



    //pageContext,request,session,application
    //el expression language
%>
<html>
<head>
    <title>Title</title>
    <style>
        h2 {font-size:14px}
    </style>
</head>
<body>

    <h2>EL(expression language)로 출력하기</h2>
    <h2>${pageScope.scopeValue}</h2>
    <h2>${requestScope.scopeValue}</h2>
    <h2>${sessionScope.scopeValue}</h2>
    <h2>${applicationScope.scopeValue}</h2>
    <h2>${scopeValue}</h2>
    <hr>
    <h2>${param.age}</h2>
    <h2><%= request.getParameter("age")%></h2>
    <h2>${paramValues.inter[0]}</h2>
    <h2>${paramValues.inter[1]}</h2>
    <hr>
    <h2>${requestScope.loggedMemberDto.userId}</h2>
    <h2>${requestScope.loggedMemberDto.userName}</h2>
    <hr>
    <h2>${cookie.JSESSIONID.value}</h2>
    <h2>${cookie.cookieName.value}</h2>
    <hr>
    <h2>${header.host}</h2>
    <h2>${header["user-agent"]}</h2>
    <h2>${header.cookie}</h2>
    <h2>${pageContext.request.contextPath}</h2>
    <hr>
    <h2>${list[0]}/${list[1]}/${list[2]}</h2>
    <h2>${hashMap.snow}/${hashMap["snowman"]}</h2>
    <hr>
    <h2>num01+num02 = ${pageScope.num01+pageScope.num02}</h2>
    <h2>num01+num02 = ${num01+num02}</h2>
    <h2>num02-num01 = ${num02-num01}</h2>
    <h2>num01*num02 = ${num02*num01}</h2>
    <h2>num02/num01 = ${num02/num01}</h2>
    <h2>num02%num01 = ${num02%3}</h2>
    <h2>num02%num01 = ${num02 mod 3}</h2>
    <h2>num02/num01 = ${num02 div 3}</h2>
    <hr>
    <h2>num02 > num01 = ${num02 > num01}</h2>
    <h2>num02 gt num01 = ${num02 gt num01}</h2>

    <h2>num02 < num01 = ${num02 < num01}</h2>
    <h2>num02 lt num01 = ${num02 lt num01}</h2>

    <h2>num02 == num02 = ${num02 == num02}</h2>
    <h2>num02 eq num02 = ${num02 eq num02}</h2>

    <h2>num02 != num01 = ${num02 != num01}</h2>
    <h2>num02 ne num01 = ${num02 ne num01}</h2>

    <hr>

    <h2>num02 > num01 && num02 != num01  = ${num02 > num01 && num02 != num01}</h2>
    <h2>num02 > num01 and num02 != num01  = ${num02 gt num01 and num02 ne num01}</h2>

    <hr>
    <h2>empty nullStr   ${empty nullStr}</h2>
    <h2>empty emptyStr  ${empty emptyStr}</h2>
    <h2>empty lengthZero ${empty lengthZero}</h2>
    <h2>empty sizeZero ${empty sizeZero}</h2>

    <h2>null + 10 = ${null + 10}</h2>
    <h2>nullStr + 10 = ${nullStr + 10}</h2>
</body>
</html>
