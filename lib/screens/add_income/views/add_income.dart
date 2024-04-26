import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_repository/income_repository.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController incomeController = TextEditingController();
  TextEditingController incomeCategoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late Income income;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Add Income',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
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
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {},
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(FontAwesomeIcons.list),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Category',
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)))),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, int i) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          FontAwesomeIcons.plus,
                          size: 12,
                        ),
                        title: Text('Category'),
                        tileColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              readOnly: true,
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)));
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
                  borderRadius: BorderRadius.circular(12),
                ),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
