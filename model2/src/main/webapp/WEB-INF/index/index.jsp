<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <!-- Slider main container -->
    <div class="main-visual">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <c:forEach items="${visualDtoList}" var="item">
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/upload/${item.renameFile}" class="img">
                    <div class="txt-box">
                        <p class="main-txt">${item.mainTxt}</p>
                        <p class="sub-txt">${item.subTxt}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</main>
<script>
    const swiper = new Swiper(".main-visual", {});
</script>
<%@ include file="../include/footer.jsp" %>