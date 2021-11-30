package org.project.controller;

import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.entity.Product;
import org.project.utils.CartItem;
import org.project.utils.CartStats;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private static final CategoryDao categoryDao = new CategoryDao();
    private static final ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Product bestProductSale = productDao.getBestProductSale();
        req.setAttribute("bestProductSale", bestProductSale);

        List<?> listCategories = categoryDao.listCategories();
        req.setAttribute("listCategories", listCategories);

        req.getRequestDispatcher("/templates/home.jsp").forward(req, resp);
    }
}
