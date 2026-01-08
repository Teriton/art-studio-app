import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/widgets/signup/contacts_enter.dart';
import 'package:art_studio_app/widgets/signup/name_enter.dart';
import 'package:art_studio_app/widgets/page_indicator.dart';
import 'package:art_studio_app/widgets/signup/password_enter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  String? _fitstName;
  String? _lastName;
  String? _login;
  String? _email;
  String? _phoneNumber;
  String? _psw;
  bool _isLoading = false;
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

  void _signUpUser(UserAdd user) async {
    setState(() {
      _isLoading = true;
    });
    final repo = await ref.read(workshopRepositoryProvider.future);
    final resultSignUp = await repo.signUp(user);
    if (resultSignUp == true) {
      final resultLogin = await repo.login(
        username: user.login,
        password: user.psw,
      );
      if (mounted && resultLogin) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => GeneralScreen()),
          (Route<dynamic> route) => false,
        );
      }
      return;
    }
    if (mounted) {
      Navigator.of(context).pop();
    }
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
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageViewController,
                    onPageChanged: _handlePageViewChanged,
                    children: [
                      NameEnter(
                        onBackButtonClick: () {
                          Navigator.of(context).pop();
                        },
                        onNextButtonClick:
                            ({
                              required enteredLastName,
                              required enteredLogin,
                              required enteredName,
                            }) {
                              _fitstName = enteredName;
                              _lastName = enteredLastName;
                              _login = enteredLogin;
                              _updateCurrentPageIndex(1);
                            },
                      ),
                      ContactsEnter(
                        onBackButtonClick: () {
                          _updateCurrentPageIndex(0);
                        },
                        onNextButtonClick:
                            ({required enteredEmail, required enteredPhone}) {
                              _email = enteredEmail;
                              _phoneNumber = enteredPhone;
                              _updateCurrentPageIndex(2);
                            },
                      ),
                      PasswordEnter(
                        onSignUpButtonClick: ({required psw}) {
                          _psw = psw;
                          UserAdd newUser;
                          if (_fitstName != null ||
                              _lastName != null ||
                              _email != null ||
                              _phoneNumber != null ||
                              _login != null ||
                              _psw != null) {
                            newUser = UserAdd(
                              firstName: _fitstName!,
                              lastName: _lastName!,
                              email: _email!,
                              phoneNumber: _phoneNumber!,
                              login: _login!,
                              psw: _psw!,
                              admin: false,
                            );
                            _signUpUser(newUser);
                          }
                        },
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
