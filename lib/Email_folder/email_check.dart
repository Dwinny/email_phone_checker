import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'email_details.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emailchecker')),
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: TextFormField(
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.email),
            hintText: 'Your email Address',
            labelText: 'E-mail'),
        onFieldSubmitted: (value) {
          String emailName = value;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (text) {
          EmailValidator.validate(text!)
              ? null
              : "Please enter an email address";
        },
      ),
    );
  }
}

class Submitbar extends StatefulWidget {
  const Submitbar({super.key});

  @override
  State<Submitbar> createState() => _SubmitbarState();
}

final emailTextController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _SubmitbarState extends State<Submitbar> {
  void selectSubmit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Emaildetails(emailTextController.text);
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
