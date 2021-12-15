package org.project.controller;

import org.project.dao.OrderItemDao;
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
    private static final OrderItemDao orderItemDao = new OrderItemDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Integer customerId = ((Account)req.getSession().getAttribute("account")).getCustomer().getId();

        List<?> orderItems = orderItemDao.getOrderItemsByCustomer(customerId);
        List<?> orderItemsPending = orderItemDao.getOrderItemsPendingByCustomer(customerId);
        List<?> orderItemsProcessing = orderItemDao.getOrderItemsProcessingByCustomer(customerId);
        List<?> orderItemsCompleted = orderItemDao.getOrderItemsCompletedByCustomer(customerId);
        List<?> orderItemsCanceled = orderItemDao.getOrderItemsCanceledByCustomer(customerId);

        req.setAttribute("orderItems", orderItems);
        req.setAttribute("orderItemsPending", orderItemsPending);
        req.setAttribute("orderItemsProcessing", orderItemsProcessing);
        req.setAttribute("orderItemsCompleted", orderItemsCompleted);
        req.setAttribute("orderItemsCanceled", orderItemsCanceled);

        req.getRequestDispatcher("/templates/order.jsp").forward(req, resp);
    }
}
