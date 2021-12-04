package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.project.entity.*;
import org.project.utils.HibernateUtil;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class OrderItemDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    //region [CRUD]
    // Method to CREATE an order item in the database
    public Integer addOrderItem(Order order, Product product, Integer quantity) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer orderItemID = null;
        try {
            tx = session.beginTransaction();
            OrderItem orderItem = new OrderItem(order, product, quantity);
            orderItemID = (Integer) session.save(orderItem);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return orderItemID;
    }

    // Method to READ all the order items
    public List<?> listOrders() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM OrderItem").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to UPDATE for an order item
    public void updateOrderItem(Integer OrderItemID, Integer quantity, BigDecimal price, BigDecimal discount) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            OrderItem orderItem = session.get(OrderItem.class, OrderItemID);
            orderItem.setQuantity(quantity);
            orderItem.setUnitPrice(price);
            orderItem.setDiscount(discount);
            session.update(orderItem);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Method to DELETE an order from the records
    public void deleteOrder(Integer OrderItemID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            OrderItem orderItem = session.get(OrderItem.class, OrderItemID);
            session.delete(orderItem);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    // endregion
}
