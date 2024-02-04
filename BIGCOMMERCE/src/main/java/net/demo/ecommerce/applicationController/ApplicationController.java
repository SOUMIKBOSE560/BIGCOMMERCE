package net.demo.ecommerce.applicationController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.demo.ecommerce.models.Seller;
import net.demo.ecommerce.servicePackage.SellerService;
import net.demo.ecommerce.servicePackage.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class ApplicationController {

	@Autowired
	private UserService userService;

	@Autowired
	private SellerService sellerService;
	@RequestMapping("/")
	public String registration(){
       return "registration";		
	}

	@RequestMapping("/loginPage")
	public String loginPage(){
		return "login";
	}



	@GetMapping("/sellerDashBoard/{sellerId}")
	public String sellerDashboard(@PathVariable int sellerId ,HttpServletRequest request) throws JsonProcessingException {
		request.setAttribute("userID",sellerId);
		Map<Integer,Seller> sellListBySeller = sellerService.getSellinfoBySellerId(sellerId);
		System.out.println(sellListBySeller);
		int totalPrice = sellListBySeller.get(sellerId).getTotalProductPrice();
		System.out.println(totalPrice);
		request.setAttribute("price",totalPrice);

		//return "sellerDashboard";
		return "sellerFileUpload";
	}

	@GetMapping("/ShoppingSite/{sellerId}")
	public String ShoppingSite(@PathVariable int sellerId,HttpServletRequest request ){
		request.setAttribute("id",sellerId);
		return "productListPage";}


	@GetMapping("/cartPage/{sellerId}")
	public String checkout(@PathVariable int sellerId,HttpServletRequest request){
		request.setAttribute("userId",sellerId);
		return "cartPage";};


	@GetMapping("/trackshipment")
	public String getTrack(){
		return "shipMent_Track";
	}


}
