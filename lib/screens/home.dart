import 'package:flutter/material.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:wastinnova/components/navbutton.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container( 
          decoration:const  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/homebg.png'),
            fit: BoxFit.fill,
            ),),),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/useme.png'),
                const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavButton('Track Van','tracking',Icons.location_on),
                    NavButton("Dump waste",'dumpwaste',Icons.delete_sweep_sharp),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavButton("Stats",'stats',Icons.pie_chart_sharp),
                    NavButton("Connect",'connect',Icons.connect_without_contact),
                  ],
                ),
              ],
              ),
          ),
        ],
      ),
    );
  }
}

