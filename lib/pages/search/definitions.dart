import 'package:curious/pages/search/search_result.dart';
import "package:flutter/material.dart";

import "package:string_extensions/string_extensions.dart";

class DefinitionPage extends StatelessWidget {
  final List<Meanings>? meanings;

  const DefinitionPage(this.meanings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> definitionList=[];

    for(int i=0;i<meanings!.length;i++){

      List<Widget> subDefinition=[];
      for(int j=0;j<meanings![i].definitions.length;j++){
        subDefinition.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child:Text(
                  (j+1).toString()+". ", 
                style: const TextStyle(
                    color: Colors.black
                )
                )
              ),
              Expanded(
                flex: 1,
                  child:Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    meanings![i].definitions[j].definition.capitalize!,
                    style: const TextStyle(
                      color: Colors.black
                    ),
                  )
                )
              )
            ],
          )
        );

        String? eg=meanings![i].definitions[j].example.capitalize;

        if(eg!=""){
          String initialSpacing = ""; 
          subDefinition.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child:Text(initialSpacing, 
                  style: const TextStyle(
                      color: Colors.black
                    )
                  )
                ),
                Expanded(
                  flex: 18,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      "Example: "+ meanings![i].definitions[j].example.capitalize!+".",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.italic
                      ),
                    )
                  )
                )

              ],
            )
        );
        }
      }


      definitionList.add(
        Card(
          elevation: 2,
          child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child:ListTile(
              title: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                (meanings![i].partOfSpeech).capitalize!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 80, 80, 80)
                ),
              )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: subDefinition
              ),
            ))
          )
        )
      );
      definitionList.add(const Padding(padding: EdgeInsets.all(2)));
    }

    return Column(
      children: definitionList
    );
  }
}