package org.project.api;

import org.project.dao.ProductDao;
import org.project.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(urlPatterns = {"/api/load-more"})
public class LoadMoreApi extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");  // Set content type of the response.
        resp.setCharacterEncoding("UTF-8");

        int start = Integer.parseInt(req.getParameter("start"));
        int limit = Integer.parseInt(req.getParameter("limit"));

        int count = productDao.count();
        if (start > count){
            resp.getWriter().write("");
            resp.getWriter().close();
        }
        if(start + limit > count){
            limit = count - start;
        }

        List<?> listProducts = productDao.getProducts(start, limit);

        StringBuilder products = new StringBuilder();
        int n = (limit-1)/4 + 1;
        for (int i = 1; i <= n; ++i) {
            products.append("<div class=\"row row-item\">");
            int m = Math.min(limit, 4);
            for (int j = 1; j <= m; ++j) {
                int index = (j - 1) + 4 * (i - 1);
                int id = ((Product) listProducts.get(index)).getId();
                String name = ((Product) listProducts.get(index)).getName();
                BigDecimal price = ((Product) listProducts.get(index)).getPrice();
                String picture = ((Product) listProducts.get(index)).getPicture();
                String product = String.format("" +
                        "<div class=\"col-md-3 col-sm-6\">\n" +
                        "         <div class=\"product-item\">\n" +
                        "               <div class=\"product-thubnail\">\n" +
                        "                      <img src='%s' alt=\"product 4\"/>\n" +
                        "                       <div class=\"product-meta\">\n" +
                        "                            <a class=\"add-to-cart\" href=\"javascript:void(0);\" " +
                        "                               onclick=\"addToCart(%d)\">Add to cart</a>\n" +
                        "                            <span class=\"quick-view\">\n" +
                        "                                  <a href=\"#\">Quick view</a>\n" +
                        "                             </span>\n" +
                        "                        </div>\n" +
                        "               </div>\n" +
                        "               <div class=\"product-information\">\n" +
                        "                        <h4><a href=\"product-single?id=%d\">%s</a></h4>\n" +
                        "                        <span class=\"product-price\">$%.2f</span>\n" +
                        "                        <span class=\"product-attr\">\n" +
                        "                             <i class=\"fa fa-circle light-blue\"></i>\n" +
                        "                             <i class=\"fa fa-circle orange\"></i>\n" +
                        "                             <i class=\"fa fa-circle blueviolet\"></i>\n" +
                        "                             <i class=\"fa fa-circle orange-dark\"></i>\n" +
                        "                             <i class=\"fa fa-circle steelblue\"></i>\n" +
                        "                         </span>\n" +
                        "               </div>\n" +
                        "        </div>\n" +
                        "</div>", picture, id, id , name, price);

                products.append(product);
            }
            limit = limit - 4;
            products.append("</div>");
        }

        resp.getWriter().write(String.valueOf(products));
        resp.getWriter().close();
    }
}
