package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Item;
import model.Order;
import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

public class AddtoCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductServiceImpl();
    private final DecimalFormat df = new DecimalFormat("#,###");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("product-id");
            if (id == null || id.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/view/client/product");
                return;
            }

            Product product = productService.get(Integer.parseInt(id));
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/view/client/product");
                return;
            }

            int qty = 1;
            try {
                qty = Integer.parseInt(request.getParameter("qty"));
            } catch (Exception ignored) {}

            // ✅ Làm sạch giá để tránh lỗi parse
            double price = 0;
            try {
                // ✅ ép chuỗi về dạng số, nếu lỗi thì gán 0
                price = Double.parseDouble(product.getPrice().replaceAll("[^\\d.]", "0"));
            } catch (Exception e) {
                price = 0;
            }

            double discount = 0;
            try {
                discount = Double.parseDouble(product.getDiscount().replaceAll("[^\\d.]", ""));
            } catch (Exception ignored) {}

            double finalPrice = price * (1 - discount / 100.0);

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("order");

            if (order == null) {
                order = new Order();
                order.setItems(new ArrayList<>());
                order.setSumPrice(0);
            }

            List<Item> items = order.getItems();
            boolean found = false;

            for (Item item : items) {
                if (item.getProduct().getId().equals(product.getId())) {
                    item.setQty(item.getQty() + qty);
                    item.setPrice(item.getPrice() + finalPrice);
                    found = true;
                    break;
                }
            }

            if (!found) {
                Item newItem = new Item();
                newItem.setProduct(product);
                newItem.setQty(qty);
                newItem.setPrice(finalPrice);
                items.add(newItem);
            }

            double total = 0;
            for (Item i : items) total += i.getPrice();

            order.setSumPrice(total);
            session.setAttribute("order", order);
            session.setAttribute("length_order", items.size());
            session.setAttribute("sumprice", total); // 🔥 Lưu dạng double, không phải chuỗi format

            response.sendRedirect(request.getContextPath() + "/view/client/cart");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/view/client/product");
        }
    }
}
