package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.OrderItem;
import net.demo.ecommerce.repositories.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemService {

    @Autowired
    private OrderItemRepository orderItemRepository;

    public String saveOrderItem(OrderItem orderItem){
        try{
            orderItemRepository.save(orderItem);
            return "Order placed succesfully !!";
        }
        catch (Exception e){
            return e.getMessage();
        }
    }

    public List<OrderItem> getAllOrderItemsByUser(int userId){
        return  orderItemRepository.getAllOrdersByUsers(userId);
    }

    public boolean deleteOrder(int userId){
        try{
            orderItemRepository.deleteByUserId(userId);
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            e.getMessage();
            return false;
        }
    }
}
