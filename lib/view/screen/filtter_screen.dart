// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/filter_controller.dart';
import '../core/colors.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_radio_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectItem = '';
  int? selected;

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  @override
  Widget build(BuildContext context) {
    final FiterController filterController = Get.put(FiterController());
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        elevation: 0,
        title: const Text(
          "Filter Options",
          style: TextStyle(
              color: appBlack, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: appBlack,
        ),
      ),
      body: Obx(() {
        if (filterController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: 10,
                        children: List.generate(
                            filterController.selectedItems.length, (index) {
                          return Chip(
                            label: Text(filterController.selectedItems[index]),
                            avatar: const Icon(Icons.check),
                          );
                        })
                        

                        ),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        color: appWight,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "   Sort by",
                              style: TextStyle(
                                  color: appBlack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: List.generate(
                                  filterController.allDriversList[6].taxonomies!
                                      .length, (index) {
                                return CustomRadioButton(
                                    title: filterController.allDriversList[6]
                                        .taxonomies![index].name!,
                                    onChanged: (value) {
                                      setState(() {
                                        selectItem = value!;
                                      });
                                    },
                                    groupValue: selectItem,
                                    value: filterController.allDriversList[6]
                                        .taxonomies![index].name!);
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = filterController
                              .allDriversList[index].taxonomies!;
                          final title = filterController
                                      .allDriversList[index].name ==
                                  'Sort by'
                              ? filterController.allDriversList[7].name!
                              : filterController.allDriversList[index].name!;
                          return Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ExpansionTile(
                              iconColor: appGrey,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  // ignore: unrelated_type_equality_checks
                                  title,
                                  style: const TextStyle(
                                      color: appBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              children: item
                                  .map((item) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 8),
                                        child: CustomCheckboxWidget(
                                            onChange: (value) {
                                              filterController.selectedItems
                                                      .contains(item.name)
                                                  ? filterController
                                                      .selectedItems
                                                      .remove(item.name)
                                                  : filterController
                                                      .selectedItems
                                                      .add(item.name!);
                                            },
                                            isChecked: filterController
                                                .selectedItems
                                                .contains(item.name),
                                            title: item.name!),
                                      ))
                                  .toList(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: filterController.allDriversList.length - 1),
                  ],
                ),
              ),
              Positioned(
                bottom: 130,
                left: 75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50),
                        shape: const StadiumBorder(),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 72, 72, 72)),
                    onPressed: () {},
                    child: const Text('SHOW 0 RESULT')),
              )
            ],
          ),
        );
      }),
    );
  }
}
