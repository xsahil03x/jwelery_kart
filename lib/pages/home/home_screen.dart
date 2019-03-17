import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/jwelery_kart_bloc.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/pages/fragments/men/men_screen.dart';
import 'package:jwelery_kart/pages/fragments/women/women_screen.dart';
import 'package:jwelery_kart/pages/home/cart_item_counter.dart';
import 'package:jwelery_kart/pages/home/search_widget_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<JeweleryKartBloc>(
      builder: (_, bloc) => bloc ?? JeweleryKartBloc(),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<JeweleryKartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Jewelery Kart"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showSearch(context: context, delegate: JewelerySearch(bloc));
              }),
          CartItemCounter(),
        ],
        bottom: makeTabBar(),
      ),
      drawer: makeDrawer(),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          WomenScreen(),
          MenScreen(),
        ],
      ),
    );
  }

  Widget makeDrawer() => Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Image.asset('assets/images/ic_food.png'),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 247, 250),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () {
                  _tabController.animateTo(0);
                  Navigator.of(context).pop();
                },
                title: Text("Women"),
                leading: Icon(Icons.shop),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () {
                  _tabController.animateTo(1);
                  Navigator.of(context).pop();
                },
                title: Text("Men"),
                leading: Icon(Icons.shop),
              ),
            ),
            Divider(),
            InkWell(
              child: ListTile(
                onTap: () {
                  Application.router.navigateTo(
                    context,
                    Routes.myOrders,
                  );
                },
                title: Text("My Orders"),
                leading: Icon(Icons.card_travel),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Application.router.navigateTo(
                    context,
                    Routes.cartList,
                  );
                },
                title: Text("My Cart"),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
//            InkWell(
//              child: ListTile(
//                onTap: () {},
//                title: Text("My Account"),
//                leading: Icon(Icons.account_circle),
//              ),
//            ),
            Divider(),
            InkWell(
              child: ListTile(
                onTap: () {},
                title: Text("Contact Us"),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () {},
                title: Text("Terms & Conditions"),
              ),
            ),
          ],
        ),
      );

  Widget makeTabBar() => TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            child: Text(
              "Women",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Men",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      );
}
