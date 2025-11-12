<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<jsp:include page="./banner-slider/slider.jsp" flush="true" />

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
