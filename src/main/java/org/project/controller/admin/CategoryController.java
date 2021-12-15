package org.project.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.entity.Category;
import org.project.entity.Product;

@WebServlet(urlPatterns = "/admin/category/list")
public class CategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        CategoryDao categoryDao = new CategoryDao();
        List<?> listCategories = categoryDao.listCategories();

        req.setAttribute("listCategories", listCategories);

        req.getRequestDispatcher("/templates/admin/category.jsp").forward(req, resp);
    }
}


