
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<section id="aa-catg-head-banner">
  <img src="${pageContext.request.contextPath}/view/client/assets/images/banner-cart.png" 
       alt="banner giỏ hàng" 
       style="width:100%; max-height:300px; object-fit:cover;">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Giỏ hàng</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
          <li style="color:#fff">Thông tin giỏ hàng</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Cart view -->
<section id="cart-view">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="cart-view-area">
          <div class="cart-view-table">
            <form action="${pageContext.request.contextPath}/view/client/cart-update" method="post">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Bỏ chọn</th>
                      <th>Ảnh</th>
                      <th>Sản phẩm</th>
                      <th>Giá</th>
                      <th>Số lượng</th>
                      <th>Giảm giá</th>
                      <th>Thành tiền</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  	<c:if test="${not empty message}">
						  <tr>
						    <td colspan="7" style="text-align:center; padding:30px;">
						      ${message}
						      <br><br>
						      <a href="${pageContext.request.contextPath}/view/client/product" class="aa-cart-view-btn">
						        Tiếp tục mua hàng
						      </a>
						    </td>
						  </tr>
						</c:if>
                  	
                    <c:choose>
                      <c:when test="${not empty order and not empty order.items}">
                        <c:forEach items="${order.items}" var="item">
                          <tr>
                            <td>
                              <a class="remove" href="${pageContext.request.contextPath}/view/client/cart-delete?id=${item.product.id}">
                                <i class="fa fa-close"></i>
                              </a>
                            </td>
                            <td>
                              <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${item.product.id}">
                                <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${item.product.image_link}"
                                     alt="${item.product.name}"
                                     style="width:80px;height:auto;border-radius:6px;"
                                     onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/no-image.jpg'">
                              </a>
                            </td>
                            <td>
                              <a class="aa-cart-title"
                                 href="${pageContext.request.contextPath}/view/client/product-detail?id=${item.product.id}">
                                 ${item.product.name}
                              </a>
                            </td>
                            <td><fmt:formatNumber value="${item.product.price.replaceAll('[^\\d.]','')}" type="number" maxFractionDigits="0"/> VNĐ</td>
                            
                            <td>
                              <input class="aa-cart-quantity" type="number" 
                                     name="${item.product.id}" value="${item.qty}" min="1">
                            </td>
                            <td>${item.product.discount}%</td>
                            <td>${item.price} VNĐ</td>
                          </tr>
                        </c:forEach>

                        <tr>
                          <td colspan="6"><strong>TỔNG TIỀN</strong></td>
                          <td><strong>${sumprice} VNĐ</strong></td>
                        </tr>
                        <tr>
                          <td colspan="7" class="aa-cart-view-bottom">
                            <input class="aa-cart-view-btn" type="submit" value="Cập nhật giỏ hàng">
                          </td>
                        </tr>
                      </c:when>

                      <c:otherwise>
                        <tr>
                          <td colspan="7" style="text-align:center; padding:30px;">
                            🛒 Giỏ hàng của bạn hiện đang trống.
                            <br><br>
                            <a href="${pageContext.request.contextPath}/view/client/product.jsp" 
                               class="aa-cart-view-btn">Tiếp tục mua hàng</a>
                          </td>
                        </tr>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
            </form>

            <!-- Cart summary -->
            <div class="cart-view-total">
              <h4>Thông tin giỏ hàng</h4>
              <table class="aa-totals-table">
                <tbody>
                  <tr>
                    <th>Tạm tính</th>
                    <td>${sumprice} VNĐ</td>
                  </tr>
                  <tr>
                    <th>VAT</th>
                    <td>0 VNĐ</td>
                  </tr>
                  <tr>
                    <th>Tổng cộng</th>
                    <td><strong>${sumprice} VNĐ</strong></td>
                  </tr>
                </tbody>
              </table>
              <a href="${pageContext.request.contextPath}/view/client/checkout" class="aa-cart-view-btn">
                Thanh toán
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />

<!-- Fix loader quay mãi -->
<script>
window.addEventListener('load', function() {
  document.querySelectorAll('#wpf-loader-two, .loader, .loading, .preloader')
          .forEach(el => el.remove());
  const s = document.createElement('style');
  s.innerHTML = '#wpf-loader-two, .loader, .loading, .preloader {display:none!important;visibility:hidden!important;}';
  document.head.appendChild(s);
  console.log("✅ Loader removed completely");
});
</script>
