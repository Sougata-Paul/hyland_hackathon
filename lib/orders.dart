import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';
import 'package:hyland_hackathon/viewcart.dart';

class orders extends StatefulWidget {
  @override
  _ordersState createState() => _ordersState();
}

class _ordersState extends State<orders> {
  QuerySnapshot product;
  getproducts(String str) async {
    product = await firestore
        .collection("orders")
        .where("product_type", isEqualTo: str)
        .get();
    setState(() {
      product = product;
    });
  }

  String dropdownValue = 'oxygen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValue = newValue;
              getproducts(dropdownValue);
            });
          },
          items: <String>['oxygen', 'blood', 'food']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            product != null && product.size != 0
                ? ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product.size,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Text(product.docs[index].data()['product_name']),
                        Text(product.docs[index].data()['description']),
                        FlatButton(onPressed: ()async {
                          var cart=userDetails['cart'];
                          if(!cart.contains(product.docs[index].id))
                          {
                          cart.add(product.docs[index].id);
                          await firestore.collection('users').doc(user.uid).update({
                            "cart":cart
                          });
                          }
                        }, child: Text("Add To Cart")),
                      ]);
                    },
                  )
                : Container(),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcart() ));
                }, child: Text("View Cart")),
          ],
        )),
      ),
    );
  }
}
