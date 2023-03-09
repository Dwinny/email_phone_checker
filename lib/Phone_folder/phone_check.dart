import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'phone_details.dart';
import 'package:email_validator/email_validator.dart';

class phonecheck extends StatefulWidget {
  const phonecheck({super.key});

  @override
  State<phonecheck> createState() => _phonecheckState();
}

class _phonecheckState extends State<phonecheck> {
  final phoneNumberController = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();
  void selectSubmit() {
    if (phoneNumberController.text.isNotEmpty &&
        phoneFormKey.currentState!.validate() &&
        !(phoneNumberController.text.length < 10)) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return phoneNumberDetails(phoneNumberController.text);
      }));
    }
  }

  void resultOutput(int output) {
    debugPrint('Phone Number: $output');
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: SvgPicture.asset(
                  'images/phone_opened.svg',
                  height: 120,
                  width: 120,
                )),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: phoneFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty && value.length < 10) {
                        return 'phone number (+x xxx xxx xxxx)';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: 'Your phone number',
                        labelText: 'Phone no'),
                    onFieldSubmitted: (value) {
                      return resultOutput(value as int);
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: phoneNumberController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: selectSubmit, child: Text('SUBMIT'))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
