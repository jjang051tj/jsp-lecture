<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%!
    //여기가 선언부
    String name ="장성호";
    int age = 20;
    public int add(int num01,int num02) {
        return num01+num02;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테스트입니다.</title>
</head>
<body>

    <h2>
        톰캣이 하는 역할은 자바를 통해서 동적인 페이지를 만들어서 전달 할 수 있다. <br>
        이런 류의 소프트웨어를 WebApplicationServer라고 한다. 줄여서 WAS라고 한다.
    </h2>
    <%
        out.println("<h2> 나의 이름은 "+name+"이고 나이는 "+age+"</h2>");
        out.println("5+3의 계산 결과는 "+add(5,3)+"입니다.");
    %>
    <%-- jsp 주석은 요롷게 쓴다. --%>
</body>
</html>