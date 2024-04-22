import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/add_expense/views/category_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../blocs/get_categoriesbloc/get_categories_bloc.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late Expense expense;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yy').format(DateTime.now());
    expense = Expense.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Expenses',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        controller: expenseController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 16,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      readOnly: true,
                      onTap: () {},
                      controller: categoryController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: expense.category == Category.empty
                            ? Colors.white
                            : Color(expense.category.color),
                        prefixIcon: expense.category == Category.empty
                            ? const Icon(
                                FontAwesomeIcons.list,
                                size: 16,
                                color: Colors.grey,
                              )
                            : Image.asset(
                                'assets/${expense.category.icon}.png',
                                scale: 2,
                              ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            var newCategory =
                                await getCategoryCreation(context);
                            setState(() {
                              state.categories.insert(0, newCategory);
                            });
                          },
                          icon: const Icon(
                            FontAwesomeIcons.plus,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Category',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12))),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(12))),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemBuilder: (context, int i) {
                              return Card(
                                  child: ListTile(
                                onTap: () {
                                  setState(() {
                                    expense.category = state.categories[i];
                                    categoryController.text =
                                        expense.category.name;
                                  });
                                },
                                leading: Image.asset(
                                    'assets/${state.categories[i].icon}.png',
                                    scale: 2),
                                title: Text(state.categories[i].name),
                                tileColor: Color(state.categories[i].color),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ));
                            },
                            itemCount: state.categories.length,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: dateController,
                      textAlignVertical: TextAlignVertical.center,
                      readOnly: true,
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: expense.date,
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));

                        if (newDate != null) {
                          setState(() {
                            dateController.text =
                                DateFormat('dd/MM/yyyy').format(newDate);
                            expense.date = newDate;
                          });
                        }
                        ;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.clock,
                          size: 16,
                          color: Colors.grey,
                        ),
                        hintText: 'Date',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: kToolbarHeight,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: const Text(
                              'Save',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            )))
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
