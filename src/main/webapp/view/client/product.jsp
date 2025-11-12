<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />
<!-- /Header -->

<!-- Banner -->
<section id="aa-catg-head-banner">
  <img src="${pageContext.request.contextPath}/view/client/assets/images/4.jpg"
       alt="banner sản phẩm" 
       style="width:100%;object-fit:cover;max-height:300px;">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>SHOWROOM</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
          <li style="color:#fff">Danh sách xe</li>
        </ol>
      </div>
    </div>
  </div>
</section>
<!-- /Banner -->

<!-- Product category -->
<section id="aa-product-category" style="background:#fff;">
  <div class="container-fluid" style="max-width:95%; padding:20px 40px;">
    <div class="row">

      <!-- Product list -->
      <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3" style="padding-right:30px;">
        <div class="aa-product-catg-content">
          <div class="aa-product-catg-body">

            <!-- Lưới 3 cột cố định -->
            <ul class="aa-product-catg" style="
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 24px;
                list-style: none;
                padding: 0;
                margin: 0 auto;
              ">

              <c:if test="${empty productlist}">
                <p style="margin-left:30px;">Chưa có sản phẩm!</p>
              </c:if>

              <c:forEach items="${productlist}" var="product">
                <li style="border:1px solid #eee; border-radius:10px; background:#fff; padding:10px; transition:0.3s; position:relative;">
                  <figure style="margin:0; text-align:center;">
                    <!-- Ảnh sản phẩm -->
                    <a class="aa-product-img"
                       href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                      <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}"
                           alt="${product.name}"
                           style="width:100%; height:240px; object-fit:cover; border-radius:6px;"
                           onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/logo.png'">
                    </a>

                    <!-- Nút thêm giỏ hàng -->
                    <a class="aa-add-card-btn"
                       href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"
                       style="display:inline-block; margin-top:8px; font-weight:600;">
                      <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                    </a>

                    <figcaption style="margin-top:8px;">
                      <h4 class="aa-product-title" style="font-size:16px; font-weight:700;">
                        <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          ${product.name}
                        </a>
                      </h4>

                      <!-- Giá -->
                      <c:choose>
                        <c:when test="${product.discount == 0}">
                          <span class="aa-product-price">${product.price} VNĐ</span>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${productlist1}" var="product1">
                            <c:if test="${product1.id == product.id}">
                              <span class="aa-product-price" style="color:#e60000; font-weight:700;">${product1.price} VNĐ</span>
                              <span class="aa-product-price"><del>${product.price} VNĐ</del></span>
                            </c:if>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </figcaption>
                  </figure>

                  <!-- Badge giảm giá -->
                  <c:if test="${product.discount != 0}">
                    <span class="aa-badge aa-sale" style="position:absolute; top:10px; left:10px; background:#2ca02c; color:white; font-weight:700; padding:4px 8px; border-radius:4px;">
                      -${product.discount}%
                    </span>
                  </c:if>
                </li>
              </c:forEach>

              <!-- Thêm ô trống để giữ 3 cột luôn đều -->
              <c:forEach begin="1" end="${3 - fn:length(productlist)}" var="i">
                <li style="border:none; background:transparent;"></li>
              </c:forEach>

            </ul>

          </div>
        </div>
      </div>

      <!-- Sidebar -->
      <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9" style="background:#fafafa; padding:20px; border-radius:10px;">
        <aside class="aa-sidebar">
          <div class="aa-sidebar-widget">
            <h3>Danh mục</h3>
            <ul class="aa-catg-nav">
              <c:forEach items="${catelist}" var="cate">
                <li><a href="${pageContext.request.contextPath}/view/client/product-category?cid=${cate.id}">
                  ${cate.name}
                </a></li>
              </c:forEach>
            </ul>
          </div>

          <div class="aa-sidebar-widget">
            <h3>Sản phẩm gần đây</h3>
            <div class="aa-recently-views">
              <ul>
                <c:forEach items="${productlist}" var="product" end="2">
                  <li style="margin-bottom:12px;">
                    <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}" class="aa-cartbox-img">
                      <img alt="${product.name}"
                           src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}"
                           style="width:70px; height:70px; object-fit:cover; border-radius:4px; margin-right:10px;"
                           onerror="this.src='${pageContext.request.contextPath}/view/client/assets/images/logo.png'">
                    </a>
                    <div class="aa-cartbox-info">
                      <h4><a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                        ${product.name}
                      </a></h4>
                      <c:choose>
                        <c:when test="${product.discount == 0}">
                          <p>${product.price} VNĐ</p>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${productlist1}" var="product1">
                            <c:if test="${product1.id == product.id}">
                              <p>${product1.price} VNĐ</p>
                            </c:if>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </aside>
      </div>

    </div>
  </div>
</section>
<!-- /Product category -->

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />
<!-- /Footer -->
