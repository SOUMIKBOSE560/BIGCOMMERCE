package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.Seller;
import net.demo.ecommerce.repositories.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SellerService {

    @Autowired
    private SellerRepository sellerRepository;

    public String  sellerAndSellInfo(Seller seller){
        sellerRepository.save(seller);
        return "saved";
    }

    public  Map<Integer,Seller> getSellinfoBySellerId(int sellerid){
        List<Seller> sellInfo =  sellerRepository.getSellerInfoBySellerId(sellerid);

        Map<Integer,Seller> sellInfoSet = new HashMap<>();

        for(Seller s : sellInfo){

            if(!sellInfoSet.containsKey(s.getSellerId())){
                sellInfoSet.put(s.getSellerId(),s);
            }else{
                Seller seller = sellInfoSet.get(s.getSellerId());
                int OldQuantity = seller.getProductQuantity();
                int newQuantity = OldQuantity + s.getProductQuantity();
                seller.setProductQuantity(newQuantity);

                int OldPrice = seller.getTotalProductPrice();
                int newPrice = OldPrice + s.getTotalProductPrice();
                seller.setTotalProductPrice(newPrice);
            }
        }

        return sellInfoSet;
    }
}
