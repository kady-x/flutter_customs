# Examples codelab

In this example you will learn the basics of flutter_customs. You will see how much easier it is to code with this framework, and you will know what problems flutter_customs proposes to solve.

If the default Flutter application were rewritten with flutter_customs, it would have only a few lines of code. The flutter_customs is easier than using a lot of custom packages.

this is customPhoneForm example:

```dart
//  PHONE EXAMPLE  //
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Phone Form',
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: const Key('MyForm'),
                  child: ListView(
                    children: [
                      CustomPhoneForm(
                        hinttext: 'test',
                        iconData: Icons.phone_android_rounded,
                        mycontroller: mycontroller,
                        labeltext: 'test',
                        valid: (value) {
                          if (value == null || value.isEmpty || value == "") {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          phoneSubmition(mycontroller);
                          Future.delayed(
                            const Duration(milliseconds: 20),
                            () {
                              if (kDebugMode) {
                                print(mycontroller.text);
                              }
                            },
                          );
                        },
                        child: const Text(
                          "send",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
