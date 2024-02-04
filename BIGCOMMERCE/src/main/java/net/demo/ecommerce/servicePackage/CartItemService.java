package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.CartItem;
import net.demo.ecommerce.repositories.CartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class CartItemService {

    @Autowired
    private CartItemRepository cartItemRepository;

    public String addToCart(CartItem cartItem){
        try{
            cartItemRepository.save(cartItem);
            return "Added to cart";
        }
        catch(Exception e){
            return e.getMessage();
        }
    }

    public List<CartItem> getCardItemsByUserId(int userId) {

        return cartItemRepository.getCardItemsByUserId(userId);
    }

    public boolean deleteCartItems(int userId){
        try {
            cartItemRepository.deleteAllByUserId(userId);
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
