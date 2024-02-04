<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Add your additional styles here */
        .product-card {
            display: flex;
            margin-bottom: 1rem;
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            background-color : #fafafa;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.2), 0 1px 1px rgba(0, 0, 0, 0.14), 0 2px 1px -1px rgba(0, 0, 0, 0.12);

        }

        .product-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 1rem;
        }

        .product-details {
            flex-grow: 1;
        }

        .order-summary {
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-top: 1rem;
             box-shadow: 0 0 3px rgba(0, 0, 0, 0.2), 0 1px 1px rgba(0, 0, 0, 0.14), 0 2px 1px -1px rgba(0, 0, 0, 0.12);
              background-color : #fafafa;
        }

        .absolute {
            position: unset;
        }

          #paymentModal {
                    display: none;
                    box-shadow: 0 0 3px rgba(0, 0, 0, 0.2), 0 1px 1px rgba(0, 0, 0, 0.14), 0 2px 1px -1px rgba(0, 0, 0, 0.12);
                }

            #overlay {
                     display: none;
                     position: fixed;
                     top: 0;
                     left: 0;
                     width: 100%;
                     height: 100%;
                     background: rgba(0, 0, 0, 0.5);
                     z-index: 1000;
                 }
                 body{
                 font-family: sans-serif;

                 }

                 #pageName{
                 text-align :center;
                 }

         #placeOrderBtn{
         background-color:#692098;
         }

          #payBtn{
                          background-color:#692098;
                          }
    </style>
</head>


<body class="bg-gray-100 p-8">
<div id="overlay"></div>

  <!-- Payment Modal -->
  <div id="paymentModalBackdrop" class="fixed top-0 left-0 w-full h-full bg-gray-800 opacity-50 z-50 hidden"></div>
  <div id="paymentModal"
       class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white p-8 rounded-md shadow-md">
      <span id="closeModalBtn" class="absolute top-4 right-4 text-gray-500 cursor-pointer text-xl">&times;</span>
      <h2 class="text-lg font-semibold mb-4">Payment Information</h2>
      <form>
          <div class="mb-4">
              <label for="name" class="block text-gray-700" >Name:</label>
              <input type="text" id="name" name="name" readonly class="w-full border rounded-md px-3 py-2">
          </div>
          <div class="mb-4">
              <label for="address" class="block text-gray-700">Address:</label>
              <input type="text" id="address"  name="address" class="w-full border rounded-md px-3 py-2">
          </div>
          <div class="mb-4">
              <label for="phone" class="block text-gray-700">Phone Number:</label>
              <input type="tel" id="phone" name="phone"  class="w-full border rounded-md px-3 py-2">
          </div>
          <div class="mb-4">
              <label for="amount" class="block text-gray-700">Amount:</label>
              <input type="number" id="amount" readonly name="amount" class="w-full border rounded-md px-3 py-2">
          </div>
          <button type="button" id="payBtn"
                  class="w-full rounded-md bg-blue-500 text-white py-2">Pay
          </button>
      </form>
  </div>

    <div class="container mx-auto">
        <h1 class="text-2xl font-semibold mb-4" id="pageName">Checkout Page</h1>

         <div id="cartItemsContainer">
                    <!-- This is where your cart items will be appended -->


                </div>


        <!-- Order Summary -->
        <div id="orderSum" class="order-summary">
            <h2 class="text-lg font-semibold mb-4">Order Summary</h2>



            <hr class="my-2">

            <!-- Total -->

        </div>

        <!-- Place Order Button -->
        <button class="mt-8 w-full rounded-md bg-blue-500 text-white py-2" id="placeOrderBtn">Place Order</button>
    </div>
