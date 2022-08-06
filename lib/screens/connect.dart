import 'package:flutter/material.dart';
import 'package:wastinnova/constants.dart';


class ConnectScreen extends StatelessWidget {
  final List<Map<String, String>> connectWithList = [
    {
      'name' : 'AAAA BBBBB',
      'contact' : '9823981125',
    },
    {
      'name' : 'AAAA BBBBB',
      'contact' : '9823981125',
    },
    {
      'name' : 'AAAA BBBBB',
      'contact' : '9823981125',
    },
    {
      'name' : 'AAAA BBBBB',
      'contact' : '9823981125',
    },
    {
      'name' : 'AAAA BBBBB',
      'contact' : '9823981125',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Container( 
            decoration:const  BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/DUMP.png'),
              fit: BoxFit.fill,
              ),),),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Connect",style: kheaderstyle,),
                    Container(
                      height: 600,
                      child: ListView(
                        children: 
                        connectWithList.map((org) {
                          return ConnectCard(
                                  name:org['name'],
                                  contact:org['contact'],);
                        }).toList(),
                    ),
                    
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}


class ConnectCard extends StatelessWidget {
  const ConnectCard({
    Key? key,
    @required this.name,
    @required this.contact,
  }) : super(key: key);
  final String? name,contact;

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 5,
    
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Name: $name"),
          SizedBox(height: 15,),
          Text("Contact : $contact"),
        ],
      ),
    ),
  );
  }
}
