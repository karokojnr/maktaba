import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core.dart';
import 'views/views.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<String> _tabTitles = const ['Books', 'Attendants'];

  @override
  void initState() {
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Doe🚀'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5,
          tabs: _tabTitles
              .map((title) => Tab(
                    child: Text(title),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabTitles.map((title) {
            Widget? returnWidget;
            if (_selectedIndex == 0) {
              returnWidget = const BooksView();
            } else {
              returnWidget = const AttendantsView();
            }
            return KeepPageAlive(
              child: returnWidget,
            );
          }).toList()),
    );
  }
}
