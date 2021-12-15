package org.project.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.project.dao.*;
import org.project.entity.*;

import java.util.List;

public class HibernateTester {
    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();
        Order order = orderDao.getOrderById(1);
        for(OrderItem o: order.getOrderItems()){
            System.out.println(o.getProduct().getName());
        }
    }
}
