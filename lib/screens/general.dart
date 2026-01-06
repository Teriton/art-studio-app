import 'package:art_studio_app/widgets/general/workshop_list.dart';
import 'package:flutter/material.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});
  static final textFields = {
    "workshops": "Мастерклассы",
    "profile": "Профиль",
    "orders": "Заказы",
  };

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int _selectedPageIndex = 0;

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
        content = WorkshopList();
        activePageTitle = GeneralScreen.textFields["workshops"]!;
        break;
      case 1:
        content = WorkshopList();
        activePageTitle = GeneralScreen.textFields["orders"]!;
        break;
      case 2:
        content = WorkshopList();
        activePageTitle = GeneralScreen.textFields["profile"]!;
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
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
