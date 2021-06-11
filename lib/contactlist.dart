import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class contactlist extends StatefulWidget {
  @override
  _contactlistState createState() => _contactlistState();
}

class _contactlistState extends State<contactlist> {
  bool showspinner=true;
  QuerySnapshot contact;
  getcontact() async {
    contact = await firestore.collection('contacts').get();
    setState(() {
      contact = contact;
      showspinner=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcontact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.lightBlue.shade300,
        title: Text("List Of Government Contact No"),
      ),
      body: ModalProgressHUD (
        inAsyncCall: showspinner,
              child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(height:10),
                  contact != null && contact.size != 0
                      ? ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contact.size,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            contact.docs[index].data()['disease']+":  ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            contact.docs[index].data()['contact'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
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
          )),
        ),
      ),
    );
  }
}
