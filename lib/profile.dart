import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';
import 'package:hyland_hackathon/chat/chats.dart';
import 'package:hyland_hackathon/database_calls.dart';

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
        .collection('users').doc(widget.id).collection("posts")
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
    print(widget.id);
    print(userDetails['first_name']);
    return Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Text(widget.name),
            posts!=null && posts.size!=0?
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts.size,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Text(posts.docs[index].data()['topic']),
                        Text(posts.docs[index].data()['name']),
                      ]);
                    },
                  ):Container(),
                ElevatedButton(
                  onPressed: () async {
                      
                      
                        String chatRoomId = await previouslyPresentInContactList(
                            widget.id);
                  
                      
                      if (chatRoomId == null) {
                        chatRoomId = await createChatroom(
                          user.uid,
                          userDetails['first_name'],
                          widget.id,
                          widget.name
                        );
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chat(
                                    chatRoomId: chatRoomId,
                                    name:widget.name,
                                    
                                  )));
                    },
                 child: Text("Chats"))
          ]),
        ));
  }
}
