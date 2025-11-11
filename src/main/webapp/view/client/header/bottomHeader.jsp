<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/view/client/assets" var="url"/>

<div class="aa-header-bottom">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="aa-header-bottom-area">

          <!-- logo -->
          <div class="aa-logo">
            <a href="${pageContext.request.contextPath}/">
              <img src="${url}/images/logo.png" alt="logo img" width="100%">
            </a>
          </div>

          <!-- Shipping service -->
          <div class="aa-shipping-box">
            <a class="aa-shipping-boxsmall">
              <span class="aa-shipping-boxsmall-icon fas fa-shipping-fast"></span>
              <span class="aa-shipping-box-text">
                <div class="aa-shipping-title">Miễn phí vận chuyển</div>
                <div>Khu vực TP HCM</div>
              </span>
            </a>

            <a class="aa-shipping-boxsmall">
              <span class="aa-shipping-boxsmall-icon fas fa-phone"></span>
              <span class="aa-shipping-box-text">
                <div class="aa-shipping-title">Hỗ trợ: 037.7026.186</div>
                <div>Tư vấn 24/7 miễn phí</div>
              </span>
            </a>

            <a class="aa-shipping-boxsmall">
              <span class="aa-shipping-boxsmall-icon fas fa-truck"></span>
              <span class="aa-shipping-box-text">
                <div class="aa-shipping-title">Giao hàng toàn quốc</div>
                <div>Đảm bảo uy tín, chất lượng</div>
              </span>
            </a>
          </div>

          <!-- CART BOX -->
          <div class="aa-cartbox" style="position:relative;">
            <!-- nút icon -->
            <a class="aa-cart-link" href="javascript:void(0)" onclick="toggleMiniCart()">
              <span class="fas fa-cart-arrow-down"></span>
              <span class="aa-cart-title">GIỎ HÀNG</span>
              <c:if test="${not empty length_order}">
                <span class="aa-cart-notify">${length_order}</span>
              </c:if>
            </a>

            <!-- mini cart: chỉ hiển thị khi có sản phẩm -->
            <c:if test="${not empty order and not empty order.items}">
              <div id="aa-mini-cart" class="aa-cartbox-summary"
                   style="display:none; position:absolute; right:0; top:40px; z-index:9999;">
                <ul class="scroll-product">
                  <c:forEach items="${order.items}" var="item">
                    <li>
                      <a class="aa-cartbox-img"
                         href="${pageContext.request.contextPath}/view/client/product-detail?id=${item.product.id}">
                        <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${item.product.image_link}"
                             alt="${item.product.name}"
                             onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/no-image.jpg'">
                      </a>
                      <div class="aa-cartbox-info">
                        <h4>${item.product.name}</h4>
                        <p>
                          ${item.qty} x
                          <fmt:formatNumber value="${item.price}" type="number" maxFractionDigits="0"/> VNĐ
                        </p>
                      </div>
                    </li>
                  </c:forEach>
                </ul>

                <div class="total-detailproduct">
                  <span class="aa-cartbox-total-title"><b>Tổng:</b></span>
                  <span class="aa-cartbox-total-price">
                    <fmt:formatNumber value="${sumprice}" type="number" maxFractionDigits="0"/> VNĐ
                  </span>
                </div>

                <!-- nút xem giỏ hàng & thanh toán -->
                <a class="aa-cartbox-checkout aa-primary-btn"
                   href="${pageContext.request.contextPath}/view/client/cart">
                  Xem giỏ hàng
                </a>
                <a class="aa-cartbox-checkout aa-primary-btn"
                   href="${pageContext.request.contextPath}/view/client/checkout">
                  Thanh toán
                </a>
              </div>
            </c:if>
          </div>
          <!-- / CART BOX -->

        </div>
      </div>
    </div>
  </div>
</div>

<script>
  function toggleMiniCart() {
    // nếu chưa có giỏ hàng thì chuyển thẳng sang trang cart
    var hasItems = ${not empty order and not empty order.items ? "true" : "false"};
    if (!hasItems) {
      window.location = '${pageContext.request.contextPath}/view/client/cart';
      return;
    }

    var box = document.getElementById('aa-mini-cart');
    if (!box) {
      window.location = '${pageContext.request.contextPath}/view/client/cart';
      return;
    }
    box.style.display = (box.style.display === 'block') ? 'none' : 'block';
  }

  // click ra ngoài thì đóng mini cart
  document.addEventListener('click', function (e) {
    var box = document.getElementById('aa-mini-cart');
    var trigger = document.querySelector('.aa-cartbox');
    if (!box || !trigger) return;
    if (!trigger.contains(e.target)) {
      box.style.display = 'none';
    }
  });
