package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.project.entity.Category;
import org.project.entity.Product;
import org.project.entity.Store;
import org.project.utils.HibernateUtil;

import java.math.BigDecimal;
import java.util.List;

public class StoreDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public Store getStoreById(Integer storeId){
        try (Session session = factory.openSession()) {
            return session.get(Store.class, storeId);
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }
}
