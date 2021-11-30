package org.project.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "sales.account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private int id;

    @Column(name = "joined_date", columnDefinition = "date default cast(getDate() as date)")
    private Date joinedDate;

    @Column(columnDefinition = "int default 0")
    private boolean active;

    private String email;
    private String password;
    @Column(columnDefinition = "int default 0")
    private int role;

    public Account(String email, String password, int role, Customer customer) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.customer = customer;
    }

    public Account() {
    }

    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getJoinedDate() {
        return joinedDate;
    }

    public void setJoinedDate(Date joinedDate) {
        this.joinedDate = joinedDate;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
