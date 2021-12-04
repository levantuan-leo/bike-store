package org.project.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.entity.Category;

@WebServlet(urlPatterns = "/admin/product/edit")
public class EditProductController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    super.doGet(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    resp.setCharacterEncoding("UTF-8");
    req.setCharacterEncoding("UTF-8");
    ProductDao productDao = new ProductDao();
    CategoryDao categoryDao = new CategoryDao();
    Integer id = Integer.parseInt(req.getParameter("id"));
    String name = req.getParameter("name");
    Category cate = categoryDao.getCategoryById(Integer.parseInt(req.getParameter("category")));
    BigDecimal price = BigDecimal.valueOf(Float.parseFloat(req.getParameter("price"))) ;
    String picture = req.getParameter("image");
    productDao.updateProduct(id, name, cate, price, picture);
    resp.sendRedirect("/admin/product/list");
  }
}
