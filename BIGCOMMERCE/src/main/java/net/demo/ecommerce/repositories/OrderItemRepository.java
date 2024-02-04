package net.demo.ecommerce.repositories;

import jakarta.transaction.Transactional;
import net.demo.ecommerce.models.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem,Integer> {

    @Query(value = "SELECT * FROM ecommerce.order_item orderItem WHERE orderItem.buyer_id=:userId",nativeQuery = true)
    List<OrderItem> getAllOrdersByUsers(int userId);

    //@Modifying: Informs Spring Data JPA that this query modifies data.
    @Modifying
    @Transactional//proxy object
    @Query(value = "DELETE FROM ecommerce.order_item WHERE buyer_id=:userId", nativeQuery = true)
    void deleteByUserId(@Param("userId") int userId);
}
