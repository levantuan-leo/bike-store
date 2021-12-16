package org.project.api;

import org.project.dao.AccountDao;
import org.project.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/change-role"})
public class RoleApi extends HttpServlet {
    private static final AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Integer accountId = ((Account)req.getSession().getAttribute("account")).getId();

        accountDao.updateAccount(accountId, 1);

        resp.setStatus(200);
    }
}
