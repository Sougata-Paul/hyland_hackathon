import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/profiledetails.dart';
import 'package:intl/intl.dart';

class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  List<QueryDocumentSnapshot> posts = [];
  String str;
  getposts(String value) async {
    posts = [];
    FirebaseFirestore.instance
        .collectionGroup('posts')
        .where('topic', isEqualTo: value)
        .orderBy('postTime', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  posts.add(doc);
                });
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextFormField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                suffixIcon: IconButton(
                  onPressed: () {
                    getposts(str);
                  },
                  icon: Icon(Icons.search, size: 30),
                  color: Colors.white,
                ),
                hintText: 'Search',
                errorStyle: TextStyle(color: Colors.white)),
            onChanged: (value) {
              setState(() {
                str = value;
              });
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              SizedBox(height: 10),
              posts != null && posts.length != 0
                  ? ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profile(
                                        id: posts[index].data()['user_id'],
                                        name:
                                            posts[index].data()['username'])));
                          },
                          child: Card(
                            elevation: 15,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(),
                                    Text(
                                      posts[index].data()['username'],
                                      style: TextStyle(
                                          color: Colors.blue.shade900,fontSize: 23),
                                    ),
                                    Text(
                                      DateFormat('EEE, dd MMM yyyy H:mm')
                                          .format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            posts[index]
                                                    .data()['postTime']
                                                    .seconds *
                                                1000),
                                      ),
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    SizedBox(height:5),
                                    Text(posts[index].data()['name'],style: TextStyle(fontSize: 20),),
                                  ]),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(),
            ]),
          ),
        ));
  }
}
