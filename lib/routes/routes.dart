import 'package:get/get.dart';
import 'package:todo/component/calendar.dart';
import 'package:todo/pages/auth/login.dart';
import 'package:todo/pages/auth/onboarding.dart';
import 'package:todo/pages/auth/signup.dart';
import 'package:todo/pages/auth/verified.dart';
import 'package:todo/pages/dashboard/addTask.dart';
import 'package:todo/pages/dashboard/notification.dart';
import 'package:todo/pages/dashboard/trash.dart';
import '../pages/dashboard/home.dart';

class RouterClass {
  static String onboading = "/";
  static String getOnboadingRoute() => onboading;

  static String login = "/login";
  static String getLoginRoute() => login;

  static String signup = "/signup";
  static String getSignupRoute() => signup;

  static String verify = "/verify";
  static String getVerifyRoute() => verify;

  static String home = "/home";
  static String getHomeRoute() => home;

  static String addTask = "/addTask";
  static String getAddTaskRoute() => addTask;

  static String notification = "/notification";
  static String getNotificationRoute() => notification;

  static String calendar = "/calendar";
  static String getCalendarRoute() => calendar;

  static String trash = "/trash";
  static String getTrashRoute() => trash;

  static List<GetPage> routes = [
    GetPage(page: () => const Onboarding(), name: onboading),
    GetPage(page: () => const Login(), name: login),
    GetPage(page: () => const SignUp(), name: signup),
    GetPage(page: () => const Verified(), name: verify),
    GetPage(page: () => const HomePage(), name: home),
    GetPage(page: () => const AddTask(), name: addTask),
    GetPage(page: () => const Notification(), name: notification),
    GetPage(page: () => const CustomeCalendar(), name: calendar),
    GetPage(page: () => const Trash(), name: trash),
  ];
}
