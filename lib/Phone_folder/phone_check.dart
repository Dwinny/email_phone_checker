import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'phone_details.dart';
import 'package:email_validator/email_validator.dart';

class phonecheck extends StatelessWidget {
  const phonecheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Number checker')),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                  'images/email_opened.svg',
                  height: 150,
                  width: 150,
                )),
                SizedBox(
                  height: 10,
                ),
                Textfield(),
                SizedBox(
                  height: 10,
                ),
                Submitbar(),
              ],
            ),
          )),
    );
  }
}

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: phoneFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty && value.length < 10) {
            return 'phone number (+x xxx xxx xxxx)';
          }
        },
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.email),
            hintText: 'Your phone number',
            labelText: 'Phone no'),
        onChanged: (value) {
          String phoneNumber = value;
        },
        keyboardType: TextInputType.emailAddress,
        controller: phoneNumberController,
      ),
    );
  }
}

class Submitbar extends StatefulWidget {
  const Submitbar({super.key});

  @override
  State<Submitbar> createState() => _SubmitbarState();
}

final phoneNumberController = TextEditingController();
final phoneFormKey = GlobalKey<FormState>();

class _SubmitbarState extends State<Submitbar> {
  void selectSubmit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return phoneNumberDetails(phoneNumberController.text);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: selectSubmit, child: Text('SUBMIT'))
      ],
    );
  }
}
