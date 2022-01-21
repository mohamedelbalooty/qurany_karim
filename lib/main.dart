import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:qurany_karim/ui_provider/change_font_size.dart';
import 'package:qurany_karim/utils/constants/colors.dart';
import 'utils/helper/dio_helper.dart';
import 'view/home_view/home_view.dart';
import 'view/reading_view/reading_view.dart';
import 'view/single_views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
  );
  DioHelper.init();
  runApp(
    LocalizedApp(
      child: QuranyKarim(),
    ),
  );
}

class QuranyKarim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeFontSizeProvider>(create: (_) => ChangeFontSizeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeView.id,
        routes: {
          WelcomeView.id: (_) => WelcomeView(),
          HomeView.id: (_) => HomeView(),
          ReadingView.id: (_) => ReadingView(),
          // SurahView.id: (_) => SurahView(),
          // ReadingView.id: (_) => ReadingView(),
          // ReadingView.id: (_) => ReadingView(),
          // ReadingView.id: (_) => ReadingView(),
        },
        localizationsDelegates: translator.delegates,
        locale: translator.activeLocale,
        supportedLocales: translator.locals(),
        theme: ThemeData(
          primaryColor: mainColor,
          fontFamily: 'Tajawal',
          scaffoldBackgroundColor: Colors.grey.shade50,
          appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(
              color: whiteColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          textTheme: TextTheme(
            headline1: const TextStyle(
              color: whiteColor,
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
            ),
            ///button
            headline2: const TextStyle(
              color: whiteColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: const TextStyle(
              color: whiteColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText2: const TextStyle(
              color: whiteColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
