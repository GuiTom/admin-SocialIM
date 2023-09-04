import 'package:admin_backend/model/menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SideMenu extends StatefulWidget {
  SideMenu(
      {super.key,
      required this.menuModel,
      required this.level,
      this.selectedMenuName});

  final MenuModel menuModel;
  final int level;
  String? selectedMenuName;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SideMenu> with SingleTickerProviderStateMixin {
  late MenuModel _menuModel;
  late int _level;

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _mouseHovering = false;
  String? _selectedMenuName;

  @override
  void initState() {
    super.initState();
    _selectedMenuName = widget.selectedMenuName;
    _level = widget.level;
    _menuModel = widget.menuModel;
    // 创建 AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // 动画持续时间为2秒
      vsync: this, // 传递 SingleTickerProviderStateMixin
    );

    // 创建 Tween，用于定义动画的值范围
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant SideMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedMenuName != widget.selectedMenuName) {
      _selectedMenuName = widget.selectedMenuName;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SizedBox(
              height: (_menuModel.subMenus.length + 1) * 50 * _animation.value,
            ),
            InkWell(
              onTap: () {

                if (_animation.value == 0.0) {

                  _controller.forward();
                } else if (_animation.value == 1.0) {

                  _controller.reverse();
                }
                MyNotification(_menuModel.pageRoute).dispatch(context);

              },
              child: MouseRegion(
                onHover: (_) {
                  _mouseHovering = true;
                  setState(() {});
                },
                onExit: (_) {
                  _mouseHovering = false;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 150,
                  color: _selectedMenuName==_menuModel.pageRoute?const Color(0xFFA1A1A1):(_mouseHovering
                      ? const Color(0xFFF1F1F1)
                      : Colors.white),
                  child: Row(
                    children: [
                      if (_level > 1)
                        SizedBox(
                          width: 10 * (_level - 1),
                        ),
                      if (_menuModel.icon.isNotEmpty)
                        Image.asset(
                          'assets/${_menuModel.icon}',
                          width: 24,
                          height: 24,
                        ),
                      if (_menuModel.icon.isEmpty)
                        const SizedBox(
                          width: 24,
                        ),
                      Text(_menuModel.name),
                      const Spacer(),
                      if (_menuModel.subMenus.isNotEmpty)
                        Transform.rotate(
                          angle: _animation.value == 0.0
                              ? 0
                              : 1.57 * _animation.value,
                          child: const Icon(Icons.arrow_right_outlined),
                        ),
                      if (_menuModel.subMenus.isEmpty)
                        const SizedBox(
                          width: 19,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ..._menuModel.subMenus
                .mapIndexed((index, e) => PositionedDirectional(
                      top: (1 + index) * 50 * _animation.value,
                      child: SideMenu(
                        menuModel: e,
                        level: _level + 1,
                        selectedMenuName: _selectedMenuName,
                      ),
                    ))
                .toList()
          ].reversed.toList(),
        );
      },
    );
  }
}
class MyNotification extends Notification {
  final String message;

  MyNotification(this.message);
}
