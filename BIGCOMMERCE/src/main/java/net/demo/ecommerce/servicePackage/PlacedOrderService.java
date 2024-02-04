package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.PlacedOrder;
import net.demo.ecommerce.repositories.OrderPlacedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlacedOrderService {

    @Autowired
    private OrderPlacedRepository orderPlacedRepository;

    public PlacedOrder saveOrder(PlacedOrder placedOrder){
        try {
            return orderPlacedRepository.save(placedOrder);
        }
        catch (Exception e){
            return null;
        }
    }

}
