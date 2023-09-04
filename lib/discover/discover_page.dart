import '../config.dart';
import '../model/menu_model.dart';

import 'package:flutter/cupertino.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DiscoverPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('发现管理'),);
  }
}
