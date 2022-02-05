import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../app_components.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  static const String id = 'HomeView';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState()async{
    super.initState();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    final myCoordinates = Coordinates(30.957781, 31.24275); // Replace with your own location lat, lng.
    print('${position.latitude} lat');
    print('${position.longitude} long');
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    // print(position.altitude);
    print("---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
    print(DateFormat.jm().format(prayerTimes.fajr));
    print(DateFormat.jm().format(prayerTimes.sunrise));
    print(DateFormat.jm().format(prayerTimes.dhuhr));
    print(DateFormat.jm().format(prayerTimes.asr));
    print(DateFormat.jm().format(prayerTimes.maghrib));
    print(DateFormat.jm().format(prayerTimes.isha));

  }

  @override
  Widget build(BuildContext context) {

    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'qurany_karim'.tr(),
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'ReemKufi',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            minimumVerticalSpace(),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isPortrait
                  ? portraitGridWidgets(context).length
                  : landScapeGridWidgets(context).length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                childAspectRatio: isPortrait ? 0.85 : 1.2,
              ),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: isPortrait
                      ? portraitGridWidgets(context,
                          isPortrait: isPortrait)[index]
                      : landScapeGridWidgets(context,
                          isPortrait: isPortrait)[index],
                );
              },
            ),
            ListView.separated(
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isPortrait
                  ? portraitListWidgets(context).length
                  : landScapeListWidgets(context).length,
              itemBuilder: (_, index) {
                return isPortrait
                    ? portraitListWidgets(context,
                        isPortrait: isPortrait)[index]
                    : landScapeListWidgets(context,
                        isPortrait: isPortrait)[index];
              },
              separatorBuilder: (_, index) => minimumVerticalSpace(),
            )
          ],
        ),
      ),
    );
  }
}
