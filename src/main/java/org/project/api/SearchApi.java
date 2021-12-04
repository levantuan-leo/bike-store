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
import java.util.Objects;

@WebServlet(urlPatterns = {"/api/search"})
public class SearchApi extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");  // Set content type of the response.
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String keyword = req.getParameter("keyword");
        int number = 3; // default number

        if (!Objects.equals(keyword, "")) {

            List<?> listProductsSearched = productDao.searchProductsByKeyword(0, number, keyword);

            StringBuilder products = new StringBuilder();
            var n = Math.min(listProductsSearched.size(), number);
            for (int i = 0; i < n; i++) {
                int id = ((Product) listProductsSearched.get(i)).getId();
                String name = ((Product) listProductsSearched.get(i)).getName();
                BigDecimal price = ((Product) listProductsSearched.get(i)).getPrice();
                String picture = ((Product) listProductsSearched.get(i)).getPicture();
                String product = String.format("" +
                        "<li>\n" +
                        "   <div class=\"live-img\"><img\n" +
                        "        src='%s'\n" +
                        "        alt=\"product search\"></div>\n" +
                        "   <div class=\"live-search-content\">\n" +
                        "       <h6><a href='product-single?productId=%d'>%s</a></h6>\n" +
                        "       <span class=\"live-meta\">\n" +
                        "           <a href='product-single?productId=%d'>$%.2f</a>\n" +
                        "           <span class=\"product-color\">\n" +
                        "               <i class=\"light-blue\"></i>\n" +
                        "               <i class=\"orange\"></i>\n" +
                        "               <i class=\"orange-dark\"></i>\n" +
                        "           </span>\n" +
                        "       </span>\n" +
                        "   </div>\n" +
                        "</li>", picture, id, name, id, price);

                products.append(product);
            }

            resp.getWriter().write(String.valueOf(products));
        }
        else {
            resp.getWriter().write("");
        }

        resp.getWriter().close();
    }
}
