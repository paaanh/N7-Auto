<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="
  background-color:#1565c0;
  padding:10px 0;
  color:white;
  font-weight:600;
  position:relative;">
  <div class="container">
    <div style="display:flex; justify-content:space-between; align-items:center;">
      
      <!-- Logo -->
      <div style="display:flex; align-items:center; gap:10px;">
        <a href="${pageContext.request.contextPath}/">
          <img src="${pageContext.request.contextPath}/view/client/assets/images/logo.png"
               alt="N7 Auto"
               style="height:55px; border-radius:8px;">
        </a>
        <h2 style="color:#00ffff; font-weight:800; text-shadow:0 0 8px #00ffff; margin:0;">
          N7<br>AUTO
        </h2>
      </div>

      <!-- Đăng ký / Đăng nhập + Giỏ hàng -->
      <div style="display:flex; align-items:center; gap:15px;">
        <a href="${pageContext.request.contextPath}/view/client/register"
           style="color:white;">Đăng ký</a>
        <a href="${pageContext.request.contextPath}/view/client/login"
           style="color:white;">Đăng nhập</a>

        <a href="${pageContext.request.contextPath}/view/client/cart"
           style="color:white; position:relative;">
          <span class="fa fa-shopping-cart" style="font-size:20px;"></span>
          <c:if test="${sessionScope.cart != null}">
            <span style="position:absolute; top:-8px; right:-10px; background:red; color:white;
                         font-size:12px; border-radius:50%; padding:2px 6px;">
              ${sessionScope.cart.size()}
            </span>
          </c:if>
          <span style="margin-left:4px;">Giỏ hàng</span>
        </a>
      </div>

    </div>
  </div>
</div>

