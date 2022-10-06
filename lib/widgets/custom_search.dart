import 'package:flutter/material.dart';

import '../views/inner_screens/search_screen.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.6,
            color: Colors.cyan,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(width: 10,),
                Text(
                  'What are you looking for ?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.cyan,
              ),
              child: const Center(
                  child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}