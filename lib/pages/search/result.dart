import 'dart:math';

import 'package:curious/pages/search/search_tab.dart';
import 'package:flutter/material.dart';

import "./result_api.dart";
import './result_title.dart';
import 'search_result.dart';
import "./error_texts.dart";

class Result extends StatefulWidget{
  String keyword;

  Result(this.keyword, {Key? key}) : super(key: key);

  @override
  ResultState createState() => ResultState();
}

class ResultState extends State<Result> with TickerProviderStateMixin{
  late TabController tabController;
  late int selectIndex;

  @override
  void initState() {
    super.initState();
    // Number of tabs in search page - Definition, Origin, Synonym, Antonym
    tabController=TabController(length: 4, vsync: this);
    selectIndex = 0;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 21,),
              Row(
                children: [
                  IconButton(
                    onPressed: ()=>Navigator.pop(context), 
                    icon: const Icon(
                      Icons.navigate_before,
                      size: 35
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        initialValue: widget.keyword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search by word',
                            prefixIcon: Icon(Icons.search)
                          ),
                          onFieldSubmitted: (value)=>{
                            widget.keyword=value,
                            (context as Element).markNeedsBuild()
                          },
                      )
                    )
                  )
                ],
              ),
              FutureBuilder<SearchResult>(
                future: searchWordAPI(widget.keyword),
                builder: (BuildContext ctx, AsyncSnapshot<SearchResult> snapshot) {
                    if(snapshot.hasData){
                      return Column(children: [
                        ResultTitle(snapshot.data),
                        SearchTab(selectIndex, tabController, snapshot.data)
                      ]);
                    } 
                    else if (snapshot.hasError){
                      return Padding(
                          padding: const EdgeInsets.all(7),
                          child: 
                            Column(
                              children: [
                              const Image(
                                image: AssetImage("assets/error.png"),
                                width: 348,
                                height: 348
                              ),
                              Text(
                                wordErrors[Random.secure().nextInt(wordErrors.length)],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                ),
                              )
                            
                            ])
                      );
                    }
                    else {
                      return const CircularProgressIndicator();
                    }
                }
              )
            ],
          )
        )
    );
  }
}