import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:expense_tracker/screens/add_expense/blocs/get_categoriesbloc/get_categories_bloc.dart';
import 'package:expense_tracker/screens/add_expense/views/add_expense.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home,
                    color: index == 0 ? selectedItem : unselectedItem),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.graph_square,
                    color: index == 1 ? selectedItem : unselectedItem),
                label: 'Stats')
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                CreateCategoryBloc(FirebaseExpenseRepo()),
                          ),
                          BlocProvider(
                            create: (context) =>
                                GetCategoriesBloc(FirebaseExpenseRepo())
                                  ..add(GetCategories()),
                          ),
                        ],
                        child: const AddExpense(),
                      )));
        },
        shape: const CircleBorder(),
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ], transform: const GradientRotation(pi / 4))),
            child: const Icon(CupertinoIcons.add)),
      ),
      body: index == 0 ? const MainScreen() : StatScreen(),
    );
  }
}
