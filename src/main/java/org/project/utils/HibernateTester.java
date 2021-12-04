package org.project.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.project.dao.*;
import org.project.entity.Customer;
import org.project.entity.Order;
import org.project.entity.Product;
import org.project.entity.Store;

import java.util.List;

public class HibernateTester {
    public static void main(String[] args) {
//        ProductDao productDao = new ProductDao();
//
//
//        List<?> listProductsSearched = productDao.searchProductsByKeyword(0,3,"kj");
//
//        for (Object o : listProductsSearched) {
//            System.out.println(((Product)o).getName());
//        }
        Session session = HibernateUtil.getSessionFactory().openSession();
        OrderItemDao orderItemDaoDao = new OrderItemDao();

        Order order = session.get(Order.class, 1);
        Product product = session.get(Product.class, 10);

        session.close();
        System.out.println(orderItemDaoDao.addOrderItem(order, product, 1));
    }
}
