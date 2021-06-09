import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/profile.dart';

class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  List<QueryDocumentSnapshot> posts = [];
  getposts() async {
    FirebaseFirestore.instance
        .collectionGroup('posts')
        .where('topic', isEqualTo: 'covid')
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextFormField(
                    cursorColor: Colors.white,
                    // style: GoogleFonts.notoSans(
                    //     fontSize: MediaQuery.of(context).size.height / 45,
                    //     color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, size: 30),
                          color: Colors.white,
                        ),
                        // prefixIcon: IconButton(
                        //   onPressed: () {
                        //     // Navigator.pushReplacement(
                        //     //   context,
                        //     //   MaterialPageRoute(builder: (context) => MyApp()),
                        //     // );
                        //   },
                        //   icon: Icon(Icons.arrow_back_ios, size: 30),
                        //   color: Colors.white,
                        // ),
                        hintText: 'Search here...',
                        // hintStyle: GoogleFonts.notoSans(
                        //     fontSize: MediaQuery.of(context).size.height / 45,
                        //     color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white)),
                    //onChanged: onItemChanged,
                  ),),
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(children: [
          posts!=null&& posts.length!=0?ListView.builder(physics: ScrollPhysics(),shrinkWrap: true,itemCount: posts.length,itemBuilder: (BuildContext context,int index){
            return Column(children:[
              FlatButton(onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>profile(id:posts[index].data()['user_id'],name:posts[index].data()['username'])));
              },child: Text(posts[index].data()['username'])),
              Text(posts[index].data()['name']),
            ]);
          },):Container(),

        ]),
      ),
    ));
  }
}
