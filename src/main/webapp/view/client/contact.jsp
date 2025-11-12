<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->

<section id="aa-contact">
  <div class="container">
    <div class="row">
    	<h1 style="
		  text-align: center;
		  color: #ff6600;
		  font-weight: 800;
		  text-shadow: 0 0 6px rgba(255,102,0,0.4);
		  letter-spacing: 1px;
		  margin-top: 40px;
		">
		  LIÊN HỆ KHÁCH HÀNG
		</h1>

      <div class="col-md-12">
        <div class="aa-contact-area">
          <div class="aa-contact-top">
            <h2>Chúng tôi đang chờ để hỗ trợ bạn..</h2>
            <p>Nếu bạn có bất cứ thắc mắc hay ý kiến gì, hãy liên hệ với chúng tôi.</p>
          </div>

          <!-- Contact address -->
          <div class="aa-contact-address">
            <div class="row">
              <!-- Bản đồ -->
              <div class="col-md-7">
                <div class="aa-contact-map" style="border-radius: 8px; overflow: hidden;">
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
                <div class="aa-contact-address-right">
                  <address>
                    <h4>N7 Auto</h4>
                    <p>Liên hệ cho chúng tôi bất cứ khi nào bạn cần.</p>
                    <p><span class="fa fa-home"></span> 96A Đ. Trần Phú, P. Mộ Lao, Hà Đông, Hà Nội, Việt Nam</p>
                    <p><span class="fa fa-phone"></span> 0838612005</p>
                    <p><span class="fa fa-envelope"></span> Email: tiendz09711@gmail.com</p>
                    <a href="https://www.google.com/maps/dir/?api=1&destination=20.980668,105.787177" 
                       target="_blank" 
                       class="btn btn-success" 
                       style="margin-top:10px;">
                      Xem đường đi
                    </a>
                  </address>
                </div>
              </div>
            </div>
          </div> <!-- end contact address -->
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ===================== -->
<!-- FOOTER -->
<!-- ===================== -->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
