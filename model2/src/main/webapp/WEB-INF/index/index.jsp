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
            <div class="swiper-slide"><img src="../images/main/slide01.jpg" class="img"></div>
            <div class="swiper-slide"><img src="../images/main/slide02.jpg" class="img"></div>
            <div class="swiper-slide"><img src="../images/main/slide03.jpg" class="img"></div>
        </div>
    </div>
</main>
<script>
    const swiper = new Swiper(".main-visual", {});
</script>
<%@ include file="../include/footer.jsp" %>