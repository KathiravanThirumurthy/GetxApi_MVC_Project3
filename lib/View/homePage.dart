import 'package:apiproject3/Controller/MyCtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyCtroller _usercontroller = Get.put(MyCtroller());
  @override
  void initState() {
    // TODO: implement initState
    _usercontroller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Random USer")),
        body: _usercontroller.result.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Obx(
                () => ListView.builder(
                    itemCount: _usercontroller.result.length,
                    itemBuilder: (context, index) {
                      var itemlist = _usercontroller.result[index];
                      return InkWell(
                          onTap: () {
                            print('click');
                          },
                          child: Card(
                            elevation: 0,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID:${itemlist.id!.value.toString()}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Email:${itemlist.email.toString()}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Date of Birth:${itemlist.dob!.age}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Username:${itemlist.name!.first}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Phone:${itemlist.phone}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    }),
              ));
  }
}
