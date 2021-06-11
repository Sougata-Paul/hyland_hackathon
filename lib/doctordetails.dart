import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  String doctorid;
  Map<String, dynamic> doctordetails;
  DoctorDetails({this.doctorid, this.doctordetails});
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctordetails['name']),
      ),
      body: Text(widget.doctordetails.toString()),
    );
  }
}
