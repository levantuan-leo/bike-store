package org.project.controller.admin;

import org.project.dao.CustomerDao;
import org.project.dao.OrderDao;
import org.project.dao.ProductDao;
import org.project.dao.StoreDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        ProductDao productDao = new ProductDao();
        CustomerDao customerDao = new CustomerDao();
        OrderDao orderDao = new OrderDao();
        StoreDao storeDao = new StoreDao();

        int countcus = customerDao.count();
        int count = productDao.count();
        int countorder = orderDao.count();
        int countstore = storeDao.count();

        req.setAttribute("countorder", countorder);
        req.setAttribute("countcus",countcus);
        req.setAttribute("count",count);
        req.setAttribute("countstore",countstore);
        req.getRequestDispatcher("/templates/admin/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
