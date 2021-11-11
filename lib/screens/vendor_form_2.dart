import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class VendorFormS2 extends StatefulWidget {
  const VendorFormS2({Key? key}) : super(key: key);

  @override
  State<VendorFormS2> createState() => _VendorFormS2State();
}

class _VendorFormS2State extends State<VendorFormS2> {
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
                    padding: const EdgeInsets.only(top: 30, left: 10),
                  ),
                  Container(
                    child: Align(
                      child: const Text(
                        'Step 2 of 3',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    padding: const EdgeInsets.only(top: 30, left: 10),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 500,
                    child: Form(
                      // key: this._formKey,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\tProduct',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      ' *',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red[600]),
                                    ),
                                  ],
                                ),
                                Container(
                                  // width: size.width * 0.83,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 6.0,
                                      // left: 1.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 1)
                                          // color: Colors.white,
                                          ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14),
                                          child: DropdownButton(
                                            // value: _value,
                                            isExpanded: true,

                                            // dropdownColor: Colors.amber,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text('Chain'),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text('Ring'),
                                                value: 2,
                                              ),
                                            ],

                                            onChanged: (value) {
                                              setState(() {
                                                // _value = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                              keyboardType: TextInputType
                                  .emailAddress, // Use email input type for emails.
                              decoration: const InputDecoration(
                                  // hintText: 'John Doe',
                                  labelText: 'Length/ Size')),
                          TextFormField(
                              keyboardType: TextInputType
                                  .number, // Use secure text for passwords.
                              decoration: const InputDecoration(

                                  // hintText: 'Password',
                                  labelText: 'Approx Weight')),
                          TextFormField(
                              keyboardType: TextInputType
                                  .emailAddress, // Use secure text for passwords.
                              decoration: const InputDecoration(

                                  // hintText: 'Password',
                                  labelText: 'V.A.')),
                          Container(
                            width: size.width,
                            child: ElevatedButton(
                              child: const Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
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
        ));
  }
}
