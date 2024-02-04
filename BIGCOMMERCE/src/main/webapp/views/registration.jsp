<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6.3.1/dist/tippy-bundle.umd.min.js"></script>
</head>
<style>
body{
background-image: url("https://blogassets.leverageedu.com/blog/wp-content/uploads/2020/05/14190804/e-commerce-.jpg");
font-family : sans-serif;
}

#submit{
 background-color:#692098
}

#loginLink{
  color : #692098;a
}

#submit:hover{
 background-color:#a336eb;
}

#alreadyDiv{
color:#692098;
}
</style>

<body class="bg-gray-100">

        <div class="container mx-auto px-4 py-24 sm:py-32">
                    <div class="mx-auto max-w-xl bg-white p-8 rounded-lg shadow-md">
                        <h2 class="text-3xl font-bold text-gray-900 text-center mb-8">Registration Form</h2>
        <form id="registrationForm" class="mx-auto mt-16 max-w-xl sm:mt-20" >
            <div class="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2">
                <div>
                    <label for="first-name" class="block text-sm font-semibold leading-6 text-gray-900">First name</label>
                    <div class="mt-2.5">
                        <input type="text" name="firstname" required id="firstname" autocomplete="given-name"
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="last-name" class="block text-sm font-semibold leading-6 text-gray-900">Last name</label>
                    <div class="mt-2.5">
                        <input type="text" name="lastname" required id="lastname" autocomplete="family-name"
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="dob" class="block text-sm font-semibold leading-6 text-gray-900">Date of Birth</label>
                    <div class="mt-2.5">
                        <input type="date" name="dob" id="dob" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="email" class="block text-sm font-semibold leading-6 text-gray-900">Email ID</label>
                    <div class="mt-2.5">
                        <input type="email" name="email" id="email" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="mobile" class="block text-sm font-semibold leading-6 text-gray-900">Mobile No</label>
                    <div class="mt-2.5">
                        <input type="tel" name="mobile" id="mobile" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="balance" class="block text-sm font-semibold leading-6 text-gray-900">Balance</label>
                    <div class="mt-2.5">
                        <input type="number" name="balance" id="balance" step="1" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="password" class="block text-sm font-semibold leading-6 text-gray-900">Password</label>
                    <div class="mt-2.5">
                        <input type="password" name="password" id="password" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="address" class="block text-sm font-semibold leading-6 text-gray-900">Address</label>
                    <div class="mt-2.5">
                        <input type="text" name="address" id="address" required
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                 <div>
                                    <label for="pincode" class="block text-sm font-semibold leading-6 text-gray-900">pincode</label>
                                    <div class="mt-2.5">
                                        <input type="text" name="pincode" id="pincode" required
                                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                    </div>
                                </div>
                <div>
                    <label for="user-role" class="block text-sm font-semibold leading-6 text-gray-900">User Role</label>
                    <div class="mt-2.5">
                        <select name="user-role" id="user-role"
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            <option value="buyer">buyer</option>
                            <option value="seller">seller</option>
                        </select>
                    </div>
                </div>
            </div>

        </form>
         <div class="mt-6 text-center">
                      <button type="submit" id="submit" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                          Register
                      </button>
                      <p  class="mt-4 text-sm text-gray-600 alreadyDiv">
                          Already a user? <a href="/loginPage" class="font-medium text-indigo-600 hover:text-indigo-500" id="loginLink">Login</a>
                      </p>
                  </div>
    </div>

</body>
<script>
   $("#submit").click(function () {
               var userObj = {
                   firstname: document.getElementById("firstname").value,
                   lastname: document.getElementById("lastname").value,
                   dob: document.getElementById("dob").value,
                   emailId: document.getElementById("email").value,
                   mobileNo: document.getElementById("mobile").value,
                   balance: document.getElementById("balance").value,
                   password: document.getElementById("password").value,
                   address: document.getElementById("address").value,
                   role: document.getElementById("user-role").value,
                   pincode : document.getElementById("pincode").value
               }

               console.log(userObj.pincode)
               var jsonStr = JSON.stringify(userObj);

               console.log(jsonStr);

                $.ajax({
                               type : "POST",
                               url : "/registration",
                               contentType: 'application/json',
                               data : jsonStr,
                               success : function(result){
                                   alert(result);
                                   location.href='/';
                               },
                               error : function(e){
                                   alert("Error!")
                               }
                           })
           })
</script>

</html>
