package org.project.utils;

import java.util.Map;

public class CartStats {
    private int totalQuantity;
    private double totalAmount;

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public CartStats(Map<Integer, CartItem> cart) {
        if (cart != null) {
            int quantity = 0;
            double amount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                quantity += entry.getValue().getQuantity();
                amount += entry.getValue().getProduct().getPrice().doubleValue() * entry.getValue().getQuantity();
            }
            setTotalQuantity(quantity);
            setTotalAmount(amount);
        } else {
            setTotalQuantity(0);
            setTotalAmount(0);
        }
    }
}
