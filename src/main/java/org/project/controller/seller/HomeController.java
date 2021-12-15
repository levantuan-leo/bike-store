package org.project.controller.seller;

import org.project.dao.CustomerDao;
import org.project.dao.OrderDao;
import org.project.dao.OrderItemDao;
import org.project.dao.StockDao;
import org.project.entity.Account;
import org.project.entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/seller/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Account a = (Account) session.getAttribute("account");
        Integer storeId = a.getCustomer().getStore().getId();

        StockDao stockDao = new StockDao();
        OrderDao orderDao = new OrderDao();
        OrderItemDao orderItemDao = new OrderItemDao();
        CustomerDao customerDao = new CustomerDao();

        List<?> listcount = orderItemDao.getOrderItemsByStore(storeId);
        int countP = stockDao.countStockByStore(storeId);
        int countO = orderDao.countOrderByStore(storeId);
        int countC = customerDao.countCustomerByStore(storeId);

        req.setAttribute("listcount", listcount);
        req.setAttribute("countP", countP);
        req.setAttribute("countO", countO);
        req.setAttribute("countC", countC);

        req.getRequestDispatcher("/templates/seller/home.jsp").forward(req, resp);
    }
}
