package org.project.controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.dao.StoreDao;
import org.project.entity.Category;

@WebServlet(urlPatterns = "/admin/store/list")
public class ListStoreController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        StoreDao storeDao = new StoreDao();

        List<?> store = storeDao.listStores();

        req.setAttribute("listsotre", store);

        req.getRequestDispatcher("/templates/admin/liststore.jsp").forward(req, resp);

    }
}

