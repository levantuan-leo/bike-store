package org.project.controller;

import org.project.dao.AccountDao;
import org.project.dao.CustomerDao;
import org.project.entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    private static final CustomerDao customerDao = new CustomerDao();
    private static final AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        req.getRequestDispatcher("/templates/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");  // Set content type of the response.
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");

        PrintWriter printWriter = resp.getWriter();
        if (confirmPassword.equals(password)){
            Customer customer = customerDao.getCustomerById(customerDao.addCustomer(name, email));
            accountDao.addAccount(email, password, customer);
            printWriter.write("Register successful!");
        }
        else {
            resp.setStatus(400);
            printWriter.write("Password must match.");
        }

        printWriter.close();
    }
}
