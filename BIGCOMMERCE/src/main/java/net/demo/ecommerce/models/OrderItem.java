package net.demo.ecommerce.models;

import jakarta.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
   private int productId;
    private String productName ;
    private int productQuantity ;
    private int totalPrice;
   private int buyerId ;

    private int sellerId ;

    public OrderItem(){};

    public OrderItem(int productId, String productName, int productQuantity, int totalPrice, int buyerId,int sellerId) {
        this.id = id;
        this.productId = productId;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.totalPrice = totalPrice;
        this.buyerId = buyerId;

        this.sellerId = sellerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }


    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productQuantity=" + productQuantity +
                ", totalPrice=" + totalPrice +
                ", buyerId=" + buyerId +
                ", sellerId=" + sellerId +
                '}';
    }
}
