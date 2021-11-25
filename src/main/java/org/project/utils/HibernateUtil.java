package org.project.utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import org.project.entity.Brand;
import org.project.entity.Category;
import org.project.entity.Product;

public class HibernateUtil {
    private static final SessionFactory FACTORY;

    static {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");

        configuration.addAnnotatedClass(Category.class);
        configuration.addAnnotatedClass(Brand.class);
        configuration.addAnnotatedClass(Product.class);

        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .applySettings(configuration.getProperties()).build();
        FACTORY = configuration.buildSessionFactory(registry);
    }

    public static SessionFactory getSessionFactory() {
        return FACTORY;
    }
}
