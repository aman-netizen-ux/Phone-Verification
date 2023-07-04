import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() {
    // TODO: implement createState
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.only(top: 180.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          'Please select your profile',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 28),
        Container(
          margin: const EdgeInsets.only(left: 18.0, right: 18.0),
          //color: Colors.white,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: Colors.white),

          // width: 48.0,

          height: 100.0,

          child: RadioListTile<int>(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 13.0, horizontal: 7.0),
            //toggleable: false,
            activeColor: Color.fromARGB(255, 46, 59, 98),
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'asset/images/shipper.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipper',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 47, 48, 55),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet,\nconsectetur adipisicing',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        Container(
          margin: const EdgeInsets.only(left: 18.0, right: 18.0),
          //color: Colors.white,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: Colors.white),

          height: 100.0,

          child: RadioListTile<int>(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 13.0, horizontal: 7.0),
            activeColor: Color.fromARGB(255, 46, 59, 98),
            value: 2,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'asset/images/Vector 6.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transporter',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 47, 48, 55), fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text('Lorem ipsum dolor sit amet,\nconsectetur adipisicing',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400, fontSize: 12))
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            height: 56,
            child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 59, 98)),
                onPressed: () async {},
                child: Text('CONTINUE',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w700)))),
      ]),
    )));
  }
}
