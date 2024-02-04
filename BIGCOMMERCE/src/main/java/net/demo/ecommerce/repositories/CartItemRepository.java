package net.demo.ecommerce.repositories;

import jakarta.transaction.Transactional;
import net.demo.ecommerce.models.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem,Integer> {

    @Query(value = "SELECT * FROM ecommerce.cart_item c WHERE c.buyer_id=:userId",nativeQuery = true)
    List<CartItem> getCardItemsByUserId(int userId);

    @Modifying
    @Transactional//proxy object
    @Query(value = "DELETE FROM ecommerce.cart_item WHERE buyer_id=:userId", nativeQuery = true)
    void deleteAllByUserId(@Param("userId") int userId);
}
