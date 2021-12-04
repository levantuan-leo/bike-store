package org.project.controller;

import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/product-single"})
public class ProductSingleController extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();
    private static final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String productId = req.getParameter("productId");

        Product product = productDao.getProductById(Integer.parseInt(productId));
        List<?> listProductsRelated = productDao.getProductsByCategory(0, 4, product.getCategory().getId());

        List<?> listCategories = categoryDao.listCategories();

        req.setAttribute("listCategories", listCategories);
        req.setAttribute("listProductsRelated", listProductsRelated);
        req.setAttribute("product", product);

        req.getRequestDispatcher("/templates/product-details.jsp").forward(req, resp);
    }
}
