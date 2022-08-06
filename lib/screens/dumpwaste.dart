import 'package:flutter/material.dart';
import 'package:wastinnova/constants.dart';

class DumpWaste extends StatefulWidget {
  const DumpWaste({ Key? key }) : super(key: key);

  @override
  _DumpWasteState createState() => _DumpWasteState();
}

class _DumpWasteState extends State<DumpWaste> {
  bool value6kg=false;
  bool value12kg=false;
  bool value50kg=false;
  bool value120kg=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container( 
          decoration:const  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/DUMP.png'),
            fit: BoxFit.fill,
            ),),),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Select Dustbin Size",
                  textAlign: TextAlign.center,
                  style: kheaderstyle,
                ),
                CheckboxListTile(
                  secondary: Image.asset('assets/dustbin6kg.png'),
                  title: Text('Small'),
                  subtitle: Text('Table Size\n6 KG'),
                  value: value6kg, 
                  onChanged: (value) {
                    setState(() {
                      value6kg=value!;
                    });
                    
                  }),
                  CheckboxListTile(
                  secondary: Image.asset('assets/dustbin12kg.png'),
                  title: Text('Regular'),
                  subtitle: Text('Household Size\n12 KG'),
                  value: value12kg, 
                  onChanged: (value) {
                    setState(() {
                      value12kg=value!;
                    });
                    
                  }),
                  CheckboxListTile(
                  secondary: Image.asset('assets/dustbin50kg.png'),
                  title: Text('Large'),
                  subtitle: Text('50 KG'),
                  value: value50kg, 
                  onChanged: (value) {
                    setState(() {
                      value50kg=value!;
                    });
                    
                  }),
                  CheckboxListTile(
                  secondary: Image.asset('assets/dustbin120kg.png'),
                  title: Text('Extra Large'),
                  subtitle: Text('120 KG'),
                  value: value120kg, 
                  onChanged: (value) {
                    setState(() {
                      value120kg=value!;
                    });
                    
                  }),
                ElevatedButton(
                  onPressed: () {
                    
                  }, 
                  child: Text("Dump",style: TextStyle(fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color(0xFF37B943),
                    fixedSize: Size.fromWidth(300),
                  ),),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}