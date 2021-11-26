package org.project.api;

import org.project.dao.ProductDao;
import org.project.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

        List<?> listProducts = productDao.getProducts(start, limit);

        StringBuilder products = new StringBuilder();
        for (int i = 1; i <= 2; ++i) {
            products.append("<div class=\"row row-item\">");
            for (int j = 1; j <= 4; ++j) {
                int index = i * j - 1;
                String product = "" +
                        "<div class=\"col-md-3 col-sm-6\">\n" +
                        "         <div class=\"product-item\">\n" +
                        "               <div class=\"product-thubnail\">\n" +
                        "                      <img src=\""+  ((Product) listProducts.get(index)).getPicture()  +"\" alt=\"product 4\"/>\n" +
                        "                       <div class=\"product-meta\">\n" +
                        "                            <a class=\"add-to-cart\" href=\""+ "#" +"\">Add to cart</a>\n" +
                        "                            <span class=\"quick-view\">\n" +
                        "                                  <a href=\"#\">Quick view</a>\n" +
                        "                             </span>\n" +
                        "                        </div>\n" +
                        "               </div>\n" +
                        "               <div class=\"product-infomation\">\n" +
                        "                        <h4><a href=\"/product-single\">" + ((Product) listProducts.get(index)).getName() + "</a></h4>\n" +
                        "                        <span class=\"product-price\">$"+ ((Product) listProducts.get(index)).getPrice() +"</span>\n" +
                        "                         <span class=\"product-attr\">\n" +
                        "                              <i class=\"fa fa-circle light-blue\"></i>\n" +
                        "                              <i class=\"fa fa-circle orange\"></i>\n" +
                        "                              <i class=\"fa fa-circle blueviolet\"></i>\n" +
                        "                              <i class=\"fa fa-circle orange-dark\"></i>\n" +
                        "                              <i class=\"fa fa-circle steelblue\"></i>\n" +
                        "                         </span>\n" +
                        "               </div>\n" +
                        "        </div>\n" +
                        "</div>";

                products.append(product);
            }
            products.append("</div>");
        }

        resp.getWriter().write(String.valueOf(products));
    }
}
