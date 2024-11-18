<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    double weight = Double.parseDouble(request.getParameter("weight"));
    double height = Double.parseDouble(request.getParameter("height"));
    double bmi =  weight/Math.pow(height/100,2);
    String strBmi = "";
    if(bmi<18.5) {
        strBmi = "저체중";
    } else if(bmi>25){
        strBmi = "비만";
    } else  {
        strBmi = "정상";
    }
    System.out.println(bmi);
    //키를 입력받아서 비만인지 아닌지 결과 보여주기....
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제목</title>
</head>
<body>
    <% out.println("안녕 내 이름은 "+name+" 이고 나이는 "+age+"살이야 몸무게는 "+weight+"입니다.");  %>
    <% out.println("당신의 bmi="+bmi+"이고 "+strBmi+"입니다.");  %>
    <!--<h1>안녕 내 이름은 장성호 이고 나이는 20살이야</h1>-->
</body>
</html>