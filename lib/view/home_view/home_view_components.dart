import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:qurany_karim/utils/constants/colors.dart';
import 'package:qurany_karim/view/reading_view/reading_view.dart';
import '../app_components.dart';

class BuildHomeCoverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purple.shade400.withOpacity(0.4),
          Colors.indigoAccent.shade400.withOpacity(0.4)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        borderRadius: defaultBorderRadius(),
        border: Border.all(color: whiteColor, width: 1.5),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            offset: Offset(0.5, 0.5),
            spreadRadius: 1.5,
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 5.0, top: 10.0, bottom: 5.0, start: 120.0),
            child: Image.asset(
              'assets/images/cover.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40.0,
              width: 150.0,
              margin: EdgeInsetsDirectional.only(start: 10.0, top: 45.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.purple.shade400.withOpacity(0.8),
                  Colors.indigoAccent.shade400.withOpacity(0.8),
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.5, 0.5),
                    spreadRadius: 1.5,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'home_title'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<BuildGridCategoryItem> portraitGridWidgets(BuildContext context,
    {bool isPortrait}) {
  return [
    BuildGridCategoryItem(
        title: 'read_moshaf'.tr(),
        icon: 'assets/icons/quran.png',
        onClick: () {
          namedNavigator(context, ReadingView.id);
        }),
    BuildGridCategoryItem(
        title: 'listen_moshaf'.tr(),
        icon: 'assets/icons/listen.png',
        onClick: () {}),
    BuildGridCategoryItem(
        title: 'hades'.tr(), icon: 'assets/icons/prays.png', onClick: () {}),
    BuildGridCategoryItem(
        title: 'azkar'.tr(), icon: 'assets/icons/azkar.png', onClick: () {}),
  ];
}

List<BuildGridCategoryItem> landScapeGridWidgets(BuildContext context,
    {bool isPortrait}) {
  return [
    BuildGridCategoryItem(
        title: 'read_moshaf'.tr(),
        icon: 'assets/icons/quran.png',
        onClick: () {
          namedNavigator(context, ReadingView.id);
        }),
    BuildGridCategoryItem(
        title: 'listen_moshaf'.tr(),
        icon: 'assets/icons/listen.png',
        onClick: () {}),
    BuildGridCategoryItem(
        title: 'hades'.tr(), icon: 'assets/icons/prays.png', onClick: () {}),
    BuildGridCategoryItem(
        title: 'azkar'.tr(), icon: 'assets/icons/azkar.png', onClick: () {}),
    BuildGridCategoryItem(
        title: 'tasbeh'.tr(), icon: 'assets/icons/tasbih.png', onClick: () {}),
    BuildGridCategoryItem(
        title: 'kebla'.tr(), icon: 'assets/icons/kaaba.png', onClick: () {}),
  ];
}

List<BuildListCategoryItem> portraitListWidgets(BuildContext context,
    {bool isPortrait}) {
  return [
    BuildListCategoryItem(
        title: 'tasbeh'.tr(), icon: 'assets/icons/tasbih.png', onClick: () {}),
    BuildListCategoryItem(
        title: 'kebla'.tr(), icon: 'assets/icons/kaaba.png', onClick: () {}),
    BuildListCategoryItem(
        title: 'times'.tr(),
        icon: 'assets/icons/time-zone.png',
        onClick: () {}),
    BuildListCategoryItem(
        title: 'live'.tr(), icon: 'assets/icons/live.png', onClick: () {}),
  ];
}

List<BuildListCategoryItem> landScapeListWidgets(BuildContext context,
    {bool isPortrait}) {
  return [
    BuildListCategoryItem(
        title: 'times'.tr(),
        icon: 'assets/icons/time-zone.png',
        onClick: () {}),
    BuildListCategoryItem(
        title: 'live'.tr(), icon: 'assets/icons/live.png', onClick: () {}),
  ];
}

class BuildListCategoryItem extends StatelessWidget {
  final String title, icon;
  final Function onClick;

  const BuildListCategoryItem(
      {@required this.title, @required this.icon, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BuildHomeButton(
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.fill,
            ),
            minimumHorizontalSpace(),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
            Text(
              'go'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontWeight: FontWeight.bold, height: 1.6),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: whiteColor,
              size: 18.0,
            ),
          ],
        ),
      ),
      onClick: onClick,
    );
  }
}

class BuildGridCategoryItem extends StatelessWidget {
  final String title, icon;
  final Function onClick;

  const BuildGridCategoryItem(
      {@required this.title, @required this.icon, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BuildHomeButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              height: 70.0,
              width: 70.0,
              fit: BoxFit.fill,
            ),
            mediumVerticalSpace(),
            Hero(
              tag: title,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'go'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontWeight: FontWeight.bold, height: 1.6),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: whiteColor,
                  size: 18.0,
                ),
              ],
            ),
          ],
        ),
      ),
      onClick: onClick,
    );
  }
}

class BuildHomeButton extends StatelessWidget {
  final double height, width;
  final Widget child;
  final Function onClick;

  const BuildHomeButton(
      {@required this.child,
      @required this.onClick,
      this.height = 100.0,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: defaultGradient(),
          borderRadius: defaultBorderRadius(),
          border: Border.all(color: whiteColor, width: 1.5),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0.5, 0.5),
              spreadRadius: 1.5,
              blurRadius: 4,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
