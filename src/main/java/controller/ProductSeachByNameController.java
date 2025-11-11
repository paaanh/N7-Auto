package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

public class ProductSeachByNameController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductServiceImpl();
    private final DecimalFormat df = new DecimalFormat("#,###");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String search = req.getParameter("s");
            List<Product> list = productService.searchByName(search);
            for (Product p : list) {
                try {
                    double price = Double.parseDouble(p.getPrice().replaceAll("[^\\d.]", ""));
                    double discount = 0;
                    try {
                        discount = Double.parseDouble(p.getDiscount());
                    } catch (Exception ignored) {}
                    double finalPrice = price * (1 - discount / 100.0);
                    p.setPrice(df.format(finalPrice));
                } catch (Exception ignored) {}
            }
            req.setAttribute("productlist", list);
            RequestDispatcher rd = req.getRequestDispatcher("/view/client/product.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/view/client/error.jsp");
        }
    }
}
