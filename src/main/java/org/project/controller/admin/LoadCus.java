package org.project.controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.project.dao.CategoryDao;
import org.project.dao.CustomerDao;
import org.project.dao.ProductDao;
import org.project.entity.Customer;
import org.project.entity.Product;

@WebServlet(urlPatterns = "/admin/cus/load")
public class LoadCus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        CustomerDao cd = new CustomerDao();

        int pid= Integer.parseInt(req.getParameter("pid"));

        Customer customer = cd.getCustomerById(pid);


        req.setAttribute("detail", customer);


        req.getRequestDispatcher("/templates/admin/updatecus.jsp").forward(req,resp);
    }
}
