import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';

class Injector extends InheritedWidget {
  final JeweleryKartApi apiHelper = new JeweleryKartApi();

  Injector({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  static Injector of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Injector);

  @override
  bool updateShouldNotify(Injector oldWidget) => false;

  JeweleryKartApi getApiHelper() {
    return apiHelper;
  }
}
