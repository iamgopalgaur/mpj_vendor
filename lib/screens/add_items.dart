import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage _storage = FirebaseStorage.instance;
FirebaseAuth mAuth = FirebaseAuth.instance;

class JewelleryItems extends StatefulWidget {
  const JewelleryItems({Key? key}) : super(key: key);
  @override
  JewelleryItemsState createState() => JewelleryItemsState();
}

class JewelleryItemsState extends State<JewelleryItems> {
  // List<Map<String, dynamic>> vendors = [];
  TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onSubmitted(String value) {
    setState(
      () => _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text('You wrote $value!'),
        ),
      ),
    );
  }

  final heading = TextEditingController();
  final subheading = TextEditingController();
  final address = TextEditingController();

  final remarks = TextEditingController();

  // Future<void> getVendors() async {
  //   await firestore
  //       .collection("JewelleryItems")
  //       .where("vendor", isEqualTo: 1)
  //       .get()
  //       .then(
  //     (QuerySnapshot querySnapshotVendor) {
  //       querySnapshotVendor.docs.forEach(
  //         (element) async {
  //           print((element.data() as dynamic)['vendorID']);
  //           print(element.id);
  //           if (element.data() != null) {
  //             setState(
  //               () {
  //                 // vendors.add(
  //                 //   {
  //                 //     'heading': (element.data() as dynamic)['heading'],
  //                 //     'subheading': (element.data() as dynamic)['subheading'],
  //                 //     'imageURL': (element.data() as dynamic)['imageURL'],
  //                 //   },
  //                 // );
  //               },
  //             );
  //           }
  //         },
  //       );
  //     },
  //   );

  //   // print(vendors);
  // }

  var _image;
  _imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();

    // if (uid == null) {
    //   getUser();
    // }
    // getVendors();
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        width: 125.0,
        height: 50.0,
        child: RawMaterialButton(
          shape: const CircleBorder(),
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.blue,
              ),
              Text('Add Item')
            ],
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(58, 66, 86, 1.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 30.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Click Image',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.purple,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Colors.white,
                                          child: _image != null
                                              ? ClipRRect(
                                                  // borderRadius:
                                                  //     BorderRadius.circular(50),
                                                  child: Image.file(
                                                    _image,
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  width: 100,
                                                  height: 100,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: heading,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: "Heading",
                                labelStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Heading cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: subheading,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: "Subheading",
                                labelStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.purple),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val!.length == 0) {
                                  return "Decription cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // TextFormField(
                            //   controller: remarks,
                            //   decoration: InputDecoration(
                            //     labelText: "Remarks",
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25.0),
                            //       borderSide: BorderSide(),
                            //     ),
                            //     //fillColor: Colors.green
                            //   ),
                            //   validator: (val) {
                            //     if (val!.length == 0) {
                            //       return "Remarks cannot be empty";
                            //     } else {
                            //       return null;
                            //     }
                            //   },
                            //   keyboardType: TextInputType.name,
                            //   style: const TextStyle(
                            //     fontFamily: "Poppins",
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // TextFormField(
                            //   controller: number,
                            //   decoration: InputDecoration(
                            //     labelText: "Estimated Weight",
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25.0),
                            //       borderSide: BorderSide(),
                            //     ),
                            //     //fillColor: Colors.green
                            //   ),
                            //   validator: (val) {
                            //     if (val!.length == 0) {
                            //       return "Invalid Weight";
                            //     } else {
                            //       return null;
                            //     }
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   style: const TextStyle(
                            //     fontFamily: "Poppins",
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 30,
                            // ),

                            TextButton(
                              // color: Colors.lightBlueAccent,
                              // minWidth: double.infinity,
                              // height: 50.0,
                              onPressed: () async {
                                // late var location;
                                // FirebaseStorage storage =
                                //     FirebaseStorage.instance;
                                // Reference ref = storage.ref().child(
                                //     "image1" + DateTime.now().toString());
                                // UploadTask uploadTask = ref.putFile(_image);
                                // uploadTask.then((res) {
                                //   location = res.ref.getDownloadURL();
                                // });

                                await FirebaseFirestore.instance
                                    .collection('JewelleryItems')
                                    .add({
                                  'heading': heading.text,
                                  'subheading': subheading.text,
                                  // 'imageURL': location.toString(),
                                  'imageUrl':
                                      'https://firebasestorage.googleapis.com/v0/b/mpj-vendor.appspot.com/o/image12021-11-10%2014%3A32%3A24.675394?alt=media&token=60786720-31ef-40a2-8a0b-f58a483ff685',
                                }).then((value) {});

                                heading.clear();
                                subheading.clear();
                                setState(() {
                                  _image = null;
                                });
                                // getVendors();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      key: _scaffoldKey,

      body: StreamBuilder<QuerySnapshot>(
        // <2> Pass `Stream<QuerySnapshot>` to stream
        stream:
            FirebaseFirestore.instance.collection('JewelleryItems').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: documents
                  .map((doc) => Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              child: Image.network(
                                'http://shop.manepally.com/images/home/category/HM-1.jpg',
                                height: 90,
                                width: 100,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 130,
                                  child: ListTile(
                                    title: Text(doc['heading']),
                                    subtitle: Text(doc['subheading']),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.edit),
                                    Icon(Icons.delete),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text('It is an Error!');
          }
          return SizedBox();
        },
      ),
      // resizeToAvoidBottomPadding: true,
    );
  }
}
