import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp.dart';

void main() {
  runApp(
    MaterialApp(home: MobileNo()),
  );
}

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});

  static String verify = "";

  @override
  State<MobileNo> createState() {
    return _MobileNoState();
  }
}

class _MobileNoState extends State<MobileNo> {
  TextEditingController phoneNumber = TextEditingController();

  bool visible = false;
  var temp;

  String? codeMobile;
  var mobile;

  @override
  void dispose() {
    phoneNumber.dispose();

    super.dispose();
  }

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
            icon: const Icon(Icons.close),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Center(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Please enter your mobile number',
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
                        'You\'ll receive a 6 digit code\n to verify next.',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: IntlPhoneField(
                          invalidNumberMessage: null,
                          showDropdownIcon: false,
                          dropdownTextStyle: TextStyle(fontSize: 20),
                          flagsButtonMargin:
                              const EdgeInsets.only(left: 10, right: 20),
                          decoration: InputDecoration(
                            counterText: '',
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                            hintText: 'Mobile Number',
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Color.fromARGB(255, 106, 108, 123)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            setState(() {
                              codeMobile = phone.completeNumber;
                              mobile = phone.number;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                          margin:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          height: 56,
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 46, 59, 98)),
                              onPressed: () async {
                                String phoneNumberr =
                                    '${codeMobile! + phoneNumber.text}';
                                await FirebaseAuthentication()
                                    .sendOTP(phoneNumberr);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Otp(phone: mobile),
                                  ),
                                );
                              },
                              child: Text('CONTINUE',
                                  style:
                                      GoogleFonts.montserrat(fontSize: 16)))),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Stack(
                  children: [
                    Image.asset(
                      'asset/images/Vector 3.png',
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'asset/images/Vector2.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOTP(String codeMobile) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: codeMobile,
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Failed to send OTP: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        MobileNo.verify = verificationId;
        print('OTP Sent! Verification ID: $verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
