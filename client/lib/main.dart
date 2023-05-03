import 'package:childhood_illness_search_engine/core/theme/app_theme.dart';
import 'package:childhood_illness_search_engine/core/theme/style.dart';
import 'package:childhood_illness_search_engine/data/remote/network/network_api_service.dart';
import 'package:childhood_illness_search_engine/providers/favourite_list_provider.dart';
import 'package:childhood_illness_search_engine/repository/illness_list_repository.dart';
import 'package:childhood_illness_search_engine/screens/favourites/favourites_screen.dart';
import 'package:childhood_illness_search_engine/screens/home/home.dart';
import 'package:childhood_illness_search_engine/services/illness_list_service.dart';
import 'package:childhood_illness_search_engine/shared/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Main());

const List<Widget> pages = <Widget>[Home(), FavouritesScreen()];

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavouriteListProvider()),

        // Dependency Injection
        Provider<NetworkApiService>(
          create: (context) => NetworkApiService(),
        ),
        ProxyProvider<NetworkApiService, IllnessListRepository>(
          update: (_, apiService, __) {
            return IllnessListRepository(apiService);
          },
        ),
        ProxyProvider<IllnessListRepository, IllnessListService>(
          update: (_, repository, __) {
            return IllnessListService(repository);
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        title: 'Material App',
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: PrimaryColor.lightBlue,
          body: SafeArea(child: pages.elementAt(_selectedIndex)),
          bottomNavigationBar: BottomNavBarWidget(
            selectedIndex: _selectedIndex,
            callback: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
