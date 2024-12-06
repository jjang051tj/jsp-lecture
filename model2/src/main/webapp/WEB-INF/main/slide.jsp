<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-12-06
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main>
    <h2 class="my-5">MAIN SLIDER</h2>
    <form action="../main/slide" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="main-txt" class="form-label fw-bold fs-5">MAIN MESSAGE</label>
            <input type="text" class="form-control form-control" name="main-txt" id="main-txt"
                   placeholder="write main message">
        </div>
        <div class="mb-3">
            <label for="sub-txt" class="form-label fw-bold fs-5">SUB MESSAGE</label>
            <input type="text" class="form-control form-control" name="main-txt" id="sub-txt"
                   placeholder="write sub message">
        </div>
        <div class="mb-3">
            <label for="visual" class="form-label fw-bold fs-5">VISUAL</label>
            <input type="file" class="form-control form-control" name="visual" id="visual" placeholder="visual"
                   accept="image/gif,image/jpg,image/jpeg, image/png">
        </div>
        <div class="mb-3">
            <div id="preview"></div>
        </div>
        <div class="mt-5">
            <button class="btn btn-primary">CONFIRM</button>
        </div>
    </form>
</main>
<script>
    const visual = document.querySelector("#visual");
    const preview = document.querySelector("#preview");
    visual.addEventListener("change",e=>{
        //console.log(e);
        const file = e.target.files[0];
        console.log(e.target);
        console.log(file);
        if(!file) {
            preview.innerHTML="";
            return false;
        }
        const extension =file.name.substring(file.name.lastIndexOf(".")+1).toLowerCase();
        const imgArray = ["png","jpg","jpeg","gif"];
        if(!imgArray.includes(extension)) {
            alert("이미지만 업로드 가능합니다.");
            visual.value="";
            return false;
        }
        // if(!(extension==="png"|| extension==="jpg" ||extension==="jpeg" || extension==="gif")) {
        //     alert("이미지만 업로드 가능합니다.");
        //     visual.value="";
        //     return false;
        // }
        const fileReader = new FileReader();
        fileReader.addEventListener("load",e=>{
            const img = e.target.result;
            preview.innerHTML = "<img src="+img+">";
        });
        fileReader.readAsDataURL(file);
    })
</script>
<%@ include file="../include/footer.jsp" %>
