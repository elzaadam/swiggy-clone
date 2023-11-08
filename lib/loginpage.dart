import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/homescreen.dart';
import 'package:myproject/registration.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool? checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage("assets/images/tig4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  "PARAMBIKULAM\nTIGER RESERVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Positioned(
              left: 100,
              top: 500,
              child: Text("Please Login to Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const Positioned(
                top: 550,
                left: 50,
                child: Text(
                  "Username",
                  style: TextStyle(color: Colors.white),
                )),
            Positioned(
              top: 570,
              left: 50,
              child: Container(
                  color: Colors.black,
                  height: 50,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: TextFormField(
                      controller: usernamecontroller,
                      decoration: const InputDecoration(
                        hintText: "Type here",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            const Positioned(
                top: 650,
                left: 50,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white),
                )),
            Positioned(
              top: 670,
              left: 50,
              child: Container(
                  color: Colors.black,
                  height: 50,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: TextFormField(
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                        hintText: "Type here",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            Positioned(
              top: 720,
              left: 50,
              child: Row(
                children: [
                  const Text("Is Indian?",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 156, 132, 130),
                    // title: const Text("Indian"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    // controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 770,
              left: 150,
              child: MaterialButton(
                color: Colors.yellow,
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(VerifyPassword(
                      name: usernamecontroller.text,
                      password: passwordcontroller.text,
                      isIndian: checkedValue));
                },
                child: BlocConsumer<MainBloc, LoginStates>(
                    builder: (context, state) {
                  if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("Login");
                  }
                }, listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomeScreen()));
                  }
                }),
              ),
            ),
            Positioned(
              top: 820,
              left: 165,
              child: InkWell(
                child: const Text(
                  "Sign up ?",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registration()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
