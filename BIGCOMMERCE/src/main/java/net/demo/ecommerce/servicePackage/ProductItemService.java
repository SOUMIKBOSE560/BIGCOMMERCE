package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.OrderItem;
import net.demo.ecommerce.models.ProductItem;
import net.demo.ecommerce.repositories.ProductItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class ProductItemService {

    @Autowired
    private ProductItemRepository productItemRepository;

    public String uploadProductItem(ProductItem productItem) throws IOException {

        productItemRepository.save(productItem);

        return "ProductItem saved successfully !!";
    }

    public List<ProductItem> getAllItem(){
        return productItemRepository.findAll();
    }

    public boolean deleteALlOrderItem(){
        try{
            productItemRepository.deleteById(3);
            return true;
        }

        catch (Exception e){
            return false;
        }
    }


    public List<ProductItem> findBySellerId(String sellerId) {
        try{
            return productItemRepository.findBySellerId(sellerId);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }


    public boolean getProductById(int itemId, int quantity) {
        Optional<ProductItem> productItem  = productItemRepository.findById(itemId);
        if(productItem.isPresent()){
            ProductItem productItem1 = productItem.get();
            productItem1.setProductQuantity(productItem1.getProductQuantity() - quantity);
            productItemRepository.save(productItem1);
            System.out.println(productItem1.getProductQuantity());
            return true;
        }
       return false;
    }

    public boolean deleteProductById(int id){
        try{
            productItemRepository.deleteById(id);
            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}

