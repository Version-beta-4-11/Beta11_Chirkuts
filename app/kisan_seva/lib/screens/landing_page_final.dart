
import 'package:flutter/material.dart';
import 'package:kisan_seva/navigation/home_page.dart';
import 'package:kisan_seva/screens/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kisan_seva/navigation/tts.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    //GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('HOME'),
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFF79C44F),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.cloudSunRain,
                color:Colors.black,
              ),
              title: Text('WEATHER'),
              activeIcon: Icon(
                FontAwesomeIcons.cloudSunRain,
                color: Color(0xFF79C44F),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.headset_mic,
                color:Colors.black,
              ),
              title: Text('AUDIO INSTRUCTIONS'),
              activeIcon: Icon(
                Icons.headset_mic,
                color: Color(0xFF79C44F),
              ),
            ),
            /*BottomNavigationBarItem(
              icon: Icon(
                Icons.live_help,
                color:Colors.black,
                size: 36,
              ),
              title: Text('HELPBOT'),
              activeIcon: Icon(
                Icons.live_help,
                color: Color(0xFF79C44F),
                size: 36,
              ),
            ),*/
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            //_buildOffstageNavigator(3),
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
          WeatherApp(),
          tts(),

         
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders ;
     routeBuilders= _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}