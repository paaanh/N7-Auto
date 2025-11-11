<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<jsp:include page="./banner-slider/slider.jsp" flush="true" />

<!-- ======================= DANH MỤC XE ======================= -->
<section id="aa-product">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="aa-product-area">
          <div class="aa-product-inner">

            <ul class="nav nav-tabs aa-products-tab">
              <li class="active"><a href="#xe_dien" data-toggle="tab">Xe Điện</a></li>
              <li><a href="#xe_thethao" data-toggle="tab">Xe Thể Thao</a></li>
              <li><a href="#xe_suv" data-toggle="tab">Xe SUV</a></li>
              <li><a href="#xe_sedan" data-toggle="tab">Xe Sedan</a></li>
              <li><a href="#xe_bantai" data-toggle="tab">Xe Bán Tải</a></li>
              <li><a href="#phukien" data-toggle="tab">Phụ Kiện Ô Tô</a></li>
              <li><a href="#sieuxe" data-toggle="tab">Siêu Xe & Giới Hạn</a></li>
            </ul>

            <div class="tab-content">
              <!-- ================= XE ĐIỆN ================= -->
              <div class="tab-pane fade in active" id="xe_dien">
                <ul class="aa-product-catg">
                  <c:forEach items="${xe_dien}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <a class="aa-add-card-btn"
                           href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}">
                           <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                        </a>
                        <figcaption>
                          <h4 class="aa-product-title"><a href="#">${product.name}</a></h4>
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

              <!-- ================= XE THỂ THAO ================= -->
              <div class="tab-pane fade" id="xe_thethao">
                <ul class="aa-product-catg">
                  <c:forEach items="${xe_thethao}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <a class="aa-add-card-btn"
                           href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}">
                           <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                        </a>
                        <figcaption>
                          <h4 class="aa-product-title">${product.name}</h4>
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

              <!-- ================= XE SUV ================= -->
              <div class="tab-pane fade" id="xe_suv">
                <ul class="aa-product-catg">
                  <c:forEach items="${xe_suv}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <a class="aa-add-card-btn"
                           href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}">
                           <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                        </a>
                        <figcaption>
                          <h4 class="aa-product-title">${product.name}</h4>
                          <span class="aa-product-price">${product.price} VNĐ</span>
                        </figcaption>
                      </figure>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <!-- ================= XE SEDAN ================= -->
              <div class="tab-pane fade" id="xe_sedan">
                <ul class="aa-product-catg">
                  <c:forEach items="${xe_sedan}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <figcaption>
                          <h4>${product.name}</h4>
                          <span>${product.price} VNĐ</span>
                        </figcaption>
                      </figure>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <!-- ================= XE BÁN TẢI ================= -->
              <div class="tab-pane fade" id="xe_bantai">
                <ul class="aa-product-catg">
                  <c:forEach items="${xe_bantai}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <figcaption>
                          <h4>${product.name}</h4>
                          <span>${product.price} VNĐ</span>
                        </figcaption>
                      </figure>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <!-- ================= PHỤ KIỆN ================= -->
              <div class="tab-pane fade" id="phukien">
                <ul class="aa-product-catg">
                  <c:forEach items="${phukien}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <figcaption>
                          <h4>${product.name}</h4>
                          <span>${product.price} VNĐ</span>
                        </figcaption>
                      </figure>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <!-- ================= SIÊU XE ================= -->
              <div class="tab-pane fade" id="sieuxe">
                <ul class="aa-product-catg">
                  <c:forEach items="${sieuxe}" var="product" end="7">
                    <li>
                      <figure>
                        <a class="aa-product-img"
                           href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">
                          <img src="${pageContext.request.contextPath}/view/client/assets/images/products/${product.image_link}" alt="${product.name}">
                        </a>
                        <figcaption>
                          <h4>${product.name}</h4>
                          <span>${product.price} VNĐ</span>
                        </figcaption>
                      </figure>
                    </li>
                  </c:forEach>
                </ul>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Tin tức -->
<section id="aa-latest-blog">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="aa-latest-blog-area">
          <h2>TIN TỨC NỔI BẬT</h2>
          <div class="row">
            <c:forEach items="${boardnewlist}" var="boardnew" end="2">
              <div class="col-md-4 col-sm-4">
                <div class="aa-latest-blog-single">
                  <figure class="aa-blog-img">
                    <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}">
                      <img src="${pageContext.request.contextPath}/view/client/assets/images/news/${boardnew.image_link}" alt="${boardnew.title}">
                    </a>
                    <figcaption class="aa-blog-img-caption">
                      <i class="fa fa-clock-o"></i> ${boardnew.created}
                    </figcaption>
                  </figure>
                  <div class="aa-blog-info">
                    <h3>${boardnew.title}</h3>
                    <p>${boardnew.content}</p>
                    <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}" class="aa-read-mor-btn">Xem thêm <span class="fa fa-long-arrow-right"></span></a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />
