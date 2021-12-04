package org.project.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.project.dao.AccountDao;
import org.project.dao.CustomerDao;

@WebServlet(urlPatterns = "/admin/customer/list")
public class LoadCustomerController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    resp.setCharacterEncoding("UTF-8");
    req.setCharacterEncoding("UTF-8");

    CustomerDao customerDao = new CustomerDao();

    List<?> listA = customerDao.listCustomers();

    req.setAttribute("listA", listA);
    
    req.getRequestDispatcher("/templates/admin/account.jsp").forward(req, resp);
  }
}
