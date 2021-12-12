package org.project.api;


import org.project.dao.*;
import org.project.entity.*;
import org.project.utils.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = {"/api/payment"})
public class PaymentApi extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();
    private static final StoreDao storeDao = new StoreDao();
    private static final StockDao stockDao = new StockDao();
    private static final OrderDao orderDao = new OrderDao();
    private static final OrderItemDao orderItemDao = new OrderItemDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = cast(session.getAttribute("cart"));
        Account account = (Account) session.getAttribute("account");

        Customer customer = account.getCustomer();
        Store store = storeDao.getStoreById(1);
        Order order = orderDao.getOrderById(orderDao.addOrder(customer, store));

        for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
            orderItemDao.addOrderItem(order, entry.getValue().getProduct(), entry.getValue().getQuantity());

            Stock stock = stockDao.getStockByStoreAndProduct(store.getId(), entry.getValue().getProduct().getId());
            stockDao.updateStock(stock.getId(), stock.getQuantity() - entry.getValue().getQuantity());
        }

        session.removeAttribute("cart");

        resp.setStatus(200);
        resp.getWriter().write("Your Order has been recorded!");
        resp.getWriter().close();
    }

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> cast(Object obj) {
        return (Map<Integer, CartItem>) obj;
    }
}
