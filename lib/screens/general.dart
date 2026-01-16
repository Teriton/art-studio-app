import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:art_studio_app/widgets/general/orders_list.dart';
import 'package:art_studio_app/widgets/general/workshop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneralScreen extends ConsumerStatefulWidget {
  const GeneralScreen({super.key, this.initialPageIndex = 0});
  final int initialPageIndex;
  static final textFields = {
    "workshops": "Мастерклассы",
    "profile": "Профиль",
    "orders": "Заказы",
  };

  @override
  ConsumerState<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends ConsumerState<GeneralScreen> {
  int _selectedPageIndex = 0;
  List<WorkshopRel>? _workshops;
  List<OrderRels>? _orders;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.initialPageIndex;
  }

  void _initWorkshops() async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final freshWorkshops = await repo.getWorkshops();
    setState(() {
      _workshops = freshWorkshops;
    });
  }

  void _initOrders() async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final freshOrders = await repo.getOrders();
    setState(() {
      _orders = freshOrders;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text("");
    String activePageTitle = '';
    switch (_selectedPageIndex) {
      case 0:
        if (_workshops == null) {
          content = Center(child: CircularProgressIndicator());
          _initWorkshops();
          break;
        }
        content = RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _workshops = null;
            });
            _initWorkshops();
            return;
          },
          child: WorkshopList(workshops: _workshops!),
        );
        activePageTitle = GeneralScreen.textFields["workshops"]!;
        break;
      case 1:
        if (_orders == null) {
          content = Center(child: CircularProgressIndicator());
          _initOrders();
          break;
        }
        content = RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _orders = null;
            });
            _initOrders();
            return;
          },
          child: OrdersList(orders: _orders!),
        );
        activePageTitle = GeneralScreen.textFields["orders"]!;
        break;
      case 2:
        //content = Center(child: CircularProgressIndicator());
        activePageTitle = GeneralScreen.textFields["profile"]!;
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        actions: [
          if (_selectedPageIndex == 2)
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const WelcomeScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
        ],
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (value) {
          _selectPage(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: GeneralScreen.textFields["workshops"],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: GeneralScreen.textFields["orders"],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: GeneralScreen.textFields["profile"],
          ),
        ],
      ),
    );
  }
}
