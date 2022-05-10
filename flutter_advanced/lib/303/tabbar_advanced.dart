import 'package:flutter/material.dart';
import 'package:flutter_advanced/101/column_row_learn.dart';
import 'package:flutter_advanced/101/image_learn.dart';
import 'package:flutter_advanced/303/part/feed_view.dart';

class TabbarAdvanced extends StatefulWidget {
  const TabbarAdvanced({Key? key}) : super(key: key);

  @override
  State<TabbarAdvanced> createState() => _TabbarAdvancedState();
}

class _TabbarAdvancedState extends State<TabbarAdvanced> with TickerProviderStateMixin {

  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          /*
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Page1',),
                Tab(text: 'Page2',),
              ],
            ),

             */
        ),
        body: _tabBarView(),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child: _myTabBar(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigation_rounded),
          onPressed: (){
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
        onTap: (int index) {},
        padding: EdgeInsets.zero,
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}',)).toList()
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(), // blocking swipe left and right
      controller: _tabController,
      children: [
        ColumnRowLearn(),
        FeedView(),
        ImageLaern(),
        ImageLaern(),
      ],
    );
  }
}

enum _MyTabViews{
  home,settings,favorite,profile
}

extension _MyTabViewExtension on _MyTabViews{ // this extension gives power to _MyTabViews

  // The methods written here will be properties of _MyTabViews.(home,settings,profile..)

}
