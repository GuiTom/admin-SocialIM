import 'package:admin_backend/discover/discover_page.dart';
import 'package:admin_backend/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';

class Routers {


  static Widget?  getPageForRouteName(String routeName) {
    if (routeName=='/user/Account') {
      return const UserPage();
    } else if (routeName=='/discover/discoverPage') {
      return const DiscoverPage();
    }
    return null;
  }
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static void naviToSubPage(String routeName){
    Route? pageRoute = defaultLifecycleObserver.findRoute(routeName);
    if (pageRoute == null) {
       navKey.currentState?.push(MaterialPageRoute<bool>(
        builder: (context) => getPageForRouteName(routeName)??const SizedBox.shrink(),
        settings: RouteSettings(name: routeName!),
      ));
    } else {
      navKey.currentState?.popUntil((route) =>  route.settings.name == routeName!);
    }
  }
}
