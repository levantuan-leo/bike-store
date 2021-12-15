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
import org.project.entity.Category;

@WebServlet(urlPatterns = "/admin/product/list")
public class ListProductController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    resp.setCharacterEncoding("UTF-8");
    req.setCharacterEncoding("UTF-8");

    ProductDao productDao = new ProductDao();
    CategoryDao categoryDao = new CategoryDao();

    List<?> products = productDao.listProducts();
    List<?> cate = categoryDao.listCategories();

    req.setAttribute("listP", products);
    req.setAttribute("listCC", cate);

    req.getRequestDispatcher("/templates/admin/list-product.jsp").forward(req, resp);

  }
}
