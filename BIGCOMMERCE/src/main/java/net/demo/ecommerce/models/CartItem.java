package net.demo.ecommerce.models;

import jakarta.persistence.*;
import org.springframework.web.bind.annotation.GetMapping;

@Entity
@Table(name = "cart_item")
public class CartItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;



    private String itemname;

    private int itemId;
    private int buyerId;
    private int sellerId;
    private int quantity;
    private int totalCalculatedPrice;

    private String imageSrc;

    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", itemname='" + itemname + '\'' +
                ", itemId=" + itemId +
                ", buyerId=" + buyerId +
                ", sellerId=" + sellerId +
                ", quantity=" + quantity +
                ", totalCalculatedPrice=" + totalCalculatedPrice +
                ", imageSrc='" + imageSrc + '\'' +
                '}';
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public int getId() {
        return id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalCalculatedPrice() {
        return totalCalculatedPrice;
    }

    public void setTotalCalculatedPrice(int totalCalculatedPrice) {
        this.totalCalculatedPrice = totalCalculatedPrice;
    }

}
