package org.project.controller.seller;

import org.project.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/seller/order/update")
public class UpdateOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer oid = Integer.parseInt(req.getParameter("oid"));
        Integer status = Integer.parseInt(req.getParameter("status"));

        OrderDao orderDao = new OrderDao();

        orderDao.updateOrder(oid, status);

        resp.sendRedirect(req.getContextPath() + "/seller/order");


    }
}
