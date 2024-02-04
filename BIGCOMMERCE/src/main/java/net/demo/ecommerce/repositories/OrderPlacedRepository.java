package net.demo.ecommerce.repositories;

import net.demo.ecommerce.models.PlacedOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderPlacedRepository extends JpaRepository<PlacedOrder,Integer> {

}
