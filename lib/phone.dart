import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// void main() {
//   runApp(MobileNo());
// }

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});
  @override
  State<MobileNo> createState() {
    return _MobileNoState();
  }
}

class _MobileNoState extends State<MobileNo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Please enter your mobile number',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'You\'ll receive a 4 digit code\n to verify next.',
                style: TextStyle(
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
                    decoration: const InputDecoration(
                      counterText: '',
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      hintText: 'Mobile Number',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 106, 108, 123)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
