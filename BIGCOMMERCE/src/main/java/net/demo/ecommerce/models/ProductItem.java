package net.demo.ecommerce.models;

import jakarta.persistence.*;

import java.util.Arrays;

@Table(name = "Product_Table")
@Entity
public class ProductItem {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String fileName;
    private String fileType;
    private String fileContent;

    private String productName;
    private int  productPrice;
    private int productQuantity;

    private int sellerId;

    public ProductItem(){}


    public ProductItem(String fileName, String fileType, String fileContent, String productName, int  productPrice, int productQuantity, int sellerId) {
        this.sellerId = sellerId;
        this.id = id;
        this.fileName = fileName;
        this.fileType = fileType;
        this.fileContent = fileContent;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
    }

    public int getId() {
        return id;
    }



    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFileContent() {
        return fileContent;
    }

    public void setFileContent(String fileContent) {
        this.fileContent = fileContent;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    @Override
    public String toString() {
        return "ProductItem{" +
                "id=" + id +
                ", fileName='" + fileName + '\'' +
                ", fileType='" + fileType + '\'' +
                ", fileContent='" + fileContent + '\'' +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", productQuantity=" + productQuantity +
                ", sellerId=" + sellerId +
                '}';
    }
}
