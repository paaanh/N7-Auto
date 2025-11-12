<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/view/client/assets" var="url"/>

<!-- Header -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<!-- Banner -->
<section id="aa-catg-head-banner">
  <img src="${pageContext.request.contextPath}/view/client/assets/images/banner-contact.jpg" 
       alt="banner liên hệ" 
       style="width:100%; max-height:300px; object-fit:cover;">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Liên hệ N7 Auto</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>         
          <li style="color:#fff">Liên hệ</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Contact Section -->
<section id="aa-contact" style="padding:60px 0;background:#f9f9f9;">
  <div class="container">
    <div class="row">
      <h1 style="
        text-align:center;
        color:#ff6600;
        font-weight:800;
        text-shadow:0 0 6px rgba(255,102,0,0.4);
        letter-spacing:1px;
        margin-bottom:40px;
      ">
        LIÊN HỆ KHÁCH HÀNG
      </h1>

      <div class="col-md-12">
        <div class="aa-contact-area">
          <div class="aa-contact-top text-center" style="margin-bottom:40px;">
            <h2 style="font-weight:700;">Chúng tôi sẵn sàng hỗ trợ bạn</h2>
            <p>Nếu bạn có bất kỳ thắc mắc, góp ý hoặc cần tư vấn xe, hãy liên hệ với chúng tôi.</p>
          </div>

          <!-- Contact Info -->
          <div class="aa-contact-address">
            <div class="row">
              <!-- Bản đồ -->
              <div class="col-md-7">
                <div class="aa-contact-map shadow" style="border-radius:12px;overflow:hidden;">
                  <iframe
                    src="https://www.google.com/maps?q=20.98094555871168,105.78741844576956&hl=vi&z=16&output=embed"
                    width="100%"
                    height="450"
                    style="border:0;"
                    allowfullscreen=""
                    loading="lazy">
                  </iframe>
                </div>
              </div>

              <!-- Thông tin liên hệ -->
              <div class="col-md-5">
                <div class="aa-contact-address-right shadow" 
                     style="background:white;border-radius:12px;padding:30px;margin-top:10px;">
                  <address>
                    <h4 style="color:#007bff;font-weight:700;">N7 Auto</h4>
                    <p>Liên hệ với chúng tôi bất cứ khi nào bạn cần hỗ trợ.</p>
                    <p><span class="fa fa-home"></span> 96A Đ. Trần Phú, P. Mộ Lao, Hà Đông, Hà Nội</p>
                    <p><span class="fa fa-phone"></span> 0838 612 005</p>
                    <p><span class="fa fa-envelope"></span> tiendz09711@gmail.com</p>
                    <a href="https://www.google.com/maps/dir/?api=1&destination=20.980668,105.787177" 
                       target="_blank" 
                       class="btn btn-warning"
                       style="margin-top:10px;color:white;font-weight:600;">
                      <i class="fa fa-map-marker"></i> Xem đường đi
                    </a>
                  </address>
                </div>
              </div>
            </div>
          </div> <!-- End contact info -->
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />
