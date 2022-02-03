import 'package:flutter/material.dart';
import 'package:qurany_karim/view/ahadith_view/ahadith_view.dart';
import 'package:qurany_karim/view/askar_view/azkar_view.dart';
import 'package:qurany_karim/view/assmaa_allah_view/assmaa_allah_view.dart';
import 'package:qurany_karim/view/home_view/home_view.dart';
import 'package:qurany_karim/view/listening_view/listening_view.dart';
import 'package:qurany_karim/view/qiplah_view/qiplah_view.dart';
import 'package:qurany_karim/view/reading_view/reading_view.dart';
import 'package:qurany_karim/view/single_views/welcome_view.dart';
import 'package:qurany_karim/view/tasbih_view/tasbih_view.dart';

class Routes{
  static Map<String, WidgetBuilder> routes = {
    WelcomeView.id: (_) => WelcomeView(),
    HomeView.id: (_) => HomeView(),
    ReadingView.id: (_) => ReadingView(),
    TasbihView.id: (_) => TasbihView(),
    ListeningView.id: (_) => ListeningView(),
    AzkarView.id: (_) => AzkarView(),
    AhadithView.id: (_) => AhadithView(),
    AssmaaAllahView.id: (_) => AssmaaAllahView(),
    QiplahView.id: (_) => QiplahView(),
    // ReadingView.id: (_) => ReadingView(),
    // ReadingView.id: (_) => ReadingView(),
    // ReadingView.id: (_) => ReadingView(),
  };
}