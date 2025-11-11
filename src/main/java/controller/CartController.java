package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Order;

public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false); // không tạo mới session
            if (session == null) {
                System.out.println("⚠️ [CartController] Session null -> redirect về trang chủ");
                resp.sendRedirect(req.getContextPath() + "/view/client/product");
                return;
            }

            Object orderObj = session.getAttribute("order");
            System.out.println("🔎 [CartController] order = " + orderObj);

            if (orderObj == null) {
                req.setAttribute("message", "Giỏ hàng của bạn đang trống!");
            } else {
                try {
                    Order order = (Order) orderObj;
                    req.setAttribute("order", order);
                    req.setAttribute("sumprice", session.getAttribute("sumprice"));
                    req.setAttribute("length_order", session.getAttribute("length_order"));
                } catch (ClassCastException e) {
                    e.printStackTrace();
                    System.out.println("❌ [CartController] Lỗi ép kiểu Order: " + e.getMessage());
                    session.removeAttribute("order");
                    req.setAttribute("message", "Dữ liệu giỏ hàng lỗi, vui lòng thêm lại sản phẩm!");
                }
            }

            RequestDispatcher rd = req.getRequestDispatcher("/view/client/cart.jsp");
            rd.forward(req, resp);
            System.out.println("✅ [CartController] Forward thành công tới cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ [CartController] Exception: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/view/client/product");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
