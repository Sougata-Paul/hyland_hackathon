import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class DiseaseChecker extends StatefulWidget {
  @override
  _DiseaseCheckerState createState() => _DiseaseCheckerState();
}

class _DiseaseCheckerState extends State<DiseaseChecker> {
  List<int> selectedItems = [];
  List<DropdownMenuItem<dynamic>> items = [];
  QuerySnapshot diseases;
  List<String> symptoms = [];
  bool vis = false;
  List<String> myDiseases = [];
  getDiseaseSymptoms() async {
    diseases = await FirebaseFirestore.instance.collection('disease').get();
    for (int i = 0; i < diseases.size; i++) {
      for (int j = 0; j < diseases.docs[i].data()['symptoms'].length; j++) {
        if (!symptoms.contains(diseases.docs[i].data()['symptoms'][j])) {
          symptoms.add(diseases.docs[i].data()['symptoms'][j]);
          items.add(new DropdownMenuItem(
            child: Text(diseases.docs[i].data()['symptoms'][j]),
            value: diseases.docs[i].data()['symptoms'][j],
          ));
        }
      }
    }
    setState(() {
      diseases = diseases;
      items = items;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiseaseSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    return diseases != null
        ? Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(),
                  SearchableDropdown.multiple(
                    items: items,
                    selectedItems: selectedItems,
                    hint: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Select any"),
                    ),
                    searchHint: "Select any",
                    onChanged: (value) {
                      setState(() {
                        selectedItems = value;
                      });
                      print(selectedItems.toString());
                    },
                    closeButton: (selectedItems) {
                      return (selectedItems.isNotEmpty
                          ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
                          : "Save without selection");
                    },
                    isExpanded: true,
                  ),
                  RaisedButton(
                    onPressed: () {
                      myDiseases = [];
                      for (int i = 0; i < selectedItems.length; i++) {
                        for (int j = 0; j < diseases.size; j++) {
                          var s = symptoms[selectedItems[i]];
                          if (diseases.docs[j].data()['symptoms'].contains(s)) {
                            String d = diseases.docs[j]
                                .data()['disease_name']
                                .toString();
                            if (!myDiseases.contains(d)) {
                              setState(() {
                                myDiseases.add(d);
                              });
                            }
                          }
                        }
                      }
                      setState(() {
                        vis = true;
                      });
                    },
                    child: Text('Check Disease'),
                  ),
                  Visibility(visible: vis, child: Text(myDiseases.join('\n')))
                ],
              )),
            ),
          )
        : Scaffold(
            body: Text('Loading...'),
          );
  }
}
