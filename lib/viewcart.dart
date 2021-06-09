import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';

class viewcart extends StatefulWidget {
  @override
  _viewcartState createState() => _viewcartState();
}

class _viewcartState extends State<viewcart> {
  List<Map<String, dynamic>> viewcart = [];

  getviewcart() async {
    DocumentSnapshot cartid =
        await firestore.collection('users').doc(user.uid).get();
    for (var item in cartid.data()['cart']) {
      DocumentSnapshot cartloop =
          await firestore.collection("orders").doc(item).get();
      viewcart.add(cartloop.data());
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getviewcart();
  }

  @override
  Widget build(BuildContext context) {
    print(viewcart.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("my cart"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              viewcart != null && viewcart.length != 0
                  ? ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewcart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          Text(viewcart[index]['product_name']),
                          Text(viewcart[index]['description']),
                        ]);
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
