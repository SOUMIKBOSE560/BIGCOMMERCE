<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6.3.1/dist/tippy-bundle.umd.min.js"></script>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
</head>
<style>
body{
background-image: url("https://i0.wp.com/blogrevamp.cashfree.com/wp-content/uploads/2021/09/eComPaymentSys_Thumbnail.png?fit=5834%2C3001&ssl=1");
font-family: sans-serif;
}

#loginDiv{
 margin-top:1rem;
}

#socialDiv{
 text-align : center;
}

#logInBtn{
background-color: #692098;
}

#forgetTxt{
 color: #692098;
}

#loginForm{
 height:28rem;
}
</style>
<body class="flex items-center justify-center h-screen bg-gray-100">

     <div class="flex justify-center items-center w-full h-full">
            <!-- Left Side (Image) -->
            <div class="hidden lg:flex lg:w-1/2">
                <img src="https://adespresso.com/wp-content/uploads/2020/02/ecommerce-advertising-the-complete-guide.jpg" alt="Login Image" class="object-cover w-full h-full">
            </div>

            <!-- Right Side (Login Form) -->
            <div id="loginDiv" class="w-full max-w-xs lg:w-1/2">

        <form id="loginForm" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <h1 class="text-2xl font-bold mb-4 text-center">Login Form</h1>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                    Username
                </label>
                <input type="text" name="username" id="username" autocomplete="username"
                       class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                    Password
                </label>
                <input type="password" name="password" id="password" required
                       class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            </div>
            <div class="flex items-center justify-between">
                <button id="logInBtn" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
                    Sign In
                </button>
                <a id="forgetTxt" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="#">
                    Forgot Password?
                </a>
            </div>
               <div id="socialDiv" class="social-icons mt-4">
                           <!-- Font Awesome icons -->
                           <i class="fab fa-google text-2xl social-icon mx-2" style="color:#EA4335" ></i>
                           <i class="fab fa-facebook text-2xl social-icon mx-2" style="color:#316FF6"></i>
                           <i class="fab fa-twitter text-2xl social-icon mx-2" style="color:#1DA1F2"></i>
                       </div>
        </form>

              </div>
    </div>
    </body>
    <script>
      $("#logInBtn").click(function () {
                  var url = "/login?name=" + document.getElementById("username").value + "&password=" + document.getElementById('password').value;
                  $.ajax({
                      url: url,
                      type: "GET",
                      async:false,
                      success: function (jsonResp) {
                                   console.log(jsonResp);
                                   var input = jsonResp;
                                    var regex = /\d+/;

                                    var matches = input.match(regex);
                                    var numericValues;

                                    if (matches) {

                                        numericValues = matches.map(Number);

                                        console.log("Numeric parts:", numericValues);
                                    } else {
                                        console.log("No numeric part found");
                                    }

                           if(jsonResp.includes("Seller")){

                                    location.href = "/sellerDashBoard/" + numericValues;
                           }

                           else if(jsonResp.includes("Buyer")){

                                    location.href = "/ShoppingSite/" + numericValues;
                           }
                      },
                      error: function (err) {
                          alert("error");
                      }
                  })
              })
    </script>

</html>
