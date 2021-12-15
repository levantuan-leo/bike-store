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
import org.project.entity.Product;

@WebServlet(urlPatterns = "/admin/product/load")
public class LoadProduct extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    resp.setCharacterEncoding("UTF-8");
    req.setCharacterEncoding("UTF-8");

    ProductDao productDao = new ProductDao();
    CategoryDao categoryDao = new CategoryDao();

    int pid= Integer.parseInt(req.getParameter("pid"));

    Product product = productDao.getProductById(pid);
    List<?> cate = categoryDao.listCategories();

    req.setAttribute("detail", product);
    req.setAttribute("listCC", cate);

    req.getRequestDispatcher("/templates/admin/edit.jsp").forward(req,resp);
  }
}
