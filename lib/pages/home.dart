// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  void searchKeyword(String keyword){
    
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 140,),
          const Padding(
            padding: EdgeInsets.all(14),
            child: Image(
              image: AssetImage("assets/logo.png"),
              width: 175,
              height: 175,
            )
          ),
           const Text(
              'Thesaurus',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(7),
              child: const Text(
                'Find meaning, synonyms, antonyms and related words',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 160, 160, 160),
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search by word',
                  prefixIcon: Icon(Icons.search)
                ),
                onSubmitted:(value) => searchKeyword(value),
              )
            )
            
        ],
      ) 
    );
  }

}