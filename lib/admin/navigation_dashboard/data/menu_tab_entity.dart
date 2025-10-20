import 'package:flutter/cupertino.dart';

class MenuTabEntity {
  int index;
  String title;
  IconData icon;
  Widget page;

  @override
  String toString() {
    return 'MenuTabEntity{index: $index, title: $title, icon: $icon, page: $page}';
  }

  MenuTabEntity({
    required this.index,
    required this.title,
    required this.icon,
    required this.page,
  });

}