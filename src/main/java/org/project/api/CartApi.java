package org.project.api;

import com.google.gson.Gson;
import org.project.dao.ProductDao;
import org.project.entity.Product;
import org.project.utils.CartItem;
import org.project.utils.CartStats;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/api/cart"})
public class CartApi extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();

    @Override
    // Add Item To Cart
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");

        Product product = productDao.getProductById(Integer.parseInt(productId));

        HttpSession session = req.getSession();
        Object obj = session.getAttribute("cart");

        boolean flag = false;
        Map<Integer, CartItem> cart;
        if (obj == null) {
            cart = new HashMap<>();
            cart.put(product.getId(), new CartItem(product, Integer.parseInt(quantity)));
            session.setAttribute("cart", cart);
            flag = true;
        } else {
            cart = cast(obj);

            if (cart.get(product.getId()) != null) {
                CartItem item = cart.get(product.getId());
                item.setQuantity(item.getQuantity() + Integer.parseInt(quantity));
                cart.put(product.getId(), item);
            } else {
                cart.put(product.getId(), new CartItem(product, Integer.parseInt(quantity)));
                flag=true;
            }
        }

        session.setAttribute("cart", cart);

        CartStats cartStats = new CartStats(cart);
        Map<String, String> cs = new HashMap<>();
        cs.put("total_quantity", String.valueOf(cartStats.getTotalQuantity()));
        cs.put("total_amount", String.valueOf(cartStats.getTotalAmount()));

        if(flag) {
            String p = String.format("<li class=\"mini-cart-content\">\n" +
                    "                            <div class=\"mini-cart-img\"><img\n" +
                    "                                    src='%s'\n" +
                    "                                    alt=\"product search one\"></div>\n" +
                    "                            <div class=\"mini-cart-ds\">\n" +
                    "                                <h6><a href='product-single?productId=%d'>%s</a></h6>\n" +
                    "                                <span class=\"mini-cart-meta\">\n" +
                    "                                    <a href=\"javascript:void(0);\">$%.2f</a>\n" +
                    "                                </span>\n" +
                    "                            </div>\n" +
                    "                        </li>", product.getPicture(), product.getId(), product.getName(), product.getPrice());
            cs.put("product", p);
        }

        String json = new Gson().toJson(cs);
        resp.getWriter().write(json);

        resp.getWriter().close();
    }

    @Override
    // Update Item
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = cast(session.getAttribute("cart"));

        CartItem item = cart.get(Integer.parseInt(productId));
        item.setQuantity(Integer.parseInt(quantity));
        cart.put(Integer.parseInt(productId), item);

        session.setAttribute("cart", cart);

        CartStats cartStats = new CartStats(cart);
        Map<String, String> cs = new HashMap<>();
        cs.put("total_quantity", String.valueOf(cartStats.getTotalQuantity()));
        cs.put("total_amount", String.valueOf(cartStats.getTotalAmount()));

        String json = new Gson().toJson(cs);
        resp.getWriter().write(json);

        resp.getWriter().close();
    }

    @Override
    // Delete Item
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String productId = req.getParameter("productId");

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = cast(session.getAttribute("cart"));

        if (cart != null){
            cart.remove(Integer.parseInt(productId));

            session.setAttribute("cart", cart);

            CartStats cartStats = new CartStats(cart);
            Map<String, String> cs = new HashMap<>();
            cs.put("total_quantity", String.valueOf(cartStats.getTotalQuantity()));
            cs.put("total_amount", String.valueOf(cartStats.getTotalAmount()));

            String json = new Gson().toJson(cs);
            resp.getWriter().write(json);
        }

        resp.getWriter().close();
    }

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> cast(Object obj) {
        return (Map<Integer, CartItem>) obj;
    }
}