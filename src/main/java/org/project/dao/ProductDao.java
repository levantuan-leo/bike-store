package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.project.entity.Category;
import org.project.entity.Product;
import org.project.utils.HibernateUtil;

import java.math.BigDecimal;
import java.util.List;

public class ProductDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    //region [CRUD]
    // Method to CREATE a product in the database
    public Integer addProduct(String name, Category category, BigDecimal price, String picture) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer productID = null;
        try {
            tx = session.beginTransaction();
            Product product = new Product(name, category, price, picture);
            productID = (Integer) session.save(product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productID;
    }

    // Method to READ all the products
    public List<?> listProducts() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Product").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to UPDATE name for a product
    public void updateProduct(Integer ProductID, String name, Category category, BigDecimal price, String picture) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Product product = session.get(Product.class, ProductID);
            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);
            product.setPicture(picture);
            session.update(product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Method to DELETE a product from the records
    public void deleteProduct(Integer ProductID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Product product = session.get(Product.class, ProductID);
            session.delete(product);
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

    public List<?> getProducts(Integer start, Integer limit) {
        try (Session session = factory.openSession()) {
            Query<?> query = session.createQuery("FROM Product");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<?> getProducts(){
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Product").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Product getProductById(int id){
        try (Session session = factory.openSession()) {
            return session.get(Product.class, id);
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Product getBestProductSale(){
        try (Session session = factory.openSession()) {
            return (Product) session.createQuery("FROM Product WHERE id = 1").uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int count() {
        try (Session session = factory.openSession()) {
            Query<?> query = session.createQuery("SELECT COUNT(*) FROM Product");
            return ((Long) query.uniqueResult()).intValue();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            return -1;
        }
    }

}
