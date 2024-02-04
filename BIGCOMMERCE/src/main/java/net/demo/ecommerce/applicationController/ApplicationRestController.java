package net.demo.ecommerce.applicationController;


import com.razorpay.PaymentLink;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import jakarta.servlet.http.HttpServletRequest;
import net.demo.ecommerce.models.*;
import net.demo.ecommerce.servicePackage.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@RestController
public class ApplicationRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private ApplicationController applicationController;

    @Autowired
    private ProductItemService productItemService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private PlacedOrderService placedOrderService;

    @Autowired
    private SellerService sellerService;

    @Value("${project.admin.id}")
    private String ADMIN_ID;

    @Value("${razorpay.key_id}")
    private String KEY_ID ;

    @Value("${razorpay.key_secret}")
    private String KEY_SECRET;

    @PostMapping("/registration")
    public String saveUser(@RequestBody User user){

            if(userService.saveUser(user)){
                return "User registered successfully !!";
            }
        return "Error occurred while registering user !";

    }

     @GetMapping("/getUsers/{address}")
    public List<User> getUsers(@PathVariable String address){
        return userService.getUsersByAddress(address);
     }

     @GetMapping("/login")
    public String login(@RequestParam(name = "name") String name,@RequestParam(name="password") String password){
         List<User> users = new ArrayList<>();
         users = userService.getUsersByName(name);
         System.out.println(users);
         for(User user : users){
             if(((user.getFirstname()+ " " + user.getLastname()).equals(name)) && (user.getPassword().equals(password))){

                 System.out.println(checkUserRole(user.getRole()));
                 return checkUserRole(user.getRole()) + " " +  user.getId();

             }
         }
        return "Invalid Username or Password !!";
     }

     @DeleteMapping("/deleteAllUsers/{adminId}")
    public String deleteAllUsers(@PathVariable String adminId){
         if(adminId.equals(ADMIN_ID)){
            return userService.deleteAllUser();
         }
         return "Error occurred";
     }

    static String checkUserRole(String userRole) {
        System.out.println(userRole);
        if (userRole.equalsIgnoreCase("buyer")) {
            return "Buyer";
        }
        if (userRole.equalsIgnoreCase("seller")) {
            return "Seller";
        }
        return "Role not recognized";
    }

    @GetMapping("/getUser/{userId}")
    public User getUserById(@PathVariable int userId){

        return userService.getUserById(userId);

    }

    //Product uploader

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file,
                         @RequestParam("name") String productName,
                         @RequestParam("price") String price,
                         @RequestParam("quantity") String quantity,
                         @RequestParam("sellerId") String sellerId) throws IOException {

        int productPrice = Integer.parseInt(price);
        int productQuantity = Integer.parseInt(quantity);
        int sellerIdInt = Integer.parseInt(sellerId);

        ProductItem productItem = new ProductItem(
                file.getOriginalFilename(),
                file.getContentType(),
                Base64.getEncoder().encodeToString(file.getBytes()),
                productName,
                productPrice,
                productQuantity,
                sellerIdInt
        );

       return productItemService.uploadProductItem(productItem);


    }


    @GetMapping("/getAllItem")
     public List<ProductItem> getAllItem(){
         return productItemService.getAllItem();

     }

    @DeleteMapping("/deleteAllmyItem")
        public boolean deleteAllItem(){
            return productItemService.deleteALlOrderItem();
         }


         @DeleteMapping("/deleteitem/{productId}")
         public boolean deleteProduct(@PathVariable int productId){
          return productItemService.deleteProductById(productId);
         }

    @GetMapping("/getAllItem/{sellerId}")
    public List<ProductItem> del(@PathVariable String sellerId){
        return productItemService.findBySellerId(sellerId);
    }


    //Order Item
    @PostMapping("/order")
    public String orderItem(@RequestBody OrderItem orderItem){
        System.out.println(orderItem);
      return orderItemService.saveOrderItem(orderItem);
    }

    @GetMapping("/getUserOrderItems/{userId}")
    public List<OrderItem> getUserOrderItems(@PathVariable int userId){
        return orderItemService.getAllOrderItemsByUser(userId);
    }

    @DeleteMapping("/deleteOrder/{sellerId}")
    public boolean deleteOrder(@PathVariable int sellerId){
        return orderItemService.deleteOrder(sellerId);
    }


    //Cart item
    @PostMapping("/addToMyCart")
    public String addToMyCart(@RequestBody CartItem cartItem){

        if(cartItemService.addToCart(cartItem).equals("Added to cart")){
            if(productItemService.getProductById(cartItem.getItemId(),cartItem.getQuantity())){
                return cartItemService.addToCart(cartItem);
            };
        }

        return "Error";

    }

    @GetMapping("/cartItems/{userId}")
    public List<CartItem> getUserCartitems(@PathVariable int userId) {
        try {
            System.out.println(cartItemService.getCardItemsByUserId(userId));

            List<CartItem> cartItems = cartItemService.getCardItemsByUserId(userId);

            Map<Integer, CartItem> aggregatedCartItemsMap = new HashMap<>();

            for (CartItem cartItem : cartItems) {
                int itemId = cartItem.getItemId();

                // If the item ID is not in the map, add it with the current CartItem
                if (!aggregatedCartItemsMap.containsKey(itemId)) {
                    aggregatedCartItemsMap.put(itemId, cartItem);
                } else {
                    // If the item ID is already in the map, update quantity and totalCalculatedPrice
                    CartItem existingCartItem = aggregatedCartItemsMap.get(itemId);
                    existingCartItem.setQuantity(existingCartItem.getQuantity() + cartItem.getQuantity());
                    existingCartItem.setTotalCalculatedPrice(existingCartItem.getTotalCalculatedPrice() + cartItem.getTotalCalculatedPrice());
                }
            }

            // Create a list of aggregated CartItems
            List<CartItem> aggregatedCartItems = new ArrayList<>(aggregatedCartItemsMap.values());
            return aggregatedCartItems;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    //final placed order for shipment
    @PostMapping("/payment")
    public PlacedOrder placeOrder(@RequestBody PlacedOrder placedOrder){

        try {
            PlacedOrder placed  = placedOrderService.saveOrder(placedOrder);
            if(!placed.equals(null)){
                cartItemService.deleteCartItems(placedOrder.getUserId());
            }

            return placed;
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    //After order placed
    @PostMapping("/saveSeller")
    public String sellerAndSells(@RequestBody Seller[] seller)throws IOException{

        System.out.println("Seller method");

        for (Seller value : seller) {
            sellerService.sellerAndSellInfo(value);
            System.out.println(sellerService.sellerAndSellInfo(value));
        }

        return "Saved";
    }

//    @GetMapping("/sellerDashboard/{id}")
//    public String sellerDashboard(@PathVariable int id){
//        List<Seller> seller = sellerService.getSellinfoBySellerId(id);
//        Map<Integer,Seller> userSet = new HashMap<>();
//        for (Seller s : seller){
//            if(!userSet.containsKey(s.getSellerId())){
//                userSet.put(s.getSellerId(),s);
//            }
//            else{
//             Seller ex = userSet.get(s.getSellerId());
//             int existing = userSet.get(s.getSellerId()).getProductQuantity();
//             int newQuantity = s.getProductQuantity();
//             ex.setProductQuantity(existing+newQuantity);
//
//                Seller ex1 = userSet.get(s.getSellerId());
//                int existing1= userSet.get(s.getSellerId()).getTotalProductPrice();
//                int newProductPrice = s.getTotalProductPrice();
//                ex.setTotalProductPrice(existing1+newProductPrice);
//
//            }
//        }
//        return userSet.toString();
//    }

    //Payment system

    @GetMapping("/payment/{amount}")
    public String payment(@PathVariable("amount") int amount) {

        try {

            RazorpayClient client = new RazorpayClient(KEY_ID, KEY_SECRET);

            JSONObject paymentObject = new JSONObject();

            paymentObject.put("amount", amount*100);
            paymentObject.put("currency", "INR");

            PaymentLink paymentLink = client.paymentLink.create(paymentObject);
            return paymentLink.get("short_url");

        } catch (RazorpayException e) {
            return e.getMessage();

        }

    }

}


