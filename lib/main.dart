import 'package:admin_backend/api/login_api.dart';
import 'package:admin_backend/protobuf/generated/adminUser.pb.dart';
import 'package:admin_backend/util/events.dart';
import 'package:lifecycle/lifecycle.dart';

import '../model/session.dart';
import '../util/prefs_helper.dart';
import '../widget/left_menu_widget.dart';
import 'login/login_page.dart';
import '../widget/side_menu.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'config.dart';
import 'package:desktop_window/desktop_window.dart';

import 'constant.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.loadConfig();
  if (!kIsWeb) {
    await Constant.initDiertory();
  }
  if (!kIsWeb) {
    await DesktopWindow.setWindowSize(const Size(1280, 720));
  }
  await PrefsHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin cosole',
      navigatorObservers: [defaultLifecycleObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Admin console'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedMenuName;
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    // _selectedMenuName = html.window.location.pathname;
    eventCenter.addListener('userInfoChanged', (type, data) {
      setState(() {});
    });
    _getUserInfo();
  }

  Future _getUserInfo() async {
    AdminUserInfoResp resp = await LoginApi.getAdminUserInfo(uid: Session.uid);
    if(resp.code==1) {
      Session.userInfo = resp.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    Constant.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: Session.uid > 0
            ? [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: IconButton(
                      onPressed: () {
                        Session.logOut();
                      },
                      icon: const Icon(Icons.exit_to_app)),
                )
              ]
            : [],
      ),
      body:
          _buildBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    if (Session.uid == 0) {
      return const LoginPage();
    }
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buidMenu(),
        Container(
          color: Colors.blue,
          width: 5,
        ),
        _buildContent(_selectedMenuName ?? ''),
        //     Expanded(
        //         child: Navigator(
        //           observers: [defaultLifecycleObserver],
        //           key: _navKey,
        //       initialRoute: '/',
        //
        //       onGenerateRoute: (settings) {
        //         return MaterialPageRoute(
        //           settings: const RouteSettings(name: '/'),
        //           builder: (context) {
        //             return const SizedBox.shrink();
        //           },
        //         );
        //       },
        //     )),
      ],
    );
  }

  Widget _buidMenu() {
    return NotificationListener(
        onNotification: (MyNotification notification) {
          _selectedMenuName = notification.message;

          setState(() {});

          return true;
        },
        child: const SizedBox(
          width: 150,
          child: LeftMenuWidget(),
        ));
  }

  Widget _buildContent(String pageRoute) {
    Widget? page = Routers.getPageForRouteName(pageRoute);
    page ??= const SizedBox.shrink();
    return page!;
  }
}
