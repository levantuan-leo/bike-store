package org.project.controller;

import org.project.dao.StoreDao;
import org.project.entity.Store;
import org.project.utils.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    private static final StoreDao storeDao = new StoreDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Object o = session.getAttribute("cart");

        if(o != null) {
            Map<Integer, CartItem> cart = cast(o);

            Map<Integer, Store> stores = new HashMap<>();
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                int id = entry.getValue().getProduct().getStock().getStore().getId();
                if (stores.get(id) == null) stores.put(id, storeDao.getStoreById(id));
            }

            req.setAttribute("stores", stores);
        }

        req.getRequestDispatcher("/templates/cart.jsp").forward(req, resp);
    }

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> cast(Object obj) {
        return (Map<Integer, CartItem>) obj;
    }
}
