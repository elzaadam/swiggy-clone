import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/loginpage.dart';
import 'package:myproject/prefManager/prefmanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  late String cState;
  //
  @override
  void initState() {
    fetcher();
    super.initState();
  }

  void fetcher() async {
    var token = await PrefManager.getToken();

    if (token != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginpage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,

                  child: Image.asset(
                    'assets/images/delivery1.jpg',
                    fit: BoxFit.contain,
                  ),
                  // child: Icon(
                  //   Icons.contacts,
                  //   color: Color(0xff4e4376),
                  //   size: 80,
                  // )
                ),
                const SizedBox(
                  height: 2,
                ),
                // const Center(
                //   child: SizedBox(
                //       child: Text(
                //     "Site Guide",
                //     style: TextStyle(
                //         color: Color(0xff4e4376),
                //         fontSize: 40,
                //         fontWeight: FontWeight.bold),
                //   )),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
