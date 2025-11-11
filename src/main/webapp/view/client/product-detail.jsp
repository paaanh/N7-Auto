<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<section id="aa-catg-head-banner">
  <img src="${pageContext.request.contextPath}/view/client/assets/images/banner-product.png"
       alt="banner sản phẩm"
       style="width:100%;max-height:300px;object-fit:cover;">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Chi tiết sản phẩm</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
          <li><a href="${pageContext.request.contextPath}/view/client/product">Sản phẩm</a></li>
          <li style="color:#fff">${detail_product.name}</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Product Detail -->
<section id="aa-product-details">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="aa-product-details-area">
          <div class="aa-product-details-content">
            <div class="row">

              <!-- Hình ảnh sản phẩm -->
              <div class="col-md-5 col-sm-5 col-xs-12">
                <div class="aa-product-view-slider text-center" style="padding:20px;">
                  <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${detail_product.image_link}"
                       alt="${detail_product.name}"
                       style="max-width:100%;height:auto;border-radius:10px;"
                       onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/logo.png'">
                </div>
              </div>

              <!-- Thông tin chi tiết -->
              <div class="col-md-7 col-sm-7 col-xs-12">
                <div class="aa-product-view-content">
                  <h3>${detail_product.name}</h3>
                  <div class="aa-price-block">
                    <c:choose>
                      <c:when test="${detail_product.discount == 0}">
                        <span class="aa-product-price">${detail_product.price} VNĐ</span>
                      </c:when>
                      <c:otherwise>
                        <c:forEach items="${productlist1}" var="product1">
                          <c:if test="${product1.id == detail_product.id}">
                            <span class="aa-product-price"><strong>${product1.price} VNĐ</strong></span>
                            <span class="aa-product-price"><del>${detail_product.price} VNĐ</del></span>
                          </c:if>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>

                    <p class="aa-product-avilability">Tình trạng:
                      <span>
                        <c:choose>
                          <c:when test="${detail_product.status == 1}">
                            <c:out value="Còn hàng"/>
                          </c:when>
                          <c:otherwise>
                            <c:out value="Hết hàng"/>
                          </c:otherwise>
                        </c:choose>
                      </span>
                    </p>
                  </div>

                  <p>${detail_product.description}</p>

                  <div class="aa-prod-quantity">
                    <p class="aa-prod-category">
                      <c:forEach items="${name_cate_of_product}" var="name_cate">
                        <strong>Danh mục:</strong>
                        <a href="${pageContext.request.contextPath}/view/client/product-id?id=${name_cate.id}">
                          ${name_cate.name}
                        </a>
                      </c:forEach>
                    </p>
                  </div>

                  <div class="aa-prod-view-bottom">
                    <a class="aa-add-to-cart-btn"
                       href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${detail_product.id}">
                      Thêm vào giỏ hàng
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Tabs -->
          <div class="aa-product-details-bottom">
            <ul class="nav nav-tabs aa-products-tab" id="myTab2">
              <li class="active"><a href="#description" data-toggle="tab">Mô tả</a></li>
              <li><a href="#review" data-toggle="tab">Đánh giá</a></li>
            </ul>

            <div class="tab-content">
              <div class="tab-pane fade in active" id="description">
                <p>${detail_product.content}</p>
              </div>

              <div class="tab-pane fade" id="review">
                <div class="aa-product-review-area">
                  <ul class="aa-review-nav">
                    <c:forEach items="${reviewbyid}" var="review">
                      <li>
                        <div class="media">
                          <div class="media-body">
                            <h4 class="media-heading">
                              <strong>${review.name}</strong> - <span>${review.created}</span>
                            </h4>
                            <div class="aa-product-rating">
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                            </div>
                            <p>${review.content}</p>
                          </div>
                        </div>
                      </li>
                    </c:forEach>
                  </ul>

                  <h4>Thêm đánh giá</h4>
                  <form action="${pageContext.request.contextPath}/view/client/review?id=${detail_product.id}" method="post" class="aa-review-form">
                    <div class="form-group">
                      <label for="name">Tên</label>
                      <input type="text" class="form-control" id="name" placeholder="Name" name="name">
                    </div>
                    <div class="form-group">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" id="email" placeholder="example@gmail.com" name="email">
                    </div>
                    <div class="form-group">
                      <label for="message">Đánh giá của bạn</label>
                      <textarea class="form-control" rows="3" id="content" name="content"></textarea>
                    </div>
                    <button type="submit" class="btn btn-default aa-review-submit">Gửi</button>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <!-- Related Products -->
          <div class="aa-product-related-item">
            <h3>SẢN PHẨM LIÊN QUAN</h3>
            <ul class="aa-product-catg aa-related-item-slider">
              <c:forEach items="${productById}" var="product">
                <li>
                  <figure>
                    <a class="aa-product-img"
                       href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                      <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}"
                           alt="${product.name}"
                           onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/logo.png'">
                    </a>
                    <a class="aa-add-card-btn"
                       href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}">
                       <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                    </a>
                    <figcaption>
                      <h4 class="aa-product-title">
                        <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          ${product.name}
                        </a>
                      </h4>
                      <c:choose>
                        <c:when test="${product.discount == 0}">
                          <span class="aa-product-price">${product.price} VNĐ</span>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${productlist1}" var="product1">
                            <c:if test="${product1.id == product.id}">
                              <span class="aa-product-price">${product1.price} VNĐ</span>
                              <span class="aa-product-price"><del>${product.price} VNĐ</del></span>
                            </c:if>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </figcaption>
                  </figure>
                  <c:if test="${product.discount != 0}">
                    <span class="aa-badge aa-sale">- ${product.discount}%</span>
                  </c:if>
                </li>
              </c:forEach>
            </ul>
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
