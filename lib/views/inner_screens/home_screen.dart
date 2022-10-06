import 'package:flutter/material.dart';
import 'package:multi_vendor/utilities/category_constants.dart';
import '../../widgets/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CustomSearch(),
          bottom: TabBar(
            indicatorColor: Colors.cyan,
            isScrollable: true,
            tabs: [
              for (int i = 0; i < categoryList.length; i++)
                Tab(
                  child: Text(categoryMap[categoryList[i]]!, style: const TextStyle(color: Colors.black),),
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < categoryList.length; i++)
              Center(
                child: Text(
                  '${categoryMap[categoryList[i]]!} screen',
                ),
              )
          ],
        ),
      ),
    );
  }
}


