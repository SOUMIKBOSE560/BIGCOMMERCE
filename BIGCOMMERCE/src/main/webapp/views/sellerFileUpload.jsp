
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <title>Seller Page</title>
</head>
<style>
#image-preview{
  margin-left : 1rem;
}

#heading{
 text-align:center;
}

 body {

            font-family: sans-serif;
            background-image: url("https://blogassets.leverageedu.com/blog/wp-content/uploads/2020/05/14190804/e-commerce-.jpg");
        }

 #hint{
  color:rgb(105, 32, 152);
  font-weight: 700;
 }

 #uploadBtn{
  background-color:rgb(105, 32, 152);
 }

 #uploadIcon{
  font-size:xx-large;
  color:rgb(105, 32, 152);
 }
</style>
<body class="bg-gray-100">


<div class="container mx-auto p-4">
    <input type="text" id="userId" value="${userID}">
    <div class="bg-white shadow-md rounded-md p-8 max-w-md mx-auto">
        <h2 class="text-2xl font-semibold mb-6" id="heading">Upload Product</h2>

        <!-- Product Form -->
        <form>
            <!-- Product Image Upload -->
            <div class="mb-4">
                <label for="productImage" class="block text-sm font-medium text-gray-600">Product Image</label>
               <div class="mt-1 flex items-center justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md relative"
                        ondragover="handleDragOver(event)"
                        ondrop="handleDrop(event)">
                       <div class="space-y-1 text-center">
                           <!-- Font Awesome file upload icon -->
                           <i class="fas fa-file-upload mx-auto h-12 w-12 text-gray-400" id="uploadIcon"></i>
                           <div class="flex text-sm text-gray-600">
                               <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-blue-500 hover:text-blue-700 focus:outline-none focus:ring focus:border-blue-300">
                                   <span id="hint">Upload a file</span>
                                   <input id="file-upload" name="productImage" type="file" class="sr-only" onchange="previewImage()" accept="image/*">
                               </label>
                               <p class="pl-1">or drag and drop</p>
                           </div>
                           <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
                       </div>
                    <!-- Image Preview -->
                           <div class="flex flex-col items-center mt-4">
                               <img id="image-preview" class="hidden w-full h-40 object-cover" alt="Image Preview">

                           </div>
                </div>
            </div>

            <!-- Other Form Fields... -->

             <!-- Product Name -->
                        <div class="mb-4">
                            <label for="productName" class="block text-sm font-medium text-gray-600">Product Name</label>
                            <input type="text" id="productName" name="productName"
                                   class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                        </div>


                         <!-- Product Price -->
                                    <div class="mb-4">
                                        <label for="productPrice" class="block text-sm font-medium text-gray-600">Product Price</label>
                                        <div class="relative mt-1 rounded-md shadow-sm">

                                            <input type="number" id="productPrice" name="productPrice"
                                                   class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                                        </div>
                                    </div>

                                     <!-- Product Quantity -->
                                                <div class="mb-4">
                                                    <label for="productQuantity" class="block text-sm font-medium text-gray-600">Product Quantity</label>
                                                    <input type="number" id="productQuantity" name="productQuantity"
                                                           class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                                                </div>
        </form>
         <!-- Submit Button -->
                    <div class="mt-6">
                        <button type="submit" id="uploadBtn" onClick="uploadData()"
                                class="bg-blue-500 text-white p-2 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">
                            Upload
                        </button>
                    </div>


    </div>
</div>



<script>
    function previewImage() {
        const input = document.getElementById('file-upload');
        const preview = document.getElementById('image-preview');

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.classList.remove('hidden');
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

     function uploadData() {
         const fileInput = document.getElementById('file-upload');
         const file = fileInput.files[0];

         const formData = new FormData();
         formData.append('file', file);
         formData.append('name', document.getElementById('productName').value);
         formData.append('price', document.getElementById('productPrice').value);
         formData.append('quantity', document.getElementById('productQuantity').value);
         formData.append('sellerId', document.getElementById('userId').value);

         $.ajax({
             url: '/upload',
             type: 'POST',
             data: formData,
             processData: false,
             contentType: false,
             cache: false,
             enctype: 'multipart/form-data',
             success: function (data) {
                 console.log(data);
                 alert("Data Uploaded Successfully");
                // window.location.href = "/";
             },
             error: function (err) {
                 console.log(err);
                 alert("Error in Uploading Data");
             }
         });

         function removePreview() {
                 const input = document.getElementById('file-upload');
                 const preview = document.getElementById('image-preview');
                 const removeButton = document.getElementById('remove-preview');

                 input.value = ''; // Clear the file input
                 preview.src = '';
                 preview.classList.add('hidden');
                 removeButton.classList.add('hidden');
             }
     }

function handleDragOver(event) {
        event.preventDefault();
        event.dataTransfer.dropEffect = 'copy';
    }

    function handleDrop(event) {
        event.preventDefault();

        const input = document.getElementById('file-upload');
        const preview = document.getElementById('image-preview');

        if (event.dataTransfer.files && event.dataTransfer.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.classList.remove('hidden');
            };

            reader.readAsDataURL(event.dataTransfer.files[0]);
            input.files = event.dataTransfer.files;
        }
    }
</script>

</body>
</html>
