package org.project.controller.seller;

import org.project.dao.CategoryDao;
import org.project.dao.ProductDao;
import org.project.dao.StockDao;
import org.project.dao.StoreDao;
import org.project.entity.Account;
import org.project.entity.Category;
import org.project.entity.Product;
import org.project.entity.Store;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(urlPatterns = {"/seller/product"})
public class ProductController extends HttpServlet {
    private static final ProductDao productDao = new ProductDao();
    private static final CategoryDao categoryDao = new CategoryDao();
    private static final StockDao stockDao = new StockDao();
    private static final StoreDao storeDao = new StoreDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Account a = (Account) session.getAttribute("account");
        Integer storeId = a.getCustomer().getStore().getId();

        String indexPage = req.getParameter("index");
        if (indexPage == null)
        {
            indexPage="1";
        }
        Integer index = Integer.parseInt(indexPage);

        int count = stockDao.countStockByStore(storeId);
        int endPage = count/10;
        if (count % 10 !=0 )
            endPage++;

        List<?> listPS = stockDao.getStockByStore(storeId, index);
        List<?> cate = categoryDao.listCategories();

        req.setAttribute("endP", endPage);
        req.setAttribute("listPS", listPS);
        req.setAttribute("listCC", cate);

        req.getRequestDispatcher("/templates/seller/products.jsp").forward(req, resp);
    }

    // Add Product
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Account a = (Account) session.getAttribute("account");
        Integer storeId = a.getCustomer().getStore().getId();

        String name = req.getParameter("name");
        Category cate = categoryDao.getCategoryById(Integer.parseInt(req.getParameter("categoryId")));
        BigDecimal price = BigDecimal.valueOf(Float.parseFloat(req.getParameter("price")));
        String picture = req.getParameter("picture");
        int quantity =Integer.parseInt(req.getParameter("quantity"));

        Integer pid = productDao.addProduct(name, cate, price, picture);
        Product pd = productDao.getProductById(pid);
        Store store = storeDao.getStoreById(storeId);
        stockDao.addStock(pd,store, quantity);

        resp.setStatus(200);
        resp.getWriter().write("Add Product Successful!");
        resp.getWriter().close();
    }

    // Edit Product
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Integer id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        Category cate = categoryDao.getCategoryById(Integer.parseInt(req.getParameter("category")));
        BigDecimal price = BigDecimal.valueOf(Float.parseFloat(req.getParameter("price"))) ;
        String picture = req.getParameter("image");

        productDao.updateProduct(id, name, cate, price, picture);

        resp.setStatus(200);
        resp.getWriter().write("Edit Product Successful!");
        resp.getWriter().close();
    }

    // Delete Product
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Integer productId =  Integer.parseInt(req.getParameter("productId"));

        productDao.deleteProduct(productId);

        resp.setStatus(200);
        resp.getWriter().write("Delete Product Successful!");
        resp.getWriter().close();
    }

}
