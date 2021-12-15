package org.project.controller.admin;

import org.project.dao.CustomerDao;
import org.project.dao.OrderDao;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/order/list")
public class OrderController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    resp.setCharacterEncoding("UTF-8");
    req.setCharacterEncoding("UTF-8");

    OrderDao orderDao = new OrderDao();

    List<?> listOrders = orderDao.listOrders();

    req.setAttribute("listOrders", listOrders);

    req.getRequestDispatcher("/templates/admin/order.jsp").forward(req, resp);
  }
}
