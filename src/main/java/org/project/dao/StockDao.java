package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.project.entity.Category;
import org.project.entity.Product;
import org.project.entity.Stock;
import org.project.entity.Store;
import org.project.utils.HibernateUtil;

import java.math.BigDecimal;

public class StockDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    // Method to UPDATE name for a product
    public void updateStock(Integer StockID, Integer quantity) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Stock stock = session.get(Stock.class, StockID);
            stock.setQuantity(quantity);
            session.update(stock);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Stock getStockByProduct(int productId) {
        try (Session session = factory.openSession()) {
            Query<?> query = session.createQuery("FROM Stock WHERE product.id = " + productId + " AND quantity > 0");
            return (Stock) query.list().get(0);
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }
}
