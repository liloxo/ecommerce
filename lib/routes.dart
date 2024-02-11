import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/view/screen/address/add.dart';
import 'package:ecommerce/view/screen/address/addressdetails.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/verificationcodesignup.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/details.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:ecommerce/view/widget/orders/ordertracking.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/",                     page: () => const Language(),middlewares: [MyMiddleWare()]),
  GetPage(name: "/login",                page: () => const Login()),
  GetPage(name: "/signup",               page: () => const SignUp()),
  GetPage(name: "/forgetpassword",       page: () => const ForgetPassword()),
  GetPage(name: "/verifycode",           page: () => const VerifyCode()),
  GetPage(name: "/resetpassword",        page: () => const ResetPassword()),
  GetPage(name: "/successresetpassword", page: () => const SuccessResetPassword()),
  GetPage(name: "/successsignup",        page: () => const SuccessSignUp()),
  GetPage(name: "/verifycodesignup",     page: () => const VerifyCodeSignUp()),
  GetPage(name: "/onboarding",           page: () => const OnBoarding()),
  GetPage(name: "/homepage",             page: () => const HomeScreen()),
  GetPage(name: "/items",                page: () => const Items()),
  GetPage(name: "/productdetails",       page: () => const ProductDetails()),
  GetPage(name: "/cart",                 page: () => const Cart()),
  GetPage(name: "/myfavorite",           page: () => const MyFavorite()),
  GetPage(name: "/addressview",          page: () => const AddressView()),
  GetPage(name: "/addressadd",           page: () => const AddressAdd()),
  GetPage(name: "/addressdetails",       page: () => const AddressAddDetails()),
  GetPage(name: "/checkout",             page: () => const Checkout()),
  GetPage(name: "/archive",              page: () => const OrdersArchiveView()),
  GetPage(name: "/details",              page: () => const OrdersDetails()),
  GetPage(name: "/pending",              page: () => const OrdersPending()),
  GetPage(name: "/tracking",             page: () => const OrdersTracking()),

];