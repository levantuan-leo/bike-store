package org.project.controller;

import org.project.dao.OrderDao;
import org.project.entity.Account;

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
}
