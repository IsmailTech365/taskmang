// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nko_flutter/Data/Model/decision.dart';

class CardDecisions extends StatelessWidget {
  Decisions t;
  CardDecisions({
    required this.t,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        elevation: 4,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 20, 98, 128),
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            style: ListTileStyle.drawer,
            trailing: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'NKO-Decisions-00${t.id}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 20, 98, 128)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    t.date!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 20, 98, 128)),
                  ),
                ],
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Nasaem Khair',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 98, 128),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Number: ${t.numdecisions}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 98, 128),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Color.fromARGB(255, 20, 98, 128),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'قرار إداري',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 20, 98, 128),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${t.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 20, 98, 128),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 98, 128),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          )
        ]));
  }
}
