<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url" />

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<section id="aa-catg-head-banner">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Kết quả tìm kiếm</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>         
          <li style="color:#fff">Tìm kiếm xe</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Product (Car) Category -->
<section id="aa-product-category">
  <div class="container">
    <div class="row">
      <!-- Khu vực kết quả -->
      <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
        <div class="aa-product-catg-content">
          <div class="aa-product-catg-body">
            
            <c:choose>
              <c:when test="${empty productlist}"> 
                <p style="display:none;">Kết quả tìm kiếm cho từ khóa: <strong>${param.s}</strong></p>
              </c:when>
              <c:otherwise>
                <p style="margin-bottom:30px;">
                  Kết quả tìm kiếm cho từ khóa: 
                  <strong style="color:#007bff;">"${param.s}"</strong>
                </p>
              </c:otherwise>
            </c:choose>

            <ul class="aa-product-catg">
              <!-- Nếu không có kết quả -->
              <c:if test="${empty productlist}">
                <p style="margin-left:30px; font-size:16px;">
                  ❌ Không tìm thấy mẫu xe nào phù hợp!
                </p>
              </c:if>
              
              <!-- Danh sách xe -->
              <c:forEach items="${productlist}" var="product">
                <li style="box-shadow:0 0 10px rgba(0,0,0,0.1);border-radius:8px;">
                  <figure>
                    <a class="aa-product-img"
                       href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                      <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}"
                           alt="${product.name}"
                           style="height:200px;object-fit:cover;border-radius:8px 8px 0 0;">
                    </a>
                    <a class="aa-add-card-btn"
                       href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}">
                       <span class="fa fa-shopping-cart"></span> Đặt xe ngay
                    </a>
                    <figcaption style="padding:10px;">
                      <h4 class="aa-product-title">
                        <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          ${product.name}
                        </a>
                      </h4>
                      
                      <c:choose>
                        <c:when test="${product.discount == 0}">
                          <span class="aa-product-price" style="color:#007bff;font-weight:600;">
                            ${product.price} VNĐ
                          </span>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${productlist1}" var="product1">
                            <c:if test="${product1.id == product.id}">
                              <span class="aa-product-price" style="color:#007bff;font-weight:600;">
                                ${product1.price} VNĐ
                              </span>
                              <span class="aa-product-price">
                                <del>${product.price} VNĐ</del>
                              </span>
                            </c:if>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </figcaption>
                  </figure>
                  
                  <c:if test="${product.discount != 0}">
                    <span class="aa-badge aa-sale">-${product.discount}%</span>
                  </c:if>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>

      <!-- Sidebar -->
      <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
        <aside class="aa-sidebar">
          <!-- Danh mục -->
          <div class="aa-sidebar-widget">
            <h3>Danh mục xe</h3>
            <ul class="aa-catg-nav">
              <c:forEach items="${catelist}" var="cate">
                <li>
                  <a href="${pageContext.request.contextPath}/view/client/product-id?id=${cate.id}">
                    ${cate.name}
                  </a>
                </li>
              </c:forEach>                
            </ul>
          </div>

          <!-- Xe gần đây -->
          <div class="aa-sidebar-widget">
            <h3>Xe nổi bật</h3>
            <div class="aa-recently-views">
              <ul>
                <c:forEach items="${productlist}" var="product" end="2">
                  <li>
                    <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"
                       class="aa-cartbox-img">
                       <img alt="${product.name}"
                            src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}">
                    </a>
                    <div class="aa-cartbox-info">
                      <h4>
                        <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          ${product.name}
                        </a>
                      </h4>
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

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />
