package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.project.entity.Customer;
import org.project.entity.Product;
import org.project.utils.HibernateUtil;

import java.util.List;

public class CustomerDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    //region [CRUD]
    // Method to CREATE a customer in the database
    public Integer addCustomer(String name, String email) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer customerID = null;
        try {
            tx = session.beginTransaction();
            Customer customer = new Customer(name, email);
            customerID = (Integer) session.save(customer);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return customerID;
    }

    // Method to READ all the customers
    public List<?> listCustomers() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Customer ").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to UPDATE * for a customer
    public void updateCustomer(Integer CustomerID, String name, String phone, String email, String address) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Customer customer = session.get(Customer.class, CustomerID);
            customer.setName(name);
            customer.setPhone(phone);
            customer.setEmail(email);
            customer.setAddress(address);
            session.update(customer);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Method to DELETE a customer from the records
    public void deleteCustomer(Integer CustomerID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Customer customer = session.get(Customer.class, CustomerID);
            session.delete(customer);
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

    public Customer getCustomerById(int id){
        try (Session session = factory.openSession()) {
            return session.get(Customer.class, id);
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int count() {
        try (Session session = factory.openSession()) {
            Query<?> query = session.createQuery("SELECT COUNT(*) FROM Customer ");
            return ((Long) query.uniqueResult()).intValue();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int countCustomerByStore (Integer storeId){
        try (Session session = factory.openSession()) {
            Query<?> query =
                    session.createQuery("select count(*) FROM Customer WHERE  store.id = "+ storeId +"");
            return  ((Long) query.uniqueResult()).intValue();
        } catch (HibernateException e) {
            e.printStackTrace();
            return -1;
        }
    }
}
