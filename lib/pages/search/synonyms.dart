import 'package:curious/pages/search/result.dart';
import 'package:curious/pages/search/search_result.dart';
import "package:flutter/material.dart";
import "package:string_extensions/string_extensions.dart";

class SynonymsPage extends StatelessWidget {
  final List<Meanings>? meanings;

  const SynonymsPage(this.meanings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> synonymList=[];

    for(int i=0;i<meanings!.length;i++){
      List<Definitions> definitions = meanings![i].definitions;
      for(int j=0;j<definitions.length;j++){
        
        List<String> synonyms = meanings![i].definitions[j].synonyms;
        for (String synonym in synonyms) {
          synonymList.add(
            Card(
            elevation: 2,
            child: InkWell( 
              onTap: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx)=>Result(synonym.capitalize!), maintainState:true)
                )
              },
              child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child:ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                    synonym.capitalize!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 80, 80, 80)
                    ),
                  ))
                ))
              ),
            )
          )

          );
        }
      }
    }

    if(synonymList.isEmpty){
      return  Column(children: const [
        Image(
          image: AssetImage('assets/missing.png'),
          width: 300,
          height: 300,  
        ),
        Padding(
          padding: EdgeInsets.all(7),
          child: Text(
          'Synonyms not found!'
        )  
        )
      ]);
    }

     return Column(
      children: synonymList
    );
  }
}