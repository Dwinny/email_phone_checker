import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Services/Remoteservice.dart';
import '../model_class/email_class.dart';
import 'email_check.dart';

class Emaildetails extends StatefulWidget {
  final emailAddress;
  Emaildetails(this.emailAddress);

  @override
  State<Emaildetails> createState() => _EmaildetailsState();
}

class _EmaildetailsState extends State<Emaildetails> {
  late Future<Emailverify>? dataFuture;
  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  Future<Emailverify> getData() async {
    return EmailService().getUsers(widget.emailAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: dataFuture,
            //initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: const CircularProgressIndicator());
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Text('$error');
                  } else if (snapshot.hasData) {
                    dynamic data = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: SvgPicture.asset(
                          'images/email_opened.svg',
                          height: 120,
                          width: 120,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(child: Text(data.email)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 239, 239),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('RESULT'),
                                Icon(data.isValidFormat.value == true
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 223, 223),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('DELIVERABLE'),
                                Icon(data.deliverability == 'DELIVERABLE'
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 223, 223),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('DELIVERABLE'),
                                Icon(data.deliverability == 'DELIVERABLE'
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 223, 223),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('QUALITY SCORE'),
                                Icon(data.qualityScore == '0.70'
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 223, 223),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('IS FREE EMAIL'),
                                Icon(data.isFreeEmail.value == true
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 223, 223),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('IS DISPOSABLE EMAIL'),
                                Icon(data.isDisposableEmail.value == false
                                    ? Icons.check_box
                                    : Icons.wrong_location)
                              ],
                            ))
                      ],
                    );
                  } else {
                    return const Text('No data');
                  }
              }
              ;
            }),
      ),
      // ignore: dead_code
    );
  }
}
