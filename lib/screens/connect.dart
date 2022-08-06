import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wastinnova/constants.dart';

class ConnectScreen extends StatelessWidget {
  final List<Map<String, String>> connectWithList = [
    {
      'name': 'AAAA BBBBB',
      'contact': '8104001546',
      'rating': '4.5',
      'location': 'Vellore',
      'imageUrl' : 'assets/connect.png',
    },
    {
      'name': 'AAAA BBBBB',
      'contact': '8104001546',
      'rating': '4.5',
      'location': 'Vellore',
      'imageUrl' : 'assets/connect.png',
    },
    {
      'name': 'AAAA BBBBB',
      'contact': '8104001546',
      'rating': '4.5',
      'location': 'Vellore',
      'imageUrl' : 'assets/connect.png',
    },
    {
      'name': 'AAAA BBBBB',
      'contact': '8104001546',
      'rating': '4.5',
      'location': 'Vellore',
      'imageUrl' : 'assets/connect.png',
    },
    {
      'name': 'AAAA BBBBB',
      'contact': '8104001546',
      'rating': '4.5',
      'location': 'Vellore',
      'imageUrl' : 'assets/connect.png',
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
              child: SvgPicture.asset('assets/shapes.svg'),
              alignment: Alignment.topLeft,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Connect",
                      style: kheaderstyle,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 600,
                      child: ListView(
                        children: connectWithList.map((org) {
                          return ConnectCard(
                            name: org['name']!,
                            contact: org['contact']!,
                            rating: org['rating']!,
                            location: org['location']!,
                            imageUrl: org['imageUrl']!,
                          );
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

class ConnectCard extends StatefulWidget {
  const ConnectCard({
    Key? key,
    required this.name,
    required this.contact,
    required this.imageUrl,
    required this.rating,
    required this.location,
  }) : super(key: key);
  final String name, contact, location, rating, imageUrl;

  @override
  State<ConnectCard> createState() => _ConnectCardState();
}

class _ConnectCardState extends State<ConnectCard> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        //add box shadow to the card
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:28.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${widget.name}"),
                Row(
                  children: [
                    Text("Contact : "),
                    TextButton(onPressed: () => launch("tel://${widget.contact}"),
                    //   _hasCallSupport
                    // ? () => setState(() {
                    //       _launched = _makePhoneCall(widget.contact);
                    //     })
                    // : null;
                // child: _hasCallSupport
                //     ? const Text('Make phone call')
                //     : const Text('Calling not supported');
                    // },
                    child: Text(widget.contact)),
                  ],
                ),
                Text("Rating : ${widget.rating} ⭐"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    Text(widget.location,),
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
