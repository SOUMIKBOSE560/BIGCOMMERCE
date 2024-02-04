<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping List</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6.3.1/dist/tippy-bundle.umd.min.js"></script>
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .sm\:py-24 {
            padding-top: 1rem !important;
        }

        body {
            overflow-y: scroll;
            /* Always show vertical scrollbar */
            font-family: sans-serif;
        }

        .buyBtns {
            float: right;
        }

        .Btns {
            padding-top: 0.2rem;
            padding-bottom: 0.2rem;
        }


        .group {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0.2rem;
            padding-right: 0.2rem;
            background-color: #fafafa;


        }

        .group:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.1);
            /* Box shadow for the hover effect */
        }

        .hiddenClass {
            display: none;
        }

        #quantityNo {
            float: right;
            width: 4rem;
        }

        #headerImg{
         padding-bottom:0rem;
        }

    #navBar{
      background-color : #692098;

    }

    </style>

    <body
        style="background: url('') no-repeat center center fixed; background-size: cover;">
        <input type="hidden" id="userId" value="${id}">




       <nav id="navBar" class="bg-blue-800 p-4 sticky top-0 z-50">
               <div class="container mx-auto flex justify-between items-center">
                   <!-- Logo or Brand -->
                   <a href="#" class="text-white text-lg font-semibold"> <img src="https://i.postimg.cc/1Xj7wzrv/logo.jpg" alt="Your Logo" class="h-10 w-auto"></a>

                   <!-- Navigation Links -->
                   <!-- Search Section -->
                   <div class="flex items-center"></div>
                   <div class="space-x-4">
                       <input type="text" id="searchInput" style="font-size:small" placeholder="Search" class="px-2 py-1 border rounded focus:outline-none">
                       <a href="#" class="text-white hover:text-gray-300" style="font-size:small">HOME</a>
                       <a href="#" class="text-white hover:text-gray-300" style="font-size:small">PRODUCTS</a>
                       <a href="#" class="text-white hover:text-gray-300" style="font-size:small">ABOUT US</a>
                       <!-- Add more navigation links as needed -->

                       <!-- Checkout Icon -->
                       <button id="checkoutBtn" class="text-white hover:text-gray-300 focus:outline-none">
                           <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                       </button>
                   </div>
               </div>
           </nav>



        <!-- Checkout Modal -->
        <div id="checkoutModal"
            class="fixed top-0 left-0 w-full h-full bg-gray-900 bg-opacity-75 flex items-center justify-center hidden">
            <div class="bg-white p-8 rounded-lg">
                <h2 class="text-2xl font-semibold mb-4">Checkout Modal</h2>
                <!-- Add your checkout content here -->

                <!-- Close Button -->
                <button id="closeModal" class="text-gray-500 hover:text-gray-700 focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12">
                        </path>
                    </svg>
                </button>
            </div>
        </div>

        <div class="bg-grey>

        </div>
         <div class="bg-grey">
                    <div id="headerImg" class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                    <img src = 'https://www-cdn.bigcommerce.com/assets/article-header-sell-online-page-builder-bigcommerce.png' ></img>
                  </div>
                 </div>

        <div class="bg-grey
  ">
            <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                <h2 class="sr-only">Products</h2>





                <!-- <a href="#" class="group">
          <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7">
            <img src="https://tailwindui.com/img/ecommerce-images/category-page-04-image-card-04.jpg" alt="Hand holding black machined steel mechanical pencil with brass tip and top." class="h-full w-full object-cover object-center group-hover:opacity-75">
          </div>
          <h3 class="mt-4 text-sm text-gray-700">Machined Mechanical Pencil</h3>
          <p class="mt-1 text-lg font-medium text-gray-900">$35</p>
        </a>-->



                <div id="imageSection"
                    class="grid grid-cols-1 gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-6 xl:grid-cols-5 xl:gap-x-4">
                    <!-- Dynamically generated image cards will be inserted here -->
                </div>


                <!-- More products... -->
            </div>
        </div>
        </div>

    </body>

    <script>
        // Function to fetch images from the API
        async function fetchImages() {
            try {
                const response = await fetch('/getAllItem'); // Replace with your API endpoint
                const data = await response.json();

                // Call a function to dynamically generate image cards based on the fetched data
                generateImageCards(data);
            } catch (error) {
                console.error('Error fetching images:', error);
            }
        }

        // Function to dynamically generate image cards
        function generateImageCards1(images) {

            const imageSection = document.getElementById('imageSection');

            // Clear existing content
            imageSection.innerHTML = '';

            // Loop through the images and create HTML elements
            images.forEach(image => {
                const imageCard = document.createElement('a');
                imageCard.href = '#';
                imageCard.classList.add('group');


                const aspectRatioDiv = document.createElement('div');
                aspectRatioDiv.classList.add('aspect-h-1', 'aspect-w-1', 'w-full', 'overflow-hidden', 'rounded-lg', 'bg-gray-200', 'xl:aspect-h-8', 'xl:aspect-w-7');

                const img = document.createElement('img');
                console.log("data:image/jpeg;base64," + image.fileContent);
                img.src = "data:" + image.fileType + ";base64," + image.fileContent;
                console.log(img.src);
                img.alt = 'Image';
                img.classList.add('h-full', 'w-full', 'object-cover', 'object-center', 'group-hover:opacity-75');


                const title = document.createElement('h3');
                title.classList.add('mt-4', 'text-sm', 'text-gray-700');
                title.textContent = image.fileName;

                const price = document.createElement('p');
                price.classList.add('mt-1', 'text-lg', 'font-medium', 'text-gray-900');
                price.textContent = '$89'; // You may adjust this based on your data model

                // Append elements to the image card
                aspectRatioDiv.appendChild(img);
                imageCard.appendChild(aspectRatioDiv);
                imageCard.appendChild(title);
                imageCard.appendChild(price);

                // Append the image card to the imageSection
                imageSection.appendChild(imageCard);
            });
        }

        // Fetch images when the page loads
        document.addEventListener('DOMContentLoaded', fetchImages);



        //

        // Function to dynamically generate image cards
        function generateImageCards(images) {
            const imageSection = document.getElementById('imageSection');
            console.log(images);
            // Clear existing content
            imageSection.innerHTML = '';

            // Loop through the images and create HTML elements
            images.forEach(image => {

                const imageCard = document.createElement('a');
                imageCard.classList.add('group');

                // Update the following line to set default width and height
                const aspectRatioDiv = document.createElement('div');
                aspectRatioDiv.classList.add('w-full', 'overflow-hidden', 'rounded-lg', 'bg-gray-200','imgSrcDiv');
                aspectRatioDiv.style.width = 'auto'; // Set default width
                aspectRatioDiv.style.height = '10rem'; // Set default height

                const img = document.createElement('img');
                img.src = "data:" + image.fileType + ";base64," + image.fileContent;
                img.alt = 'Image';
                img.classList.add('h-full', 'w-full', 'object-cover', 'object-center', 'group-hover:opacity-75');

                const title = document.createElement('h4');
                title.classList.add('mt-4', 'text-sm', 'text-gray-700', 'itemName');
                title.textContent = image.productName;
                title.style.fontWeight = '600';
                 title.style.textAlign = 'center';
                 title.style.color = '#692098';

                const quantity = document.createElement('input');
                quantity.classList.add('mtd-4', 'text-sm', 'text-gray-700', 'productQuantity', 'hiddenClass');

                quantity.value = image.productQuantity;

                const sellerId = document.createElement('input');
                sellerId.classList.add('mtd-4', 'text-sm', 'text-gray-700', 'sellerId', 'hiddenClass');
                sellerId.value = image.sellerId;

                const productItemId = document.createElement('input');
                productItemId.classList.add('mtd-4', 'text-sm', 'text-gray-700', 'productId', 'hiddenClass');
                productItemId.value = image.id;

                //Quantity added to the cart
                const quantityLabel = document.createElement('label');
                quantityLabel.textContent = 'Quantity :';
                quantityLabel.classList.add('text-sm', 'text-gray-700', 'mr-2');
                quantityLabel.style.marginRight = '5.5rem';

                const addedQuantity = document.createElement('input');
                addedQuantity.classList.add('mtd-4', 'text-sm', 'text-gray-700', 'productId');
                addedQuantity.id = 'quantityNo';
                addedQuantity.type = 'number';
                addedQuantity.style.textAlign = 'right';
                addedQuantity.value = 1;

                const price = document.createElement('p');
                price.classList.add('mt-1', 'text-lg', 'font-medium', 'text-gray-900', 'itemPrice');
                price.textContent = '₹ ' + image.productPrice; // You may adjust this based on your data model
                price.style.fontSize = '1rem';
                //Buttons

                // Buttons Container
                const buttonsContainer = document.createElement('div');
                buttonsContainer.classList.add('flex', 'space-x-4', 'absolute', 'bottom-2', 'left-2');

                // Button for Add to Cart
                const addToCartButton = document.createElement('button');
                addToCartButton.classList.add('Btns', 'px-4', 'py-2', 'bg-blue-500', 'text-white', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline-blue', 'active:bg-blue-800');
                addToCartButton.style.backgroundColor = '#692098';

                addToCartButton.style.fontSize = "small";
                // Create an <i> element with the Font Awesome class
                const plusIcon = document.createElement('i');
                plusIcon.classList.add('fa', 'fa-plus');
                plusIcon.ariaHidden = 'true';
                // Append the <i> element to the button
                addToCartButton.appendChild(plusIcon);

                // Set additional styles
                addToCartButton.style.fontSize = 'small';
                addToCartButton.addEventListener('click', () => {
                    // Implement your Add to Cart logic here
                    console.log('Add to Cart clicked for ' + image.productName);
                    const quantityInput = imageCard.querySelector('.productQuantity');

                    var boughtQuantity = parseInt(imageCard.querySelector('#quantityNo').value, 10);
                    var remainingQuantity = parseInt(quantityInput.value, 10);

                    if (remainingQuantity <= 0) {
                        alert("item sold out");
                        return null;
                    }

                    if (remainingQuantity - boughtQuantity < 0) {
                        alert("Decrease your quantity");
                        return null;
                    }

                    if (quantityInput != 0) {
                        const currentQuantity = parseInt(quantityInput.value, 10);
                        if (!isNaN(currentQuantity) && currentQuantity > 0) {
                            quantityInput.value = currentQuantity - boughtQuantity
                            console.log(quantityInput.value);

                        }


                    }

                    var cartItem = {
                        itemname: image.productName,
                        itemId: parseInt(image.id, 10),
                        buyerId: parseInt(document.getElementById("userId").value, 10),
                        sellerId: parseInt(image.sellerId, 10),
                        quantity: parseInt(imageCard.querySelector('#quantityNo').value, 10),
                        totalCalculatedPrice: image.productPrice * imageCard.querySelector('#quantityNo').value,
                        imageSrc: image.fileContent
                    }
                    console.log(cartItem);


                    $.ajax({
                        url: "/addToMyCart",
                        type: "POST",
                        data: JSON.stringify(cartItem),
                        contentType: "application/json",
                        success: function (jsonResp) {
                            alert(jsonResp);
                        },
                        error: function () {
                            console.log("Error");
                        }

                    })

                });

                // Button for Buy
                const buyButton = document.createElement('button');
                buyButton.classList.add('Btns', 'buyBtns', 'px-4', 'py-2', 'bg-green-500', 'text-white', 'hover:bg-green-700', 'focus:outline-none', 'focus:shadow-outline-green', 'active:bg-green-800');
                buyButton.style.fontSize = "small";
                 buyButton.style.backgroundColor = "#ea46a4";

                  // Create an <i> element with the Font Awesome class
                                const wishIcon = document.createElement('i');
                                wishIcon.classList.add('fa', 'fa-heart');
                                wishIcon.ariaHidden = 'true';
                                // Append the <i> element to the button
                                buyButton.appendChild(wishIcon);


                buyButton.addEventListener('click', () => {
                    // Implement your Buy logic here
                    console.log('Buy clicked for ' + image.productName);

                    var productName = imageCard.querySelector('.itemName').textContent;
                    // var soldItemNum = imageCard.querySelector('.itemBought');
                    var soldItemNum = 1;
                    var sellPrice = image.productPrice;
                    var buyerId = document.getElementById("userId").value;
                    var sellerId = image.sellerId;
                    var itemId = image.id;

                    console.log(productName);
                    console.log(soldItemNum);
                    console.log(sellPrice);
                    console.log(buyerId);
                    console.log(sellerId);
                    console.log(itemId);

                    var orderItem = {
                        productId: itemId,
                        productName: productName,
                        productQuantity: soldItemNum,
                        totalPrice: sellPrice,
                        buyerId: buyerId,
                        sellerId: sellerId,

                    }

                    $.ajax({
                        url: "/order",
                        type: "POST",
                        data: JSON.stringify(orderItem),
                        contentType: "application/json",
                        dataType: "json",
                        success: function (jsonResp) {
                            alert(jsonResp);
                        },
                        error: function () {
                            console.log("Error");
                        }

                    })

                });

                // Append elements to the image card
                aspectRatioDiv.appendChild(img);
                imageCard.appendChild(aspectRatioDiv);
                imageCard.appendChild(title);
                imageCard.appendChild(price);
                imageCard.appendChild(quantityLabel);
                imageCard.appendChild(addedQuantity);
                imageCard.appendChild(quantity);
                imageCard.appendChild(addToCartButton);
                imageCard.appendChild(buyButton);
                imageCard.appendChild(buttonsContainer);
                imageCard.appendChild(sellerId);
                imageCard.appendChild(productItemId);

                // Append the image card to the imageSection
                imageSection.appendChild(imageCard);

            });

        }

        // Fetch images when the page loads
        document.addEventListener('DOMContentLoaded', fetchImages);

        //cart
        const checkoutBtn = document.getElementById('checkoutBtn');
        const checkoutModal = document.getElementById('checkoutModal');
        const closeModal = document.getElementById('closeModal');

        checkoutBtn.addEventListener('click', () => {
            var userId = document.getElementById("userId").value;
            location.href = "/cartPage/" + userId;
        });

        closeModal.addEventListener('click', () => {
            checkoutModal.classList.add('hidden');
        });

        document.getElementById('searchInput').addEventListener('input', function () {
            filterImages(this.value.toLowerCase());

        });

        function filterImages(searchTerm) {
            const imageItems = document.querySelectorAll('.group');

            imageItems.forEach(function (item) {
                const itemNameNode = item.childNodes[1];

                // Access and log the text content of the itemNameNode
                console.log(itemNameNode.textContent.trim());
                const imageName = itemNameNode.textContent.trim().toLowerCase();
                const display = imageName.includes(searchTerm) ? 'block' : 'none';
                item.style.display = display;
            });
        }
    </script>

    </html>