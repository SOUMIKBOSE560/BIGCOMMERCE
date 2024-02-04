package net.demo.ecommerce.repositories;


import net.demo.ecommerce.models.ProductItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductItemRepository extends JpaRepository<ProductItem,Integer> {
    @Query(value = "DELETE FROM ecommerce.product_table WHERE product_price='$2000'",nativeQuery = true)
    List<ProductItem> deleteA();

    @Query(value="SELECT * FROM ecommerce.product_table p WHERE p.seller_id=:sellerId",nativeQuery = true)
    List<ProductItem> findBySellerId(String sellerId);
}
