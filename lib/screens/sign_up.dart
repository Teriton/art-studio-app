import 'package:art_studio_app/widgets/signup/contacts_enter.dart';
import 'package:art_studio_app/widgets/signup/name_enter.dart';
import 'package:art_studio_app/widgets/page_indicator.dart';
import 'package:art_studio_app/widgets/signup/password_enter.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
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
          image: AssetImage('assets/images/bg1.jpg'),
          opacity: 0.8,
          fit: .cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: .light,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Colors.transparent,
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
                NameEnter(
                  onBackButtonClick: () {
                    Navigator.of(context).pop();
                  },
                  onNextButtonClick: () {
                    _updateCurrentPageIndex(1);
                  },
                ),
                ContactsEnter(
                  onBackButtonClick: () {
                    _updateCurrentPageIndex(0);
                  },
                  onNextButtonClick: () {
                    _updateCurrentPageIndex(2);
                  },
                ),
                PasswordEnter(
                  onSignUpButtonClick: () {},
                  onBackButtonClick: () {
                    _updateCurrentPageIndex(1);
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
