package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Boardnew;
import model.Product;
import service.BoardnewService;
import service.ProductService;
import service.impl.BoardnewServicesImpl;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/home", "/Manager", "/view/client/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductServiceImpl();
    private final BoardnewService boardnewService = new BoardnewServicesImpl();
    private final DecimalFormat df = new DecimalFormat("#,###");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Boardnew> boardnewList = boardnewService.getAll();
        req.setAttribute("boardnewlist", boardnewList);

        List<Product> productList = productService.getAll();
        req.setAttribute("productlist", productList);

        List<Product> formattedList = new ArrayList<>();
        for (Product product : productList) {
            try {
                double price = Double.parseDouble(product.getPrice().replaceAll("[^\\d.]", ""));
                double discount = 0;
                try {
                    discount = Double.parseDouble(product.getDiscount());
                } catch (Exception ignored) {}
                double finalPrice = price * (1 - discount / 100.0);
                product.setPrice(df.format(finalPrice));
            } catch (Exception ignored) {}
            formattedList.add(product);
        }
        req.setAttribute("productlist1", formattedList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/index.jsp");
        dispatcher.forward(req, resp);
    }
}
