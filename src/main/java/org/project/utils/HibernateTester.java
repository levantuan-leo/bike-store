package org.project.utils;

import org.project.dao.CategoryDao;
import org.project.entity.Category;

import java.util.List;

public class HibernateTester {
    public static void main(String[] args) {
        CategoryDao categoryDao = new CategoryDao();

        List<?> categories = categoryDao.listCategories();
        categories.forEach(c -> System.out.printf("%s", ((Category) c).getId()));
    }
}
