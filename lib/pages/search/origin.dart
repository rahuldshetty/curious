import 'package:curious/pages/search/search_result.dart';
import "package:flutter/material.dart";

import "package:string_extensions/string_extensions.dart";

class OriginsPage extends StatelessWidget {
  final String? origin;

  const OriginsPage(this.origin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> originList=[];

    if(origin!=""){
      originList.add(
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
                origin!.capitalize!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 80, 80, 80)
                ),
              ))
            ))
          )
        )
      );
    }

    return Column(
      children: originList
    );
  }
}