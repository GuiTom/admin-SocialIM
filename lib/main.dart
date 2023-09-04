import 'package:admin_backend/util/events.dart';

import '../model/session.dart';
import '../util/prefs_helper.dart';
import '../widget/left_menu_widget.dart';
import '../widget/login_page.dart';
import '../widget/side_menu.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'config.dart';

// import 'dart:html' as html;
import 'constant.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.loadConfig();
  if (!kIsWeb) {
    await Constant.initDiertory();
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Admin cosole'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
          // if (_selectedMenuName != null) {
          // Routers.naviToSubPage(_selectedMenuName!);

          // }
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
