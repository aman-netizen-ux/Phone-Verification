import 'package:flutter/material.dart';
import 'package:task/phone.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

enum Category { English, Hindi, Spanish, Russian }

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Category _selectedCategory = Category.English;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('asset/images/image.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Please select your Language',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'You can change the language \n at any time.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 216.0,
                  height: 48.0,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 47, 48, 55), width: 1),
                  ),
                  child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 47, 48, 55), fontSize: 16),
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          if (value == null) {
                            return;
                          }
                          _selectedCategory = value;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                  width: 216,
                  height: 48,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 46, 59, 98)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileNo()));
                      },
                      child:
                          const Text('NEXT', style: TextStyle(fontSize: 16)))),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'asset/images/Vector.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft,
                  ),
                  Image.asset('asset/images/Vector-1.png',
                      fit: BoxFit.cover, alignment: Alignment.bottomCenter)
                ],
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
