import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'email_details.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmailValid = false;

  void emailResponse(String outPut) {
    debugPrint('Email:$outPut');
  }

  void selectSubmit() {
    if (emailTextController.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Emaildetails(emailTextController.text);
      }));
    }
  }

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/email_opened.svg',
                height: 120,
                width: 120,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    emailResponse(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.email),
                      hintText: 'Your email Address',
                      labelText: 'E-mail'),
                  controller: emailTextController,
                  validator: (text) {
                    return EmailValidator.validate(text!)
                        ? null
                        : "Please enter an email address";
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: selectSubmit, child: Text('SUBMIT'))
                ],
              ),
            ],
          )),
    );
  }
}
