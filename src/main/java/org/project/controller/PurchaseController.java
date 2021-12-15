package org.project.controller;

import org.project.dao.OrderDao;
import org.project.entity.Account;
import org.project.entity.Order;
import org.project.entity.OrderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/purchase"})
public class PurchaseController extends HttpServlet {
    private static final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Integer customerId = ((Account)req.getSession().getAttribute("account")).getCustomer().getId();

        List<?> orders = orderDao.getOrdersByCustomer(customerId);
        List<?> ordersPending = orderDao.getOrdersPendingByCustomer(customerId);
        List<?> ordersProcessing = orderDao.getOrdersProcessingByCustomer(customerId);
        List<?> ordersCompleted = orderDao.getOrdersCompletedByCustomer(customerId);
        List<?> ordersCanceled = orderDao.getOrdersCanceledByCustomer(customerId);

        req.setAttribute("orders", orders);
        req.setAttribute("ordersPending", ordersPending);
        req.setAttribute("ordersProcessing", ordersProcessing);
        req.setAttribute("ordersCompleted", ordersCompleted);
        req.setAttribute("ordersCanceled", ordersCanceled);

        req.getRequestDispatcher("/templates/order.jsp").forward(req, resp);
    }

    // Cancel Order
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String orderId = req.getParameter("orderId");

        // status = 3 ->  Cancel
        orderDao.updateOrder(Integer.parseInt(orderId), 3);
        Order order = orderDao.getOrderById(Integer.parseInt(orderId));

        StringBuilder o = new StringBuilder();
        o.append("<tr class=\"cart_item\">\n" + "<td style=\"padding: 15px 0;\" colspan=\"2\"><span style=\"font-weight: 600;\">STORE:</span> ").append(order.getStore().getName()).append("</td>\n").append("  <td style=\"padding: 15px 0;\" class=\"product-remove\">\n").append("      <a href=\"#\" title=\"Canceled This Item\"\n").append("         style=\"display: block; width: 100%; padding: 5px;background: #0c58ff;color: #fff;\">\n").append("              Buy again\n").append("      </a>\n").append("  </td>\n").append("</tr>\n");

        for(OrderItem orderItem: order.getOrderItems()){
            String item = String.format(
                    "<tr class=\"cart_item\">\n" +
                    "   <td class=\"product-thumbnail\">\n" +
                    "       <a href=\"single-product.html\">\n" +
                    "           <img src='%s' alt=\"cart\"/>\n" +
                    "       </a>\n" +
                    "   </td>\n" +
                    "   <td class=\"product-name\">\n" +
                    "       <a href=\"single-product.html\">%s</a>\n" +
                    "       <span style=\"margin: unset;\" class=\"color\">x%d</span>\n" +
                    "   </td>\n" +
                    "   <td class=\"product-price\">\n" +
                    "       <span class=\"amount\">$%.2f</span>\n" +
                    "   </td>\n" +
                    "</tr>\n", orderItem.getProduct().getPicture(), orderItem.getProduct().getName(), orderItem.getQuantity(), orderItem.getProduct().getPrice());
            o.append(item);
        }

        resp.setStatus(200);
        resp.getWriter().write(String.valueOf(o));
        resp.getWriter().close();
    }
}
