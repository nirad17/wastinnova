import 'package:flutter/material.dart';

class TrackingVan extends StatefulWidget {


  @override
  _TrackingVanState createState() => _TrackingVanState();
}

class _TrackingVanState extends State<TrackingVan> {
  double v=0.45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Tracking",
            style:TextStyle(
                    fontSize: 45,
                    fontWeight:FontWeight.bold,
                    color: Colors.black87,)),
            Row(
              
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 15),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 15,
                        ),
                      child: Slider(
                        
                        value: v, 
                        onChanged: (newvalue) {
                          setState(() {
                            v=v;
                          });
                        },
                        activeColor: Color(0xFF87F695) ,
                        thumbColor: Color(0xFF34A853),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                    Text("Start Point"),
                    SizedBox(height: 45,),
                    Text("Current Location"),
                    SizedBox(height: 40,),
                    Text("Your Location"),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vehicle Number : MH-01-XX-0000",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Nearest Landmark : D-mart",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("ETA : 10mins",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        )),
    );
  }
}