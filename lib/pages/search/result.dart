import 'dart:math';

import 'package:curious/pages/search/search_tab.dart';
import 'package:flutter/material.dart';

import "./result_api.dart";
import './result_title.dart';
import 'search_result.dart';
import "./error_texts.dart";

class Result extends StatefulWidget{
  final String keyword;

  const Result(this.keyword, {Key? key}) : super(key: key);

  @override
  ResultState createState() => ResultState();
}

class ResultState extends State<Result>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      SearchTab(snapshot.data)
                    ]);
                  } 
                  else if (snapshot.hasError){
                    return Flexible(
                      child: Padding(
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
                      )
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