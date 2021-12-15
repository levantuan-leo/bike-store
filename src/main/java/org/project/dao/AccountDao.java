package org.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.project.entity.Account;
import org.project.entity.Customer;
import org.project.utils.HibernateUtil;

import java.util.List;

public class AccountDao {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    //region [CRUD]
    // Method to CREATE an account in the database
    public Integer addAccount(String email, String password, Customer customer) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer productID = null;
        try {
            tx = session.beginTransaction();
            Account account = new Account(email, password, customer);
            productID = (Integer) session.save(account);
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

    // Method to READ all the accounts
    public List<?> listAccounts() {
        try (Session session = factory.openSession()) {
            return session.createQuery("FROM Account ").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to UPDATE name for an account
    public void updateAccount(Integer AccountID, String email, String password, int role) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Account account = session.get(Account.class, AccountID);
            account.setEmail(email);
            account.setPassword(password);
            account.setRole(role);
            session.update(account);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Method to DELETE an account from the records
    public void deleteAccount(Integer AccountID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Account account = session.get(Account.class, AccountID);
            session.delete(account);
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

    public Account login(String email, String password){
        try (Session session = factory.openSession()) {
            Query<?> query =
                    session.createQuery("FROM Account WHERE email='"+ email +"' AND password='"+ password +"'");
            return (Account) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }
}
