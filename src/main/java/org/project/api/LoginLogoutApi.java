package org.project.api;

import org.project.dao.AccountDao;
import org.project.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/login-logout"})
public class LoginLogoutApi extends HttpServlet {
    private static final AccountDao accountDao = new AccountDao();

    // Log out
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        req.getSession().removeAttribute("account");

        resp.sendRedirect("home");
    }

    // Log In
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");  // Set content type of the response.
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = "0";

        Account account = accountDao.login(email, password, Integer.parseInt(role));

        if (account == null){
            resp.setStatus(400);
            resp.getWriter().write("Incorrect username or password!");
            resp.getWriter().close();
        } else {
            req.getSession().setAttribute("account", account);
            resp.setStatus(200);
        }
    }
}
