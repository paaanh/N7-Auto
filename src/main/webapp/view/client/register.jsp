<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url" />

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<style>
  body {
    margin: 0;
    background: linear-gradient(135deg, #f8f9fb, #ffffff);
  }

  /* Vùng bao phủ toàn bộ màn hình, loại bỏ ảnh hưởng bootstrap */
  .auth-wrapper {
    position: relative;
    width: 100vw;
    min-height: calc(100vh - 160px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0;
    margin: 0;
    overflow: hidden;
  }

  /* Khung form nằm giữa */
  .auth-card {
    width: 100%;
    max-width: 480px;
    background: #fff;
    border-radius: 14px;
    padding: 40px 50px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    text-align: center;
  }

  .auth-title {
    color: #ff6600;
    font-weight: 800;
    margin-bottom: 25px;
    text-transform: uppercase;
    text-shadow: 0 0 4px rgba(255,102,0,0.2);
  }

  .form-group {
    text-align: left;
    margin-bottom: 18px;
  }

  .form-group label {
    font-weight: 600;
    margin-bottom: 5px;
    display: inline-block;
  }

  .form-group input {
    width: 100%;
    padding: 10px 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
    outline: none;
    transition: all 0.2s;
  }

  .form-group input:focus {
    border-color: #ff6600;
    box-shadow: 0 0 6px rgba(255, 102, 0, 0.3);
  }

  .btn-orange {
    background: linear-gradient(90deg, #ff6600, #ff8533);
    border: none;
    color: #fff;
    font-weight: 700;
    padding: 10px 24px;
    border-radius: 8px;
    transition: all 0.3s;
  }

  .btn-orange:hover {
    opacity: 0.9;
  }

  .btn-gray {
    background: #ccc;
    border: none;
    color: #333;
    font-weight: 600;
    padding: 10px 24px;
    border-radius: 8px;
  }

  .auth-footer {
    margin-top: 16px;
    font-size: 15px;
  }

  /* Loại bỏ padding mặc định của Bootstrap container */
  #aa-myaccount .container,
  #aa-myaccount .row,
  #aa-myaccount .col-md-12 {
    padding: 0 !important;
    margin: 0 !important;
    width: 100%;
  }

  @media (max-width: 768px) {
    .auth-card {
      padding: 28px 20px;
    }
  }
</style>

<!-- Form đăng ký -->
<section id="aa-myaccount">
  <div class="auth-wrapper">
    <div class="auth-card">
      <h2 class="auth-title">ĐĂNG KÝ TÀI KHOẢN</h2>

      <form name="formRegister"
            class="aa-login-form"
            method="post"
            action="${pageContext.request.contextPath}/view/client/register">

        <div class="form-group">
          <label>Họ và tên <span style="color:red">*</span></label>
          <input type="text" placeholder="Nhập họ tên đầy đủ" name="name" required>
        </div>

        <div class="form-group">
          <label>Email <span style="color:red">*</span></label>
          <input type="email" placeholder="useremail@gmail.com" name="email" required>
        </div>

        <div class="form-group">
          <label>Số điện thoại <span style="color:red">*</span></label>
          <input type="text" placeholder="Số điện thoại" name="phone" required pattern="[0-9]{9,11}">
        </div>

        <div class="form-group">
          <label>Tên đăng nhập <span style="color:red">*</span></label>
          <input type="text" placeholder="Username" name="username" required>
        </div>

        <div class="form-group">
          <label>Mật khẩu <span style="color:red">*</span></label>
          <input type="password" placeholder="Mật khẩu" name="password" required>
        </div>

        <input type="date" name="created" id="the-date" style="display:none;">

        <div style="color:red; font-weight:600; margin-bottom:10px;">
          <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
          <%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%>
        </div>

        <div style="display:flex; justify-content:center; gap:12px;">
          <button type="reset" class="btn-gray">Đặt lại</button>
          <button type="submit" class="btn-orange">Đăng ký</button>
        </div>

        <p class="auth-footer">
          Đã có tài khoản?
          <a href="${pageContext.request.contextPath}/view/client/login" style="color:#007bff; font-weight:600;">
            Đăng nhập ngay
          </a>
        </p>
      </form>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />

<!-- Script đặt ngày hiện tại -->
<script>
  (function(){
    const d = new Date();
    const v = [d.getFullYear(), String(d.getMonth()+1).padStart(2,'0'), String(d.getDate()).padStart(2,'0')].join('-');
    const el = document.getElementById('the-date');
    if (el) el.value = v;
  })();
</script>
