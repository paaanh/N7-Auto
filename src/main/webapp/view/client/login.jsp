<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url" />

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Login Section -->
<section id="aa-myaccount" 
         style="
           display:flex;
           align-items:center;
           justify-content:center;
           height:calc(100vh - 200px);  /* trừ phần header/footer */
           background:linear-gradient(135deg,#f9f9f9,#fff);
         ">
  <div class="container" style="max-width:500px;">
    <div class="aa-myaccount-area" 
         style="
           background:white;
           padding:40px 50px;
           border-radius:12px;
           box-shadow:0 4px 25px rgba(0,0,0,0.1);
           text-align:center;
           width:100%;
         ">

      <h2 style="color:#ff6600; font-weight:800; margin-bottom:25px;">ĐĂNG NHẬP TÀI KHOẢN</h2>

      <form class="aa-login-form" 
            name="loginform" 
            onsubmit="return validateForm();" 
            action="${pageContext.request.contextPath}/view/client/login" 
            method="post">

        <div class="form-group text-left">
          <label for="username">Tên đăng nhập <span style="color:red">*</span></label>
          <input type="text" class="form-control" name="username" placeholder="Nhập tên đăng nhập" required>
        </div>

        <div class="form-group text-left">
          <label for="password">Mật khẩu <span style="color:red">*</span></label>
          <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" required>
        </div>

        <div class="form-group text-left" style="margin-top:10px;">
          <label>
            <input type="checkbox" name="rememberme" style="margin-right:5px;"> Ghi nhớ đăng nhập
          </label>
        </div>

        <c:if test="${not empty errorMsg}">
          <div style="color:red; font-weight:600; margin-bottom:10px;">
            ${errorMsg}
          </div>
        </c:if>

        <button type="submit" class="aa-browse-btn"
                style="
                  width:100%;
                  background:linear-gradient(90deg,#ff6600,#ff8533);
                  border:none;
                  color:white;
                  font-size:18px;
                  font-weight:700;
                  padding:10px 0;
                  border-radius:8px;
                  transition:all .3s;
                  margin-top:10px;
                "
                onmouseover="this.style.opacity='0.9'"
                onmouseout="this.style.opacity='1'">
          Đăng nhập
        </button>

        <p style="margin-top:20px;">
          Chưa có tài khoản? 
          <a href="${pageContext.request.contextPath}/view/client/register" style="color:#007bff; font-weight:600;">
            Đăng ký ngay
          </a>
        </p>
      </form>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />

<!-- Validation Script -->
<script>
function validateForm() {
  const user = document.forms["loginform"]["username"].value.trim();
  const pass = document.forms["loginform"]["password"].value.trim();
  if (user === "" || pass === "") {
    alert("Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu!");
    return false;
  }
  return true;
}
</script>
