import 'package:flutter/material.dart';
import 'package:multi_vendor/utilities/category_constants.dart';
import 'package:multi_vendor/views/category/category.dart';
import 'package:multi_vendor/widgets/custom_search.dart';

class ItemCategory {
  String name;
  bool isSelected;
  ItemCategory({required this.name, this.isSelected = false});
}

List<ItemCategory> items = categoryList.map((value) => ItemCategory(name: value)).toList();

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _pageController = PageController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    items[0].isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    final sizeMax = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const CustomSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(
              sizeMax,
              scrollController,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categView(sizeMax),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size sizeMax, ScrollController scrollController) {
    return Container(
      height: 0.8 * sizeMax.height,
      width: 0.2 * sizeMax.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _autoScrollNavbar(index, sizeMax);
              });
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceInOut);
            },
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: items[index].isSelected
                      ? Colors.white
                      : Colors.grey.shade300,
                  child: Center(
                    child: Text(
                      categoryMap[items[index].name]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size sizeMax) {
    return Container(
      height: 0.8 * sizeMax.height,
      width: 0.8 * sizeMax.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          for (var item in items) {
            item.isSelected = false;
          }
          setState(() {
            items[index].isSelected = true;
            _autoScrollNavbar(index, sizeMax);
          });
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Category(mainCategoryKey: items[index].name,);
        },
      ),
    );
  }

  _autoScrollNavbar(int index, Size sizeMax) {
    var tmp = 100 * index.toDouble() - 0.6 * sizeMax.height / 2;
    var position = tmp > 0 ? tmp : 0.0;
    scrollController.animateTo(position,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut);
  }
}