</script>
<style>
  /* Mini Cart Box - Làm nền trắng và có bóng */
  #aa-mini-cart {
    background-color: #fff !important;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    padding: 10px;
    width: 300px;
  }

  #aa-mini-cart ul.scroll-product {
    max-height: 200px;
    overflow-y: auto;
    margin-bottom: 10px;
  }

  #aa-mini-cart li {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    padding: 6px 0;
  }

  #aa-mini-cart li img {
    width: 50px;
    height: 50px;
    border-radius: 4px;
    margin-right: 10px;
    object-fit: cover;
  }

  #aa-mini-cart .aa-cartbox-info h4 {
    font-size: 13px;
    margin: 0;
    color: #333;
  }

  #aa-mini-cart .aa-cartbox-info p {
    margin: 0;
    color: #777;
    font-size: 12px;
  }

  #aa-mini-cart .total-detailproduct {
    margin: 10px 0;
    text-align: right;
    font-weight: bold;
    color: #000;
  }

  #aa-mini-cart .aa-cartbox-checkout {
    display: inline-block;
    width: 48%;
    text-align: center;
    background: #007bff;
    color: #fff !important;
    border-radius: 4px;
    padding: 6px 0;
    margin-right: 2%;
    text-decoration: none;
    transition: 0.2s;
  }

  #aa-mini-cart .aa-cartbox-checkout:last-child {
    background: #28a745;
    margin-right: 0;
  }

  #aa-mini-cart .aa-cartbox-checkout:hover {
    opacity: 0.9;
  }
</style>
<style>
  /* === MINI CART FIX NỀN TRẮNG === */
  #aa-mini-cart {
    background: #fff !important;
    border: 1px solid #ccc !important;
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    padding: 10px;
    width: 310px;
    color: #333;
    backdrop-filter: none !important; /* loại bỏ trong suốt */
    z-index: 99999 !important;
  }

  #aa-mini-cart ul.scroll-product {
    max-height: 220px;
    overflow-y: auto;
    margin-bottom: 10px;
  }

  #aa-mini-cart li {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    padding: 6px 0;
    background: #fff;
  }

  #aa-mini-cart li img {
    width: 55px;
    height: 55px;
    border-radius: 5px;
    margin-right: 10px;
    object-fit: cover;
  }

  #aa-mini-cart .aa-cartbox-info h4 {
    font-size: 13px;
    margin: 0;
    color: #222;
  }

  #aa-mini-cart .aa-cartbox-info p {
    margin: 0;
    color: #555;
    font-size: 12px;
  }

  #aa-mini-cart .total-detailproduct {
    margin: 8px 0;
    text-align: right;
    font-weight: bold;
    color: #000;
  }

  #aa-mini-cart .aa-cartbox-checkout {
    display: inline-block;
    width: 48%;
    text-align: center;
    background: #007bff;
    color: #fff !important;
    border-radius: 5px;
    padding: 6px 0;
    margin-right: 2%;
    text-decoration: none;
    font-size: 13px;
    transition: 0.2s;
  }

  #aa-mini-cart .aa-cartbox-checkout:last-child {
    background: #28a745;
    margin-right: 0;
  }

  #aa-mini-cart .aa-cartbox-checkout:hover {
    opacity: 0.9;
  }
</style>
<style>
  /* Ghi đè triệt để CSS cũ làm nền trong suốt */
  .aa-cartbox-summary, 
  #aa-mini-cart {
    background-color: #fff !important; /* nền trắng */
    backdrop-filter: none !important;
    background: #fff !important;
    opacity: 1 !important;
  }

  /* Nếu vẫn bị mờ do hiệu ứng animation */
  .aa-cartbox-summary::before,
  .aa-cartbox-summary::after {
    background: none !important;
    opacity: 0 !important;
  }
</style>
<style>
  /* === SỬA MÀU CHỮ NÚT MINI CART === */
  #aa-mini-cart .aa-cartbox-checkout {
    color: #fff !important;         /* chữ trắng */
    background-color: #007bff !important; /* nền xanh lam */
    border: none !important;
    font-weight: 600;
    text-transform: none;
  }

  #aa-mini-cart .aa-cartbox-checkout:last-child {
    background-color: #28a745 !important; /* nút thứ hai: nền xanh lá */
    color: #fff !important;
  }

  #aa-mini-cart .aa-cartbox-checkout:hover {
    filter: brightness(0.9);
    text-decoration: none;
  }
</style>


