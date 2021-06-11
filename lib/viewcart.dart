import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';

class viewcart extends StatefulWidget {
  @override
  _viewcartState createState() => _viewcartState();
}

class _viewcartState extends State<viewcart> {
  List<Map<String, dynamic>> viewcart = [];
  bool showspinner=true;
  getviewcart() async {
    DocumentSnapshot cartid =
        await firestore.collection('users').doc(user.uid).get();
    for (var item in cartid.data()['cart']) {
      DocumentSnapshot cartloop =
          await firestore.collection("orders").doc(item).get();
      viewcart.add(cartloop.data());
    }
    setState(() {
      showspinner=false;
    });
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
        title: Text("My Cart"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.lightBlue.shade300,
      ),
      body: ModalProgressHUD (
        inAsyncCall: showspinner,
              child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height:10),
                viewcart != null && viewcart.length != 0
                    ? ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewcart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 15,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewcart[index]['product_name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      viewcart[index]['description'],
                                      style:
                                          TextStyle(color: Colors.grey.shade600),
                                    ),
                                    Divider(color: Colors.lightBlue.shade300),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. " +
                                              viewcart[index]['price'].toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    Divider(color: Colors.lightBlue.shade300),
                                  ]),
                            ),
                          );
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
