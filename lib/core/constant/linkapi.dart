class AppLink {
 
 static const String server             = "https://mohamedrahal.000webhostapp.com/ecommerce";
 static const String test               = "$server/test.php";
 static const String imagestatic        = "$server/upload";

// --------------------Auth-----------------
 static const String signup            = "$server/auth/signup.php";
 static const String verifycodesignup  = "$server/auth/verifycode.php";
 static const String login             = "$server/auth/login.php";
 static const String resend            = "$server/auth/resend.php";
// --------------------ForgetPassword---------
 static const String verifycoderesetpassword  = "$server/forgetpassword/verifycode.php";
 static const String checkemail               = "$server/forgetpassword/checkemail.php";
 static const String resetpassword            = "$server/forgetpassword/resetpassword.php";
 //-------------------Home------------------
 static const String homepage        = "$server/home.php";
 //-------------------Images----------------
 static const String imagestCategories       = "$imagestatic/categories";
 static const String imagestaticItems            = "$imagestatic/items";
 //-------------------Items-----------------
 static const String items        = "$server/items/items.php";
 static const String search        = "$server/items/search.php";
 //-------------------Favorite-----------------
 static const String favoriteAdd        = "$server/favorite/add.php";
 static const String favoriteRemove     = "$server/favorite/remove.php";
 static const String favoriteView       = "$server/favorite/view.php";
 static const String deletefromFavorite = "$server/favorite/deletefromfavorite.php";
 //-------------------Cart-----------------
 static const String cartview = "$server/cart/view.php";
 static const String cartadd = "$server/cart/add.php";
 static const String cartdelete = "$server/cart/delete.php";
 static const String cartgetcountitems = "$server/cart/getcountitems.php";
 // ------------------Address---------------
 static const String addressView = "$server/address/view.php";
 static const String addressAdd = "$server/address/add.php";
 static const String addressEdit = "$server/address/edit.php";
 static const String addressDelete = "$server/address/delete.php";
 //------------------Coupon------------------
 static const String checkcoupon  = "$server/coupon/checkcoupon.php";
 //------------------checkout------------------
 static const String checkout       = "$server/orders/checkout.php";
 static const String pendingorders  = "$server/orders/pending.php";
 static const String ordersarchive        = "$server/orders/archive.php";
 static const String ordersdetails        = "$server/orders/details.php";
 static const String ordersdelete         = "$server/orders/delete.php";
 //------------------notification------------------
 static const String notification      = "$server/notification.php";
 //------------------offers----------------------------------
 static const String offers      = "$server/offers.php";
 //------------------rating----------------------------------
 static const String rating      = "$server/rating.php";

}

