import '../config.dart';
import '../model/menu_model.dart';
import 'side_menu.dart';
import 'package:flutter/cupertino.dart';

class LeftMenuWidget extends StatefulWidget {
  const LeftMenuWidget({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LeftMenuWidget> {
  String? _selectedMenuName;
  late List<MenuModel> _menuModels;

  @override
  void initState() {
    super.initState();
    _menuModels = Config.getMenuData();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (MyNotification notification) {
        _selectedMenuName = notification.message;
        setState(() {});
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _menuModels
            .map((e) => SideMenu(
                  menuModel: e,
                  level: 1,
                  selectedMenuName: _selectedMenuName,
                ))
            .toList(),
      ),
    );
  }
}
