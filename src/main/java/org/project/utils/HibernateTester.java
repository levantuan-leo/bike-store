package org.project.utils;

import org.project.dao.AccountDao;

public class HibernateTester {
    public static void main(String[] args) {
        AccountDao accountDao = new AccountDao();

        System.out.println(accountDao.login("abc", "123", 0));
    }
}
