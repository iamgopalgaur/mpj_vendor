import 'package:flutter/material.dart';
import 'package:mpj_vendor/anim/fade_animation.dart';
import 'package:mpj_vendor/screens/otp.dart';
import 'package:mpj_vendor/utilities/custom_clipper.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = Colors.black;
    Color color2 = Colors.purple.shade300;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: LoginCustomClipper(),
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: const EdgeInsets.only(bottom: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        child: Image.asset(
                                            'assets/images/logo.jpg'),
                                        height: 40),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Center(
                                      child: Text(
                                        "MPJ Vendor",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [color1, color2],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: FadeAnimation(
                1.6,
                Container(
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            FadeAnimation(
              1.6,
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    focusColor: Colors.purple,
                    fillColor: Colors.purple,
                    hintText: '10 digit Mobile no.',
                    prefixIcon: const Icon(Icons.phone, color: Colors.purple),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.purple)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeAnimation(
              2,
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PinCodeVerificationScreen('8209203870'),
                    ),
                  );
                },
                // Neumorphic(
                //   child:
                //   //  NeumorphicButton(
                //       // margin: EdgeInsets.only(top: 12),
                //       // onPressed: () {
                //         // Navigator.of(context)
                //         //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //         //   return
                //       // }),
                // ),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade300,
                        Colors.pink.shade300,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
