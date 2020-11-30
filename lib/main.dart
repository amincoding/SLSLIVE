import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viplive/models/product.dart';
import 'package:viplive/screens/Provider/modelHUD.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/services/RootPage.dart';
import 'package:viplive/screens/Start.dart';
import 'package:viplive/screens/thankyou_screen.dart';
import 'package:viplive/screens/waiting_screen.dart';
import 'screens/HOMEPAGE/profile_screen_sp.dart';
import 'screens/Start.dart';
import 'screens/signup.dart';
import 'screens/signUpEmail.dart';
import 'screens/signin_email.dart';
import 'screens/HOMEPAGE/home_feeds.dart';
import 'screens/HOMEPAGE/profile_screen.dart';
import 'screens/HOMEPAGE/edit_profile_screen.dart';
import 'screens/HOMEPAGE/shipping_adress_screen.dart';
import 'screens/HOMEPAGE/payment_method.dart';
import 'screens/HOMEPAGE/My_orders.dart';
import 'screens/HOMEPAGE/notification_settings.dart';
import 'screens/HOMEPAGE/My_Orders_Empty.dart';
import 'screens/HOMEPAGE/customer_support.dart';
import 'screens/HOMEPAGE/PayPal_screen.dart';
import 'screens/DASHBOARD/Admin_new_mambers.dart';
import 'screens/DASHBOARD/Admin_new_sellers.dart';
import 'screens/DASHBOARD/Dashboard_Admin.dart';
import 'screens/DASHBOARD/Dashboard_Seller.dart';
import 'screens/DASHBOARD/Seller_All_orders.dart';
import 'screens/DASHBOARD/Seller_Payment_details.dart';
import 'screens/DASHBOARD/Seller_Payout_History.dart';
import 'screens/DASHBOARD/Seller_Request_Payout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/DASHBOARD/Dashboard_Seller_checked.dart';
import 'screens/DASHBOARD/Dashboard_Admin_checked.dart';
import 'screens/HOMEPAGE/messages.dart';
import 'screens/HOMEPAGE/notifications.dart';
import 'screens/Productes/addProduct.dart';
import 'screens/Productes/editProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootPage(auth: Auth()),
        routes: {
          start.id: (context) => start(),
          signup.id: (context) => signup(),
          signUpEmail.id: (context) => signUpEmail(),
          signin_email.id: (context) => signin_email(),
          waiting_screen.id: (context) => waiting_screen(),
          thankyou_screen.id: (context) => thankyou_screen(),
          homeFeeds.id: (context) => homeFeeds(),
          profile_screen.id: (context) => profile_screen(),
          profile_screen_sp.id: (context) => profile_screen_sp(),
          edit_profile_screen.id: (context) => edit_profile_screen(),
          shipping_adress_screen.id: (context) => shipping_adress_screen(),
          payment_method.id: (context) => payment_method(),
          My_orders.id: (context) => My_orders(),
          notification_settings.id: (context) => notification_settings(),
          My_Orders_Empty.id: (context) => My_Orders_Empty(),
          customer_support.id: (context) => customer_support(),
          PayPal_Screen.id: (context) => PayPal_Screen(),
          Admin_new_mambers.id: (context) => Admin_new_mambers(),
          Admin_new_sellers.id: (context) => Admin_new_sellers(),
          Dashboard_Admin.id: (context) => Dashboard_Admin(),
          Dashboard_Admin_checked.id: (context) => Dashboard_Admin_checked(),
          Dashboard_Seller.id: (context) => Dashboard_Seller(),
          Dashboard_Seller_checked.id: (context) => Dashboard_Seller_checked(),
          Seller_All_orders.id: (context) => Seller_All_orders(),
          Seller_Payment_details.id: (context) => Seller_Payment_details(),
          Seller_Payout_History.id: (context) => Seller_Payout_History(),
          Seller_Request_Payout.id: (context) => Seller_Request_Payout(),
          Messages.id: (context) => Messages(),
          notifications.id: (context) => notifications(),
          AddProduct.id: (context) => AddProduct(),
          editProduct.id: (context) => editProduct(),
        },
    );
  }
}
