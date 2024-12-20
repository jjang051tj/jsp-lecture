<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.0.0/ckeditor5.css" crossorigin>
    <link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link rel="stylesheet" href="../css/layout.css">
    <script src="../js/swiper-bundle.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/44.0.0/ckeditor5.umd.js" crossorigin></script>

<%--    <script src="https://cdn.ckbox.io/ckbox/2.6.1/ckbox.js" crossorigin></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="../" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-bootstrap-fill" viewBox="0 0 16 16">
                    <path d="M6.375 7.125V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23zm0 3.762h1.898c1.184 0 1.81-.48 1.81-1.377 0-.885-.65-1.348-1.886-1.348H6.375z"/>
                    <path d="M4.002 0a4 4 0 0 0-4 4v8a4 4 0 0 0 4 4h8a4 4 0 0 0 4-4V4a4 4 0 0 0-4-4zm1.06 12V3.545h3.399c1.587 0 2.543.809 2.543 2.11 0 .884-.65 1.675-1.483 1.816v.1c1.143.117 1.904.931 1.904 2.033 0 1.488-1.084 2.396-2.888 2.396z"/>
                </svg>
            </a>
        </div>
        <c:choose>
            <c:when test="${loggedMemberDto ne null}">
                <div class="col-md-3 text-end">
                    <img src="${pageContext.request.contextPath}/upload/${loggedMemberDto.renameProfile}" class="profile">
                    <a href="../member/info?userId=${loggedMemberDto.userId}" class="btn btn-outline-primary">${loggedMemberDto.userName}</a>
                    <a href="../member/logout" class="btn btn-primary">LogOut</a>
                    <a href="../board/list" class="btn btn-primary">Board</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-md-3 text-end">
                    <a href="../member/login" class="btn btn-outline-primary">Login</a>
                    <a href="../member/signup" class="btn btn-primary">Sign-up</a>
                    <a href="../board/list" class="btn btn-primary">Board</a>
                </div>
            </c:otherwise>
        </c:choose>



    </header>
    <main>