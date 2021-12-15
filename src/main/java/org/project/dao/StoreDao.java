package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
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

    public List<?> listStores() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Store ").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int count() {
        try (Session session = factory.openSession()) {
            Query<?> query = session.createQuery("SELECT COUNT(*) FROM Order ");
            return ((Long) query.uniqueResult()).intValue();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            return -1;
        }
    }
}
