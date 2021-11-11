import 'package:flutter/material.dart';
import 'package:mpj_vendor/screens/vendor_form_2.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class VendorFormS1 extends StatefulWidget {
  const VendorFormS1({Key? key}) : super(key: key);

  @override
  State<VendorFormS1> createState() => _VendorFormS1State();
}

class _VendorFormS1State extends State<VendorFormS1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: LinearGradient(colors: [
          Colors.purple.shade400,
          Colors.pink.shade300,
          // Colors.purple.shade200
        ]),
        title: const Text('Vendor Management'),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Align(
                    child: const Text(
                      'Customer Form',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                Container(
                  child: Align(
                    child: const Text(
                      'Step 1 of 3',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 400,
                  child: Form(
                    // key: this._formKey,
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                            keyboardType: TextInputType
                                .emailAddress, // Use email input type for emails.
                            decoration: const InputDecoration(
                                // hintText: 'John Doe',
                                labelText: 'Customer Name')),
                        TextFormField(
                            keyboardType: TextInputType
                                .number, // Use secure text for passwords.
                            decoration: const InputDecoration(

                                // hintText: 'Password',
                                labelText: 'Contact no.')),
                        TextFormField(
                            keyboardType: TextInputType
                                .emailAddress, // Use secure text for passwords.
                            decoration: const InputDecoration(

                                // hintText: 'Password',
                                labelText: 'Email')),
                        Container(
                          width: size.width * 0.83,
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       '\tMessage',
                              //       style: TextStyle(fontSize: 18),
                              //     ),
                              //     Text(
                              //       ' *',
                              //       style: TextStyle(
                              //           fontSize: 18, color: Colors.red[600]),
                              //     ),
                              //   ],
                              // ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                // width: size.width * 0.83,
                                child: TextFormField(
                                  // validator: validateStudentQuery,
                                  // onSaved: (String val) {
                                  //   // _query = val;
                                  // },
                                  // controller: queryController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        // borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    hintText: 'Customer Address',
                                  ),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          child: ElevatedButton(
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VendorFormS2()));
                            },
                            // color: Colors.blue,
                          ),
                          margin: const EdgeInsets.only(top: 20.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.all(15),
      //         height: size.height * 0.1,
      //         child: const Text(
      //           'Advertise with Us',
      //           style: TextStyle(
      //               // color: Colors.amber[900],
      //               fontSize: 50,
      //               fontWeight: FontWeight.bold
      //               // fontStyle: FontStyle.italic,
      //               ),
      //         ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.all(25),
      //         child: Form(
      //           child: Column(
      //             children: [
      //               Column(
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       const Text(
      //                         '\tName',
      //                         style: TextStyle(fontSize: 18),
      //                       ),
      //                       Text(
      //                         ' *',
      //                         style: TextStyle(
      //                             fontSize: 18, color: Colors.red[600]),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Container(
      //                         width: size.width * 0.38,
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(
      //                               top: 10.0,
      //                               bottom: 6.0,
      //                               left: 1.0,
      //                               right: 1.0),
      //                           child: TextFormField(
      //                             autofocus: false,
      //                             // focusNode: myFocusNodeFirstName,
      //                             // controller: firstNameController,
      //                             keyboardType: TextInputType.emailAddress,

      //                             style: TextStyle(
      //                                 fontSize: 16.0, color: Colors.black),
      //                             decoration: InputDecoration(
      //                               border: OutlineInputBorder(
      //                                   // borderRadius: BorderRadius.circular(10.0),
      //                                   ),
      //                               hintText: 'First',
      //                             ),
      //                             // validator: validateFirstName,
      //                             // onSaved: (String val) {
      //                             //   // _stFirstName = val;
      //                             // },
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         margin: EdgeInsets.only(left: 10),
      //                         width: size.width * 0.4,
      //                         child: Padding(
      //                           padding: EdgeInsets.only(
      //                               top: 10.0,
      //                               bottom: 6.0,
      //                               left: 1.0,
      //                               right: 1.0),
      //                           child: TextFormField(
      //                             autofocus: false,
      //                             // focusNode: myFocusNodeEmail,
      //                             // controller: studentNumberController,
      //                             keyboardType: TextInputType.emailAddress,
      //                             style: TextStyle(
      //                                 fontSize: 16.0, color: Colors.black),
      //                             decoration: InputDecoration(
      //                               border: OutlineInputBorder(),
      //                               hintText: 'Last',
      //                             ),
      //                             // validator: validateStudentNumber,
      //                             // onSaved: (String val) {
      //                             //   // _stNumber = val;
      //                             // },
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),

      //               ///////////////////------------Email Container -----------///////////////////
      //               Container(
      //                 margin: EdgeInsets.symmetric(vertical: 5),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         const Text(
      //                           '\tEmail',
      //                           style: TextStyle(fontSize: 18),
      //                         ),
      //                         Text(
      //                           ' *',
      //                           style: TextStyle(
      //                               fontSize: 18, color: Colors.red[600]),
      //                         ),
      //                       ],
      //                     ),
      //                     Container(
      //                       width: size.width * 0.83,
      //                       child: Padding(
      //                         padding: EdgeInsets.only(
      //                             top: 10.0,
      //                             bottom: 6.0,
      //                             // left: 1.0,
      //                             right: 10.0),
      //                         child: TextFormField(
      //                           autofocus: false,
      //                           // focusNode: myFocusNodeEmail,
      //                           // controller: emailController,
      //                           keyboardType: TextInputType.emailAddress,
      //                           style: TextStyle(
      //                               fontSize: 16.0, color: Colors.black),
      //                           decoration: InputDecoration(
      //                             border: OutlineInputBorder(),
      //                             hintText: 'Email',
      //                           ),
      //                           // validator: validateEmail,
      //                           // onSaved: (String val) {
      //                           //   // _stEmail = val;
      //                           // },
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),

      //               /////////////--------------Subject Container-----------------////////////////
      // Container(
      //   margin: EdgeInsets.symmetric(vertical: 5),
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Text(
      //             '\tSubject',
      //             style: TextStyle(fontSize: 18),
      //           ),
      //           Text(
      //             ' *',
      //             style: TextStyle(
      //                 fontSize: 18, color: Colors.red[600]),
      //           ),
      //         ],
      //       ),
      //       Container(
      //         width: size.width * 0.83,
      //         child: Padding(
      //           padding: EdgeInsets.only(
      //               top: 10.0,
      //               bottom: 6.0,
      //               // left: 1.0,
      //               right: 10.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //                 // borderRadius: BorderRadius.circular(10),
      //                 border: Border.all(width: 1)
      //                 // color: Colors.white,
      //                 ),
      //             child: DropdownButtonHideUnderline(
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 14),
      //                 child: DropdownButton(
      //                   // value: _value,
      //                   isExpanded: true,

      //                   // dropdownColor: Colors.amber,
      //                   items: [
      //                     DropdownMenuItem(
      //                       child: Text('Advertising Inquiry'),
      //                       value: 1,
      //                     ),
      //                     DropdownMenuItem(
      //                       child: Text('Partnership'),
      //                       value: 2,
      //                     ),
      //                   ],

      //                   onChanged: (value) {
      //                     setState(() {
      //                       // _value = value;
      //                     });
      //                   },
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      //               //////////////-------------------Message Container-------------------/////////////////////
      // Container(
      //   width: size.width * 0.83,
      //   margin: EdgeInsets.only(top: 5),
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Text(
      //             '\tMessage',
      //             style: TextStyle(fontSize: 18),
      //           ),
      //           Text(
      //             ' *',
      //             style: TextStyle(
      //                 fontSize: 18, color: Colors.red[600]),
      //           ),
      //         ],
      //       ),
      //       Container(
      //         width: size.width * 0.83,
      //         child: Padding(
      //           padding: EdgeInsets.only(
      //               top: 10.0,
      //               bottom: 6.0,
      //               // left: 1.0,
      //               right: 10.0),
      //           child: TextFormField(
      //             // validator: validateStudentQuery,
      //             // onSaved: (String val) {
      //             //   // _query = val;
      //             // },
      //             // controller: queryController,
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(
      //                   // borderRadius: BorderRadius.circular(10.0),
      //                   ),
      //               hintText: 'Type here...',
      //             ),
      //             keyboardType: TextInputType.text,
      //             style: TextStyle(
      //                 fontSize: 16.0, color: Colors.black),
      //             maxLines: 4,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      //               Container(
      //                 // color: Colors.cyan,
      //                 margin: EdgeInsets.all(10),
      //                 child: Align(
      //                   alignment: Alignment.centerLeft,
      //                   child: RaisedButton(
      //                     padding: EdgeInsets.symmetric(
      //                         horizontal: 50, vertical: 10),
      //                     color: Colors.cyan,
      //                     onPressed: () {},
      //                     child: Text(
      //                       'Submit',
      //                       style: TextStyle(color: Colors.white, fontSize: 20),
      //                     ),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
