import 'package:art_studio_app/objects/workshop_api_repository.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/widgets/login.dart';
import 'package:art_studio_app/widgets/page_indicator.dart';
import 'package:art_studio_app/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/bg2.jpg'),
          opacity: 0.8,
          fit: .cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: .light,
          elevation: 0, // убираем тень
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.onPrimary, // Непрозрачный цвет сверху
                  Colors.transparent, // Прозрачный снизу
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              PageIndicator(
                tabController: _tabController,
                currentPageIndex: _currentPageIndex,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: .infinity,
          height: .infinity,
          child: Center(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: [
                WelcomeCard(
                  onNextButton: () {
                    _updateCurrentPageIndex(1);
                  },
                ),
                Login(
                  onBackButtonClick: () {
                    _updateCurrentPageIndex(0);
                  },
                  onLoginButtonClick: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return GeneralScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
