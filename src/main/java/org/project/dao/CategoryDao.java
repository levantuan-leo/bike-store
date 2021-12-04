package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.project.entity.Category;
import org.project.utils.HibernateUtil;

import java.util.List;

public class CategoryDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    //region [CRUD]
    // Method to CREATE a Category in the database
    public Integer addCategory(String name) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer categoryID = null;
        try {
            tx = session.beginTransaction();
            Category category = new Category(name);
            categoryID = (Integer) session.save(category);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return categoryID;
    }

    // Method to READ all the Categories
    public List<?> listCategories() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Category").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to UPDATE name for a category
    public void updateCategory(Integer CategoryID, String name) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Category category = session.get(Category.class, CategoryID);
            category.setName(name);
            session.update(category);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Method to DELETE a category from the records
    public void deleteCategory(Integer CategoryID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Category category = session.get(Category.class, CategoryID);
            session.delete(category);
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

    public Category getCategoryById(int id){
        try (Session session = factory.openSession()) {
            return session.get(Category.class, id);
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }}

