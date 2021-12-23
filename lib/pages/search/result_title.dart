import 'package:curious/pages/search/search_result.dart';
import "package:flutter/material.dart";
import 'package:string_extensions/string_extensions.dart';

class ResultTitle extends StatelessWidget {
  final SearchResult? result;

  const ResultTitle(this.result, {Key? key}) : super(key: key);

  Widget buildPhoneticList(){
    List<Widget> phoneticList = []; 

      for (var phonetic in result!.phonetics) { 
        phoneticList.add(Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 28),
            child: Row(
              children: [
                Text(
                  "[ " + phonetic.text + " ]",
                  style: const TextStyle(
                    color:  Colors.white,
                    fontSize: 21
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.audiotrack_sharp, color: Colors.white),
                  onPressed: ()=>print('hello'),
                )
              ] 
            )
          )
        ));
      } 

    return ListView(
      padding: const EdgeInsets.all(7),
      children: phoneticList,
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7) ,
        child: Card(
          elevation: 10,
          shape:  RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(7.0),  
          ),
          child: Container( 
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(7)
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 164,80,139),
                  Color.fromARGB(255, 95,10,135)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      (result?.word).capitalize!,
                      style: const TextStyle(
                        fontSize: 42,
                        color: Colors.white
                      ),
                    )
                  ),
                ),
                buildPhoneticList()
              ],
            )
          )
      )
      
    );
  }
}