</body>
<script>
        var totalPrice = [];
        var price;
        var totalcartprice = 0;
        const userId = ${userId};
        var sellerIdArr = [];
        var sellerInfoAndSellsInfo = [];

        document.addEventListener('DOMContentLoaded', function () {

        //Create total div
                            var div1 = document.createElement('div');
                            div1.classList.add('flex', 'justify-between');
                            var span1 = document.createElement('span');
                            span1.classList.add('font-semibold');
                            span1.textContent = "Total";
                            div1.appendChild(span1);
                            var span2 = document.createElement('span');
                            span2.classList.add('text-xl','font-bold');
                            span2.id = "totalPrice";
                            div1.appendChild(span2);
                            orderSum.appendChild(div1);


             // Replace this with the actual user ID
            const cartItemsContainer = document.getElementById('cartItemsContainer');

            // Function to create a product card element
            function createProductCardElement(product) {
                const productCardElement = document.createElement('div');
                productCardElement.classList.add('product-card', 'mb-4');

                const img = document.createElement('img');
                img.src = "data:image/jpeg;base64," + product.imageSrc;
                img.alt = 'Product Image';
                img.classList.add('product-img');

                const productDetailsElement = document.createElement('div');
                productDetailsElement.classList.add('product-details');

                const title = document.createElement('h2');
                title.classList.add('text-lg', 'font-semibold', 'mb-2');
                title.textContent = product.itemname; // Replace with actual property

                let totalPrice;

                const quantity = document.createElement('input');
                quantity.type = "number";
                quantity.classList.add('text-gray-600', 'mb-4');
                quantity.style.textAlign = 'center';
                quantity.style.width = '10rem';
                quantity.value = product.quantity; // Replace with actual property
                quantity.oninput = numberChanged;
                quantity.onchange = numberChanged;
                var span1;
                var span2;
                var priceArr = [];
                var sum = 0;
                function numberChanged() {
                               console.log("Number changed : " +  quantity.value);
                               totalPrice.textContent = "Total Price :" + " ₹"+(product.totalCalculatedPrice*quantity.value);
                                 console.log(span1);
                                 span1.textContent = product.itemname +" x " +quantity.value;

                                  span2.textContent = product.totalCalculatedPrice*quantity.value;
                                  var spans = document.querySelectorAll('.calculatedPriceOfProduct')
                                  console.log(spans);
                                 for(i = 0;i<spans.length;i++){
                                     var sm = spans[i].outerText;

                                           var numericValue = parseInt(sm.replace("₹ ", ""), 10);

                                           if (!isNaN(numericValue)) {

                                               spans[i].textContent = "₹ " + numericValue;

                                               sum += numericValue;
                                           }

                                 }
                                console.log(sum)
                                document.getElementById("totalPrice").textContent ="₹ "+ sum;
                                sum = 0;
                           }

                totalPrice = document.createElement('p');
                totalPrice.classList.add('text-gray-700', 'font-bold', 'text-lg');
                totalPrice.textContent = "Total Price :" + " ₹"+product.totalCalculatedPrice; // Replace with actual property

                const sellerIds = document.createElement('input');
                 sellerIds.classList.add('text-gray-600', 'mb-4');
                 sellerIds.value = "Seller id : " + product.sellerId;
                 sellerIds.style.display = "none";

                 var sellerInfoAndSells = {
                   sellerId : product.sellerId,
                   productQuantity : product.quantity,
                   totalProductPrice : product.totalCalculatedPrice,
                 };

                 sellerInfoAndSellsInfo.push(sellerInfoAndSells);
                 console.log(sellerInfoAndSellsInfo);



// Create a button element for the cross button
var closeButton = document.createElement('button');
closeButton.className = 'absolute top-0 right-0 p-2 text-gray-600 hover:text-red-500 focus:outline-none crossBtn';

// Create an SVG element for the cross icon
var crossIcon = document.createElementNS('http://www.w3.org/2000/svg', 'svg');

crossIcon.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
crossIcon.setAttribute('fill', 'none');
crossIcon.setAttribute('viewBox', '0 0 24 24');
crossIcon.setAttribute('stroke', 'currentColor');
crossIcon.classList.add('h-6','w-6');

// Create a path element for the cross icon
var crossPath = document.createElementNS('http://www.w3.org/2000/svg', 'path');
crossPath.setAttribute('stroke-linecap', 'round');
crossPath.setAttribute('stroke-linejoin', 'round');
crossPath.setAttribute('stroke-width', '2');
crossPath.setAttribute('d', 'M6 18L18 6M6 6l12 12');

crossIcon.appendChild(crossPath);
closeButton.appendChild(crossIcon);

// Assuming productDetailsElement is the container for your product details


                productDetailsElement.appendChild(title);
                productDetailsElement.appendChild(quantity);
                productDetailsElement.appendChild(totalPrice);
                  productDetailsElement.appendChild(sellerIds);

                productCardElement.appendChild(img);
                productCardElement.appendChild(productDetailsElement);
                 productCardElement.appendChild(closeButton);

                 //order summary
                            var topSummary = document.getElementById('orderSum')
                            var orderSummary = document.createElement('div');
                            orderSummary.classList.add('flex', 'justify-between','mb-2',"spansDiv");
                            span1 = document.createElement('span');
                            span1.textContent = product.itemname +" x " +product.quantity;
                             span2 = document.createElement('span');
                             span2.textContent ="₹ "+ product.totalCalculatedPrice;
                             span2.classList.add('calculatedPriceOfProduct');
                             span1.classList.add('nameAndQuantity');


                            orderSummary.appendChild(span1)
                             orderSummary.appendChild(span2)
                            topSummary.appendChild(orderSummary);

                         // Add click event listener to close the product card
                         closeButton.addEventListener('click', function () {
                             const productCardElement = closeButton.closest('.product-card');
                             if (productCardElement) {
                                 // Retrieve details from the product card before removing
                                 const productName = productCardElement.querySelector('.product-details h2').textContent.trim();
                                 const quantity = productCardElement.querySelector('.product-details .text-gray-600').textContent.trim();
                                 const totalCalculatedPrice = productCardElement.querySelector('.product-details .text-gray-700.font-bold.text-lg').textContent.trim();

                                 var divs = document.querySelectorAll('.spansDiv');

                                 divs.forEach(function(div) {

                                     var nameAndQuantitySpan = div.querySelector('.nameAndQuantity');

                                     var nameAndQuantityText = nameAndQuantitySpan.textContent;

                                     console.log(nameAndQuantityText);

                                     if(nameAndQuantityText.includes(productName)){
                                       div.remove();
                                     }
                                 });


                                 console.log('Removed Product Details:');
                                 console.log('Product Name:', productName);
                                 console.log('Quantity:', quantity);
                                 console.log('Total Price:', totalCalculatedPrice);



                                 updateTotalPrice(totalCalculatedPrice);

                                 // Remove the product card
                                 productCardElement.remove();


                                 // You may also want to update the total cart price here

                             }
                         });


                            return productCardElement;

                            }
            // Fetch product data from the backend
            fetch('/cartItems/' + userId)
                .then(response => response.json())
                .then(productsData => {
                    console.log(productsData);

                    // Populate product cards
                    productsData.forEach(product => {
                      price = product.totalCalculatedPrice;
                     totalPrice.push(price);
                        const productCardElement = createProductCardElement(product);
                        cartItemsContainer.appendChild(productCardElement);
                    });

                console.log(totalPrice);

                for(i=0;i<totalPrice.length;i++){
                         totalcartprice = totalcartprice+totalPrice[i];
                     }
                 document.getElementById('totalPrice').textContent ="₹ "+ totalcartprice;

                })
                .catch(error => {
                    console.error('Error fetching products:', error);
                });



        });



           function updateTotalPrice(deletePrice){


               var price = parseInt(deletePrice.replace("Total Price : ₹"," ").trim(),10);
               console.log(price);

               var totalPrice = parseInt(document.getElementById('totalPrice').textContent.replace("₹ ",""),10);
               console.log(totalPrice);

                document.getElementById('totalPrice').textContent = "₹ " + (totalPrice-price);


           }

