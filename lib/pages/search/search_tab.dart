import 'package:curious/pages/search/search_result.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  final SearchResult? result;
  final TabController tabController;
  int selectIndex;

  SearchTab(this.selectIndex, this.tabController, this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return SizedBox(
      child: Column(
          children: [
              TabBar(
                controller: tabController,
                isScrollable: true,
                indicator: const BoxDecoration( // Creates border

                ),
                tabs: const [
                  Tab(text: 'Definition'),
                  Tab(text: 'Synonym'),
                  Tab(text: 'Antonym'),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: const Color.fromARGB(255, 160, 160, 160),
                labelStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
                onTap: (int index){
                  selectIndex = index;
                  tabController.animateTo(index);
                  (context as Element).markNeedsBuild();
                }
              ),
              IndexedStack(
                index: selectIndex,
                children: [
                  Visibility(
                    child: Icon(Icons.flight, size: 350),
                    visible: selectIndex==0
                  ),
                  Visibility(
                    child: Icon(Icons.directions_transit, size: 350),
                    visible: selectIndex==1
                  ),
                  Visibility(
                    child: Icon(Icons.directions_car, size: 350),
                    visible: selectIndex==2
                  )
                ]
              )
          ],
        )
    );
  }
}