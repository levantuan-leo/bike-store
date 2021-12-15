package org.project.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.project.dao.*;
import org.project.entity.*;

import java.util.List;

public class HibernateTester {
    public static void main(String[] args) {
        OrderItemDao productDao = new OrderItemDao();


        List<?> listProductsSearched = productDao.getOrderItemsByCustomer(1);

        for (Object o : listProductsSearched) {
            System.out.println(((OrderItem)o).getQuantity());
        }

    }
}
