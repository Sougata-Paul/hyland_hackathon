import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/doctordetails.dart';

class Doctorlist extends StatelessWidget {
  QuerySnapshot doctorlist;
  Doctorlist({this.doctorlist});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctors")),
      body: ListView.builder(
          itemCount: doctorlist.size,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetails(
                              doctorid: doctorlist.docs[index].id,
                              doctordetails: doctorlist.docs[index].data(),
                            )));
              },
              child: ListTile(
                  subtitle: Text(
                    doctorlist.docs[index].data()['disease'].toString(),
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text(doctorlist.docs[index].data()['name'])),
            );
          }),
    );
  }
}
