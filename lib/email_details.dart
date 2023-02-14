import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Services/Remoteservice.dart';
import 'model_class/email_class.dart';

class Emaildetails extends StatefulWidget {
  @override
  State<Emaildetails> createState() => _EmaildetailsState();
}

class _EmaildetailsState extends State<Emaildetails> {
  late Future<dynamic> dataFuture;
  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
            future: dataFuture,
            //initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Text('$error');
                  } else if (snapshot.hasData) {
                    dynamic data = snapshot.data!;
                    return Column(
                      children: [
                        SvgPicture.asset('images/email_opened.svg'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data.email),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text(data.deliverability),
                          trailing: data.autocorrect,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text('Result'),
                          trailing: Icon(Icons.check_box),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text('Result'),
                          trailing: Icon(Icons.check_box),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text('Result'),
                          trailing: Icon(Icons.check_box),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text('Result'),
                          trailing: Icon(Icons.check_box),
                        ),
                      ],
                    );
                  } else {
                    return Text('No data');
                  }
              }
              ;
            }),
      ),
      // ignore: dead_code
    );
  }
}
