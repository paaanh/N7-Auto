package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


import model.Catalog;
import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServicesImpl;
import service.impl.ProductServiceImpl;

@WebServlet("/view/client/product-category")
public class ProductListOfCategoryClientController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CategoryService cateService = new CategoryServicesImpl();
    private final ProductService productService = new ProductServiceImpl();
    private final DecimalFormat df = new DecimalFormat("#,###");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String cid = req.getParameter("cid");
            if (cid == null) cid = "1";

            List<Catalog> cateList = cateService.getAll();
            req.setAttribute("catelist", cateList);

            List<Product> productList = productService.getProductByIdCate(Integer.parseInt(cid));

            req.setAttribute("productlist", productList);

            List<Product> formattedList = new ArrayList<>();
            for (Product p : productList) {
                try {
                    double price = Double.parseDouble(p.getPrice().replaceAll("[^\\d.]", ""));
                    double discount = 0;
                    try {
                        discount = Double.parseDouble(p.getDiscount());
                    } catch (Exception ignored) {}
                    double finalPrice = price * (1 - discount / 100.0);
                    p.setPrice(df.format(finalPrice));
                } catch (Exception ignored) {}
                formattedList.add(p);
            }

            req.setAttribute("productlist1", formattedList);
            RequestDispatcher rd = req.getRequestDispatcher("/view/client/product.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/view/client/error.jsp");
        }
    }
}
