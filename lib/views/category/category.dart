import 'package:flutter/material.dart';
import '../../utilities/category_constants.dart';
import '../../widgets/category_widget.dart';

class Category extends StatelessWidget {
  final String mainCategoryKey;
  const Category({Key? key, required this.mainCategoryKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCategoryName = categoryMap[mainCategoryKey]!;
    final maxSize = MediaQuery.of(context).size;
    final subList = subCategoryMap[mainCategoryKey]!;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: maxSize.height * 0.8,
            width: maxSize.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryHeader(mainCategoryName: mainCategoryName),
                SizedBox(
                  height: maxSize.height * 0.7,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2/3,
                    children: List.generate(subList.length, (index) {
                      return SubCategoryItem(
                        subCategoryName: subList[index],
                        imageUrl: 'assets/images/$mainCategoryKey/$mainCategoryKey$index.jpg',
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: VerticalSlideBar(
            maxSize: maxSize,
            mainCategoryName: mainCategoryName,
          ),
        ),
      ],
    );
  }
}

