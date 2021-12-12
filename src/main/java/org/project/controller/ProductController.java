package org.project.controller;

import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.entity.Category;
import org.project.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();
    private static final CategoryDao categoryDao = new CategoryDao();
    private static String CATEGORY_ID = "";
    private static String KEYWORD = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String categoryId = req.getParameter("categoryId");

        List<?> listFeaturedProducts = productDao.getFeaturedProducts(5);

        List<?> listCategories = categoryDao.listCategories();
        List<Integer> listCategoriesSize = new ArrayList<>();
        for (Object o : listCategories) {
            listCategoriesSize.add(productDao.countByCategory(((Category) o).getId()));
        }

        req.setAttribute("listFeaturedProducts", listFeaturedProducts);
        req.setAttribute("listCategories", listCategories);
        req.setAttribute("listCategoriesSize", listCategoriesSize);
        req.setAttribute("categoryId", categoryId);

        req.getRequestDispatcher("/templates/products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");  // Set content type of the response.
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String categoryId = req.getParameter("categoryId");
        String keyword = req.getParameter("keyword");
        String index = req.getParameter("index");

        int limit = Integer.parseInt(req.getParameter("limit"));
        int start = 0;
        if (!Objects.equals(index, "")) {
            start = limit * (Integer.parseInt(index) - 1);
        }

        int count = productDao.count();
        if (!Objects.equals(categoryId, "")) {
            CATEGORY_ID = categoryId;
            count = productDao.countByCategory(Integer.parseInt(categoryId));
            KEYWORD = "";
        }
        else if (!Objects.equals(keyword, "")) {
            KEYWORD = keyword;
            count = productDao.countBySearch(keyword);
            CATEGORY_ID = "";
        }
        else{
            if(!Objects.equals(CATEGORY_ID, "")){
                count = productDao.countByCategory(Integer.parseInt(CATEGORY_ID));
            }
            else if(!Objects.equals(KEYWORD, "")){
                count = productDao.countByCategory(Integer.parseInt(KEYWORD));
            }
        }

        if (start + limit > count) {
            limit = count - start;
        }

        List<?> listProducts = productDao.getProducts(start, limit);
        if (!Objects.equals(categoryId, "")) {
            listProducts = productDao.getProductsByCategory(start, limit, Integer.parseInt(categoryId));
        }
        else if (!Objects.equals(keyword, "")) {
            listProducts = productDao.searchProductsByKeyword(keyword);
        }
        else{
            if(!Objects.equals(CATEGORY_ID, "")){
                listProducts = productDao.getProductsByCategory(start, limit, Integer.parseInt(CATEGORY_ID));
            }
            else if(!Objects.equals(KEYWORD, "")){
                listProducts = productDao.searchProductsByKeyword(KEYWORD);
            }
        }

        StringBuilder products = new StringBuilder();
        for (int i = 0; i < limit; ++i) {
            int id = ((Product) listProducts.get(i)).getId();
            String name = ((Product) listProducts.get(i)).getName();
            BigDecimal price = ((Product) listProducts.get(i)).getPrice();
            String picture = ((Product) listProducts.get(i)).getPicture();
            String product = String.format("" +
                    "<div class=\"product-item col-md-4 col-sm-6\">\n" +
                    "   <div class=\"item\">\n" +
                    "       <div class=\"product-item-inner\">\n" +
                    "           <div class=\"product-thumb\">\n" +
                    "               <img src='%s' alt=\"product\"/>\n" +
                    "           </div>\n" +
                    "           <div class=\"product-info\">\n" +
                    "               <h4><a href=\"product-single?productId=%d\">%s</a></h4>\n" +
                    "               <span class=\"p-meta\">\n" +
                    "                   <span class=\"p-price\">$%.2f</span>\n" +
                    "                   <span class=\"p-vote\">\n" +
                    "                       <i class=\"fa fa-star\"></i>\n" +
                    "                       <i class=\"fa fa-star\"></i>\n" +
                    "                       <i class=\"fa fa-star\"></i>\n" +
                    "                       <i class=\"fa fa-star\"></i>\n" +
                    "                       <i class=\"fa fa-star-half-o\"></i>\n" +
                    "                   </span>\n" +
                    "               </span>\n" +
                    "               <span class=\"p-color\">\n" +
                    "                   <i class=\"fa fa-circle light-blue\"></i>\n" +
                    "                   <i class=\"fa fa-circle orange\"></i>\n" +
                    "                   <i class=\"fa fa-circle blueviolet\"></i>\n" +
                    "                   <i class=\"fa fa-circle orange-dark\"></i>\n" +
                    "                   <i class=\"fa fa-circle steelblue\"></i>\n" +
                    "               </span>\n" +
                    "               <p>\n" +
                    "                   Excellence is never an accident. It is always the result of high intention\n" +
                    "                   and intelligent execution; it represents the wise choice of many\n" +
                    "                   alternatives.\n" +
                    "               </p>\n" +
                    "               <span class=\"p-mask\">\n" +
                    "                   <a href=\"javascript:void(0);\" class=\"add-to-cart\" onclick=\"addToCart(%d)\">Add to cart</a>\n" +
                    "                   <a href=\"#\" class=\"add-to-wishlist\"><i class=\"fa fa-heart\"></i> Add to wishlist</a>\n" +
                    "                   <span class=\"quick-view\">\n" +
                    "                       <a href=\"#\"><i class=\"fa fa-eye\"></i> Quick view</a>\n" +
                    "                   </span>\n" +
                    "               </span>\n" +
                    "           </div>\n" +
                    "       </div>\n" +
                    "   </div>\n" +
                    "</div>", picture, id, name, price, id);

            products.append(product);
        }

        resp.getWriter().write(String.valueOf(products));
        resp.getWriter().close();
    }

    protected Integer count(String CategoryId, String Keyword){
        int count = productDao.count();
        if (!Objects.equals(CategoryId, "")) {
            count = productDao.countByCategory(Integer.parseInt(CategoryId));
            KEYWORD = "";
        }
        else if (!Objects.equals(Keyword, "")) {
            count = productDao.countBySearch(Keyword);
            CATEGORY_ID = "";
        }
        return count;
    }
}
