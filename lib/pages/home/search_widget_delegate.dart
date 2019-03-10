import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/jwelery_kart_bloc.dart';
import 'package:jwelery_kart/data/models/product_response.dart';
import 'package:jwelery_kart/pages/fragments/item_card.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';

class JewelerySearch extends SearchDelegate<String> {
  final JeweleryKartBloc bloc;

  JewelerySearch(this.bloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Center(
            child: Text('Search for your favourite jewelery'),
          )
        : FutureBuilder(
            future: bloc.searchJewelery(query),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductBrief>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Center(
                    child: Text("Connection Not Found"),
                  );
                case ConnectionState.waiting:
                  return DialogUtils.showCircularProgressBar();
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  }
                  return snapshot.data.isNotEmpty
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          padding: EdgeInsets.only(
                              left: 6.0, right: 6.0, bottom: 4.0, top: 4.0),
                          itemBuilder: (context, index) =>
                              ItemCard(snapshot.data.elementAt(index)),
                          itemCount: snapshot.data.length,
                        )
                      : Center(child: Text("No Items Found"));
              }
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search for your favourite jewelery'),
    );
  }
}
