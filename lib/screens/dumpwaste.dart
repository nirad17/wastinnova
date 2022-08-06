import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wastinnova/components/text_input.dart';
import 'package:wastinnova/constants.dart';

class DumpWaste extends StatefulWidget {
  const DumpWaste({Key? key}) : super(key: key);

  @override
  _DumpWasteState createState() => _DumpWasteState();
}

class _DumpWasteState extends State<DumpWaste> {
  bool value6kg = false;
  bool value12kg = false;
  bool value50kg = false;
  bool value120kg = false;
  TextEditingController _wetController = TextEditingController();
  TextEditingController _dryController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _wetController.dispose();
    _dryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SvgPicture.asset('assets/shapes.svg'),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     alignment: Alignment.topLeft,
            //     image: SvgPicture.asset('assets/shapes.png'),
            //     // AssetImage('assets/shapes.png'),

            //     // fit: BoxFit.fill,
            //   ),
            // ),
          ),
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
                        value6kg = value!;
                      });
                    }),
                CheckboxListTile(
                    secondary: Image.asset('assets/dustbin12kg.png'),
                    title: Text('Regular'),
                    subtitle: Text('Household Size\n12 KG'),
                    value: value12kg,
                    onChanged: (value) {
                      setState(() {
                        value12kg = value!;
                      });
                    }),
                CheckboxListTile(
                    secondary: Image.asset('assets/dustbin50kg.png'),
                    title: Text('Large'),
                    subtitle: Text('50 KG'),
                    value: value50kg,
                    onChanged: (value) {
                      setState(() {
                        value50kg = value!;
                      });
                    }),
                CheckboxListTile(
                    secondary: Image.asset('assets/dustbin120kg.png'),
                    title: Text('Extra Large'),
                    subtitle: Text('120 KG'),
                    value: value120kg,
                    onChanged: (value) {
                      setState(() {
                        value120kg = value!;
                      });
                    }),
                ElevatedButton(
                  onPressed: () {
                    AddInfoDialog(context);
                  },
                  child: Text(
                    "Dump",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color(0xFF37B943),
                    fixedSize: Size.fromWidth(300),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> AddInfoDialog(BuildContext context) {
    return showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Enter additional info ",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFieldInput(
                                hintText: "Wet waste weight",
                                textEditingController: _wetController,
                                textInputType: TextInputType.number),
                            SizedBox(
                              height: 25,
                            ),
                            TextFieldInput(
                                hintText: "Dry waste weight",
                                textEditingController: _dryController,
                                textInputType: TextInputType.number),
                            SizedBox(
                              height: 25,
                            ),
                            ListTile(
                              tileColor: Colors.black12,
                              shape: StadiumBorder(),
                              iconColor: primaryColor,
                              leading: Icon(
                                Icons.location_pin,
                              ),
                              title: Text("VIT, Katpadi"),
                              trailing: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                      fontSize: 12, color: primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.check_circle),
                              label: Text("Submit"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                primary: Color(0xFF37B943),
                                fixedSize: Size.fromWidth(150),
                                shape: StadiumBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}
