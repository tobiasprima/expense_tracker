import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

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

  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yy').format(DateTime.now());
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Expenses',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            bool isExpanded = false;
                            String iconSelected = '';
                            Color categoryColor = Colors.white;
                            TextEditingController categoryNameController =
                                TextEditingController();
                            TextEditingController categoryIconController =
                                TextEditingController();
                            TextEditingController categoryColorController =
                                TextEditingController();
                            return StatefulBuilder(
                              builder: (ctx, setState) {
                                return AlertDialog(
                                  title: const Text(
                                    'Create a Category',
                                  ),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: categoryNameController,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Name',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none)),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TextFormField(
                                          controller: categoryIconController,
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          readOnly: true,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              suffixIcon: const Icon(
                                                CupertinoIcons.chevron_down,
                                                size: 12,
                                              ),
                                              hintText: 'Icon',
                                              border: OutlineInputBorder(
                                                  borderRadius: isExpanded
                                                      ? const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              12))
                                                      : BorderRadius.circular(
                                                          12),
                                                  borderSide: BorderSide.none)),
                                        ),
                                        isExpanded
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 180,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    bottom: Radius.circular(12),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              mainAxisSpacing:
                                                                  5,
                                                              crossAxisSpacing:
                                                                  5,
                                                              crossAxisCount:
                                                                  3),
                                                      itemCount:
                                                          myCategoriesIcons
                                                              .length,
                                                      itemBuilder:
                                                          (context, int i) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(
                                                              () {
                                                                iconSelected =
                                                                    myCategoriesIcons[
                                                                        i];
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 3,
                                                                    color: iconSelected ==
                                                                            myCategoriesIcons[
                                                                                i]
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/${myCategoriesIcons[i]}.png'))),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              )
                                            : Container(),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TextFormField(
                                          controller: categoryColorController,
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (ctx2) {
                                                  return BlocProvider.value(
                                                    value: context.read<
                                                        CreateCategoryBloc>(),
                                                    child: AlertDialog(
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ColorPicker(
                                                              onColorChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  categoryColor =
                                                                      value;
                                                                });
                                                              },
                                                              pickerColor:
                                                                  Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      ctx2);
                                                                },
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12))),
                                                                child:
                                                                    const Text(
                                                                  'Save',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          readOnly: true,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: categoryColor,
                                              hintText: 'Color',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none)),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: kToolbarHeight,
                                          child: TextButton(
                                            onPressed: () {
                                              Category category =
                                                  Category.empty;
                                              category.categoryId =
                                                  const Uuid().v1();
                                              category.name =
                                                  categoryNameController.text;
                                              category.icon = iconSelected;
                                              category.color =
                                                  categoryColor.toString();
                                              context
                                                  .read<CreateCategoryBloc>()
                                                  .add(
                                                      CreateCategory(category));
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                ),
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
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectedDate = newDate;
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
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