// JavaScript to handle modal interactions
var modal = document.getElementById('paymentModal');
var openModalBtn = document.getElementById('placeOrderBtn');
var closeModalBtn = document.getElementById('closeModalBtn');





openModalBtn.onclick = function () {
    var elements = document.querySelectorAll('.crossBtn');
     elements.forEach(function(element) {
        element.style.display = 'none';
      });
    modal.style.display = 'block';
    console.log(userId);

    $.ajax({
       type:'GET',
       url:'/getUser/'+userId,
       async : false,
       success : function(jsonResp){
        console.log(jsonResp);
        if(jsonResp){
                    document.getElementById("phone").value  = jsonResp.mobileNo;
                               document.getElementById("name").value  = jsonResp.firstname+" "+jsonResp.lastname;
                               document.getElementById("address").value  = jsonResp.address;
                               document.getElementById("amount").value  =  document.getElementById('totalPrice').textContent.replace("₹ ","");

                }


       },
       error:function(){
        console.log("Error");
       }

    })

}

closeModalBtn.onclick = function () {
var elements = document.querySelectorAll('.crossBtn');
     elements.forEach(function(element) {
        element.style.display = 'block';
      });
    modal.style.display = 'none';
}

window.onclick = function (event) {
    if (event.target === modal) {
    var elements = document.querySelectorAll('.crossBtn');
         elements.forEach(function(element) {
            element.style.display = 'block';
          });
        modal.style.display = 'none';
    }
}
  var orderConfirmation = false;
   $("#payBtn1").click(function(){
       let text = confirm("Amount Payable : " +  document.getElementById("amount").value);

           if(text == true){
             var obj = {
                     userId : userId,
                     name: document.getElementById("name").value,
                     phone: document.getElementById("phone").value,
                     address: document.getElementById("address").value,
                     amount :  parseInt(document.getElementById("amount").value,10)

                 }

                 if(text == true){
                    $.ajax({
                     method:"POST",
                     url:"/payment",
                     data:JSON.stringify(obj),
                     contentType:'application/json',
                     success:function(data){
                         alert('Payment Successful');
                          if((data != null) || (data != "")){
                            orderConfirmation = true;
                          }
                          alert(orderConfirmation);
                         },
                         error:function(err){
                             alert('Something went wrong!')
                             }


                    })
                      if(orderConfirmation){
                                                                      $.ajax({
                                                                        url:'/saveSeller',
                                                                        type:"POST",
                                                                        data:JSON.stringify(sellerInfoAndSellsInfo),
                                                                        contentType:"application/json",
                                                                        success:function(jsonResp){
                                                                          alert(jsonResp);
                                                                        },
                                                                        error: function (xhr, status, error) {
                                                                            console.log("There was an error with your request.", xhr.status);
                                                                            }

                                                                      })
                                                                      }

               }

           }
   })




 $("#payBtn").click(function(){

                    $.ajax({
                     method:"GET",
                     url:"/payment/"+parseInt(document.getElementById('totalPrice').textContent.replace("₹ ","")),
                     success:function(jsonResp){

                         if(jsonResp != "BAD_REQUEST_ERROR:amount exceeds maximum amount allowed."){

                          alert("Payment link is created successfully !!");
                          window.location.href = jsonResp;
                         }
                         else{
                         alert(jsonResp);
                         }
                         },
                         error:function(err){
                             alert('Something went wrong!')
                             }


                    })
                })

</script>

</html>