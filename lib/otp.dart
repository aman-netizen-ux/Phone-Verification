import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/phone.dart';
import 'package:task/res/pin_input.dart';

class Otp extends StatefulWidget {
  Otp({required this.phone});
  final String? phone;
  @override
  State<Otp> createState() {
    return _OtpState();
  }
}

class _OtpState extends State<Otp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
          ),
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Verify Phone',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Code is sent to ${widget.phone}',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: const EdgeInsets.only(left: 32, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: true, last: false),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: false, last: false),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: false, last: false),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: false, last: false),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: false, last: false),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: PinInput(first: false, last: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the code?',
                    style:
                        GoogleFonts.roboto(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Text Clicked');
                    },
                    child: Text(
                      'Request Again',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 32.0, right: 16.0),
                  height: 56,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 46, 59, 98)),
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: MobileNo.verify,
                                  smsCode: code);

                          await auth.signInWithCredential(credential);
                          code = "";
                          Navigator.pushNamedAndRemoveUntil(
                              context, "home", (route) => false);
                        } catch (e) {
                          print("Wrong Otp");
                          print(code);
                          code = "";
                        }
                      },
                      child: Text('VERIFY AND CONTINUE',
                          style: GoogleFonts.montserrat(fontSize: 16)))),
            ],
          ))),
    );
  }
}
