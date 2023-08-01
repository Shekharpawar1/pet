import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/partner/Dashboard.dart';
import 'package:pet/screens/partner/login.dart';
import 'package:pet/screens/partner/notification.dart';
import 'package:pet/screens/partner/otp.dart';
import 'package:pet/screens/salesman/Dashboard.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/login.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/otp.dart';
import 'package:pet/screens/splash.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/otp.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/wholesaler/Dashboard.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/login.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/otp.dart';

class AppRouter {
  static const String initialRoute = '/';
  static List<GetPage> pages = [
    GetPage(name: '/', page: () => Splash()),
    GetPage(name: '/intro', page: () => MyIntroductionScreen()),
    GetPage(name: '/common', page: () => Common()),
    GetPage(name: '/login-user', page: () => LoginUser()),
    GetPage(name: '/login-wholesaler', page: () => LoginWhole()),
    GetPage(name: '/login-sales', page: () => LoginSales()),
    GetPage(name: '/login-partner', page: () => LoginPartner()),
    GetPage(name: '/otp-user', page: () => OtpUser()),
    GetPage(name: '/otp-wholesaler', page: () => OtpWhole()),
    GetPage(name: '/otp-sales', page: () => OtpSales()),
    GetPage(name: '/otp-partner', page: () => OtpPartner()),
    GetPage(name: '/home-user', page: () => HomeUser()),
    GetPage(name: '/home-wholesaler', page: () => HomeWhole()),
    GetPage(name: '/home-sales', page: () => HomeSales()),
    GetPage(name: '/dashboard-wholesaler', page: () => DashboardWhole()),
    GetPage(name: '/dashboard-sales', page: () => DashboardSales()),
    GetPage(name: '/dashboard-partner', page: () => DashboardPartner()),
    GetPage(name: '/notification-user', page: () => NotificationUser()),
    GetPage(name: '/notification-wholesaler', page: () => NotificationWhole()),
    GetPage(name: '/notification-sales', page: () => NotificationSales()),
    GetPage(name: '/notification-partner', page: () => NotificationPartner()),
    GetPage(name: '/notification-partner', page: () => NotificationPartner()),
  ];
}
