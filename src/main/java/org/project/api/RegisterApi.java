package org.project.api;

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

@WebServlet(urlPatterns = {"/api/register"})
public class RegisterApi extends HttpServlet {
    private static final CustomerDao customerDao = new CustomerDao();
    private static final AccountDao accountDao = new AccountDao();

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
            accountDao.addAccount(email, password, 0, customer);
            printWriter.write("Register successful!");
            printWriter.close();
        }
        else {
            resp.setStatus(404);
            printWriter.write("Password must match.");
        }
    }
}
