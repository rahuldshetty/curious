import 'package:curious/pages/search/search_result.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  final SearchResult? result;

  const SearchTab(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: SizedBox(
        child: TabBar(
            isScrollable: true,
            indicator: BoxDecoration( // Creates border

            ),
            tabs: [
              Tab(text: 'Definition'),
              Tab(text: 'Synonym'),
              Tab(text: 'Antonym'),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Color.fromARGB(255, 160, 160, 160),
            labelStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          )
      ),
    );
  }
}