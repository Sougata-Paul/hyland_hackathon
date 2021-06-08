import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  String id;
  String name;
  profile({this.id, this.name});

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  QuerySnapshot posts;
  getposts() async {
    posts = await FirebaseFirestore.instance
        .collection('users/{widget.id}/posts')
        .orderBy('postTime', descending: true)
        .get();
    setState(() {
      posts=posts;
       print(posts.size);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getposts();
  }

  @override
  Widget build(BuildContext context) {
    
    // if(posts!=null){
    // print(posts.docs[0].data()['topic']);
    // }
    return Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Text(widget.name),
            posts!=null &&posts.size!=0?
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Text(posts.docs[index].data()['topic']),
                        Text(posts.docs[index].data()['name']),
                      ]);
                    },
                  ):Container(),
                
          ]),
        ));
  }
}
