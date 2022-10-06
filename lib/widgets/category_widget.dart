import 'package:flutter/material.dart';

import '../views/category/sub_category.dart';

class CategoryHeader extends StatelessWidget {
  final String mainCategoryName;
  const CategoryHeader({
    Key? key,
    required this.mainCategoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        mainCategoryName,
        style: const TextStyle(fontSize: 24, letterSpacing: 1.5),
      ),
    );
  }
}

class VerticalSlideBar extends StatelessWidget {
  const VerticalSlideBar({
    Key? key,
    required this.maxSize,
    required this.mainCategoryName,
  }) : super(key: key);

  final String mainCategoryName;
  final Size maxSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.brown.withOpacity(0.4),
      ),
      height: maxSize.height * 0.8,
      width: maxSize.width * 0.05,
      child: RotatedBox(
        quarterTurns: 1,
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "<<",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              mainCategoryName.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 8.0),
            ),
            const Text(
              ">>",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class SubCategoryItem extends StatelessWidget {
  final String subCategoryName;
  final String imageUrl;
  const SubCategoryItem({
    Key? key,
    required this.subCategoryName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubCategory(
              subCategory: subCategoryName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
          Text(subCategoryName, overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
