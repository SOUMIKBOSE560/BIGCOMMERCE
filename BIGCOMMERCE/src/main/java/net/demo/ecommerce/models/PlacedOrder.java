package net.demo.ecommerce.models;


import jakarta.persistence.*;

@Entity
@Table(name = "place_order")
public class PlacedOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "user/buyer_id")
    private int userId;

    @Column(name = "buyer_name")
    private String name;

    @Column(name = "buyer_phone_no")
    private String phone;

    @Column(name = "buyer_address_for_shipment")
    private String address;

    @Override
    public String toString() {
        return "PlacedOrder{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +

                ", amount=" + amount +
                '}';
    }





    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Column(name = "paid_amount")
    private int amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
