import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  NavButton(this.data, this.path, this.icon);
  final String path;
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, path);
      }, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,size: 60,),
          Text(data),
        ],
      ),
      
      style: ElevatedButton.styleFrom(
        fixedSize:Size.square(110),
        primary: Colors.white,
        onPrimary: Colors.black,
        padding: EdgeInsets.all(15),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      );
  }
}