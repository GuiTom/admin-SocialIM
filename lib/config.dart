import 'dart:convert';
import 'dart:core';

import 'package:admin_backend/model/menu_model.dart';
import 'package:flutter/services.dart';

class Config {
    static Map? _data;
    static Map get  data{
      _data ??= {};
      return _data!;
    }
    static Future<void> loadConfig() async {
      final jsonString = await rootBundle.loadString('assets/data/config.json');
       _data = json.decode(jsonString);
    }
    static List<MenuModel> getMenuData(){
      return (_data!['menus'] as List).map((e) => MenuModel.fromMap(e)).toList();
    }


}