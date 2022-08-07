import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:wastinnova/screens/shopping_cart.dart';

String Name = "Piggy Bank";
String Price = "Rs. 450";

TextStyle headingStyle = TextStyle(
  color: Colors.black,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);
TextStyle itemStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);
TextStyle priceStyle = TextStyle(
  color: Colors.black,
  fontSize: 15.0,
  fontWeight: FontWeight.w600,
);
TextStyle buyButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  int cnt = 0;
  int cartCounter = 0;
  List<int> lst = List.filled(15, 0);
  var items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.ac_unit_rounded,
                      size: 45,
                    ),
                    Text(
                      'Buy',
                      style: headingStyle,
                    ),
                    if (cartCounter != 0)
                      Badge(
                        position: BadgePosition.topEnd(top: 2, end: -2),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.scale,
                        badgeContent: Text(
                          '$cartCounter',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 45,
                            ),
                            onPressed: () {
                              print(items.length);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cart(items: items),
                                ),
                              );
                            }),
                      )
                    else
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart(items: items),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 45,
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 15,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(8),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('images/Piggy_bank.jpeg'),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        Name,
                                        style: itemStyle,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        Price,
                                        style: priceStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (lst[index] != 0)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  cnt--;
                                                  lst[index]--;
                                                  cartCounter--;
                                                });
                                              },
                                              child: Container(
                                                // color: Colors.yellow,
                                                height: 30,
                                                width: 30,
                                                child: Icon(Icons.remove),
                                                decoration: BoxDecoration(
                                                  color: Color(0xff36B942),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Container(
                                              child:
                                                  Text(lst[index].toString()),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  // cnt++;
                                                  lst[index]++;
                                                  cartCounter++;
                                                  // print(items.length);
                                                  // var temp = [];
                                                  // temp.add(lst[index]);
                                                  // temp.add(Name);
                                                  // temp.add(Price);
                                                  // items.add(temp);
                                                });
                                              },
                                              child: Container(
                                                // color: Colors.yellow,
                                                height: 30,
                                                width: 30,
                                                child: Icon(Icons.add),
                                                decoration: BoxDecoration(
                                                  color: Color(0xff36B942),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      else
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              cnt++;
                                              lst[index]++;
                                              cartCounter++;
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Buy',
                                              style: buyButtonStyle,
                                            ),
                                            // height: 30,
                                            // width: 12,
                                            constraints: BoxConstraints(
                                              minHeight: 30, //minimum height
                                              minWidth: 90,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF36B942),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

