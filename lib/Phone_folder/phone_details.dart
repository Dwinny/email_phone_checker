import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Services/Remoteservice2.dart';
import '../model_class/phone_class.dart';

class phoneNumberDetails extends StatefulWidget {
  final phoneNumber;
  phoneNumberDetails(this.phoneNumber);

  @override
  State<phoneNumberDetails> createState() => _phoneNumberDetailsState();
}

class _phoneNumberDetailsState extends State<phoneNumberDetails> {
  late Future<PhoneVerify>? dataFuture;
  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  Future<PhoneVerify> getData() async {
    return PhoneService().getUsers(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: SvgPicture.asset(
                            'images/email_sent.svg',
                            height: 120,
                            width: 120,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(data.phone),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('VALIDITY'),
                                  data.valid
                                      ? (Icon(Icons.check_box,
                                          color: Colors.green))
                                      : Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        )
                                ],
                              )),
                          SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('COUNTRY'),
                                  Column(
                                    children: [
                                      Text(data.country.code),
                                      Text(data.country.name),
                                      Text(data.country.prefix)
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('LOCATION'),
                                  Text(data.location),
                                ],
                              )),
                          SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [const Text('TYPE'), Text(data.type)],
                              )),
                          SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('CARRIER'),
                                  Text(data.carrier)
                                ],
                              )),
                          SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('FORMAT'),
                                  Column(
                                    children: [
                                      Text(data.format.international),
                                      Text(data.format.local),
                                    ],
                                  ),
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
      ),
      // ignore: dead_code
    );
  }
}
