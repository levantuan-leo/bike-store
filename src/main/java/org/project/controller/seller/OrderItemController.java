package org.project.controller.seller;

import org.project.dao.OrderDao;
import org.project.dao.OrderItemDao;
import org.project.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/seller/order/item")
public class OrderItemController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        OrderItemDao orderItemDao = new OrderItemDao();
        OrderDao orderDao = new OrderDao();

        Integer oid = Integer.parseInt(req.getParameter("oid"));

        List<?> ListItem = orderItemDao.getOrderItemByOrderId(oid);
        Order order = orderDao.getOrderById(oid);

        req.setAttribute("listitem", ListItem);
        req.setAttribute("order", order);

        req.getRequestDispatcher("/templates/seller/orderItem.jsp").forward(req, resp);

    }


}
