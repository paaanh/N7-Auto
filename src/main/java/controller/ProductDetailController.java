package controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

public class ProductDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();
    DecimalFormat df = new DecimalFormat("#,###");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            Product product = productService.get(Integer.parseInt(id));

            if (product != null) {
                // ✅ Xử lý dấu phẩy trong giá và tính giá sau giảm
                try {
                    String priceStr = product.getPrice().replace(",", "").trim();
                    double price = Double.parseDouble(priceStr);

                    double discount = 0;
                    try {
                        discount = Double.parseDouble(product.getDiscount());
                    } catch (Exception e) {
                        discount = 0;
                    }

                    double finalPrice = price * (1 - discount / 100.0);
                    product.setPrice(df.format(finalPrice));
                } catch (Exception e) {
                    // Nếu lỗi parse, giữ nguyên giá gốc
                    product.setPrice(product.getPrice());
                }

                req.setAttribute("detail_product", product);

                RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/product-detail.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/view/client/error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/view/client/error.jsp");
        }
    }
}
