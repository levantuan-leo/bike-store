package org.project.controller.seller;

import org.project.dao.OrderDao;
import org.project.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/seller/order")
public class ManageOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Account a = (Account) session.getAttribute("account");
        Integer storeId = a.getCustomer().getStore().getId();

        Integer pending = 0;
        Integer processing = 1;
        Integer completed = 2;
        Integer canceled = 3;

        OrderDao orderDao = new OrderDao();

        List<?> Order0 = orderDao.getOrderByStoreAndStatus(storeId, pending);
        List<?> Order1 = orderDao.getOrderByStoreAndStatus(storeId, processing);
        List<?> Order2 = orderDao.getOrderByStoreAndStatus(storeId, completed);
        List<?> Order3 = orderDao.getOrderByStoreAndStatus(storeId, canceled);

        req.setAttribute("Order0", Order0);
        req.setAttribute("Order1", Order1);
        req.setAttribute("Order2", Order2);
        req.setAttribute("Order3", Order3);

        req.getRequestDispatcher("/templates/seller/order.jsp").forward(req, resp);
    }
}
