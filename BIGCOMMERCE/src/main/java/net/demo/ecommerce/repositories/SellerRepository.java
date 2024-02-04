package net.demo.ecommerce.repositories;

import net.demo.ecommerce.models.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SellerRepository extends JpaRepository<Seller,Integer> {

    @Query(value = "SELECT * FROM ecommerce.seller s WHERE s.seller_id=:sellerId",nativeQuery = true)
    List<Seller> getSellerInfoBySellerId(int sellerId);
}
