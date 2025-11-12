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
        <h2>Hình thức thanh toán</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>  
          <li style="color:#fff">Hình thức thanh toán</li>       
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Nội dung chính -->
<section id="aa-product-category">
  <div class="container">
    <div class="row">
      <div>
        <h1 style="text-align: center; color: #007bff; font-weight: 700;">
          Các hình thức thanh toán của N7 Auto
        </h1>
        <p>
          Hiện tại, đối với các đơn hàng hoặc dịch vụ đặt xe trực tuyến trên website, 
          <strong>N7 Auto</strong> cung cấp những hình thức thanh toán linh hoạt và an toàn sau:
        </p>

        <!-- 1. Thanh toán tiền mặt -->
        <strong>* Thanh toán tiền mặt khi nhận xe:</strong>
        <p>
          Sau khi khách hàng đặt thuê hoặc mua xe trên website, bộ phận chăm sóc khách hàng của 
          <strong>N7 Auto</strong> sẽ liên hệ để xác nhận đơn hàng, thông báo chi tiết hợp đồng và lịch giao xe. 
          Khách hàng có thể thanh toán trực tiếp bằng tiền mặt khi nhận xe tại showroom hoặc tại địa điểm giao xe.
        </p>

        <!-- 2. Chuyển khoản ngân hàng -->
        <strong>* Thanh toán chuyển khoản ngân hàng:</strong>
        <p>
          Khách hàng có thể chuyển khoản trực tiếp vào tài khoản của <strong>N7 Auto</strong> theo thông tin bên dưới.
          Sau khi chuyển, vui lòng gửi lại biên lai giao dịch qua email hoặc Zalo của nhân viên tư vấn để được xác nhận.
        </p>

        <div style="margin-left: 20px;">
          <strong>1. Tài khoản ngân hàng Vietcombank:</strong>
          <p>
            Tên chủ tài khoản: CÔNG TY TNHH N7 AUTO<br>
            Ngân hàng: Vietcombank - Chi nhánh Hà Đông<br>
            Số tài khoản: 1234 5678 9999
          </p>

          <strong>2. Tài khoản Techcombank:</strong>
          <p>
            Tên chủ tài khoản: CÔNG TY TNHH N7 AUTO<br>
            Ngân hàng: Techcombank - Chi nhánh Trần Phú<br>
            Số tài khoản: 5678 1234 8888
          </p>
        </div>

        <!-- 3. Ví điện tử -->
        <strong>* Thanh toán qua ví điện tử:</strong>
        <p>
          <strong>N7 Auto</strong> chấp nhận thanh toán qua các ví điện tử phổ biến như:
        </p>
        <div style="margin-left: 20px;">
          <p><strong>MoMo:</strong> 0838 612 005 - Chủ tài khoản: N7 Auto</p>
          <p><strong>ZaloPay:</strong> 0838 612 005 - Chủ tài khoản: N7 Auto</p>
        </div>

        <i>
          Nếu trong quá trình thanh toán có bất kỳ sự cố nào, vui lòng liên hệ Hotline 
          <strong>0838 612 005</strong> hoặc email: 
          <a href="mailto:support@n7auto.vn">support@n7auto.vn</a> để được hỗ trợ.
        </i>

        <br><br>
        <p style="text-align:center;">
          <strong>N7 Auto</strong> cam kết mang đến cho quý khách hàng dịch vụ minh bạch, an toàn và thuận tiện nhất.
        </p>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="./footer/footer.jsp" flush="true" />
