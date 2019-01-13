import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/jwelery_kart_bloc.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';

class JweleryCartProvider extends InheritedWidget {
  final JweleryKartBloc collectionBloc;

  @override
  updateShouldNotify(InheritedWidget oldwidget) => true;

  static JweleryKartBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(JweleryCartProvider)
              as JweleryCartProvider)
          .collectionBloc;

  JweleryCartProvider({
    Key key,
    JweleryKartBloc collectionBloc,
    Widget child,
  })  : this.collectionBloc =
            collectionBloc ?? JweleryKartBloc(JweleryKartApi()),
        super(child: child, key: key);
}
