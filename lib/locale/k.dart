
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'en.dart';
import 'zh-CN.dart';
class K
{
   static String getTranslation(String key,{ List<dynamic>? args  }){
     Locale systemLocale = ui.window.locale;
     late String res;
     if(systemLocale.languageCode=='zh'){

        res = ZhCn.m[key]??'';
     }else {
       res = En.m[key]??'';
       if(res.isNotEmpty) {
         res = res.replaceFirst(res[0], res[0].toUpperCase());
       }
     }
    if(args!=null){
      args.forEachIndexed((index, element) {
        res = res.replaceAll('%${index+1}', element.toString());
      });
    }
    return res;
  }
}