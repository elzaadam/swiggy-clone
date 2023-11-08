import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';
import 'package:myproject/homepage.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController emailidcontroller = TextEditingController();

  String dropdownvalue = 'Kottayam';

  var items = [
    'Kottayam',
    'Ernakulam',
    'Malappuram',
    'Wayanad',
    'Alappuzha',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Username:",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                  color: Colors.white,
                  height: 40,
                  width: 350,
                  child: TextFormField(
                    controller: username_controller,
                    decoration: const InputDecoration(
                      hintText: "Type here",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text("Password:", style: TextStyle(fontSize: 20)),
              const SizedBox(width: 20),
              Container(
                color: Colors.white,
                height: 40,
                width: 350,
                child: TextFormField(
                  controller: password_controller,
                  decoration: const InputDecoration(
                    hintText: "Type here",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Address:", style: TextStyle(fontSize: 20)),
              const SizedBox(width: 20),
              Container(
                color: Colors.white,
                height: 40,
                width: 350,
                child: TextFormField(
                  controller: addresscontroller,
                  decoration: const InputDecoration(
                    hintText: "Type here",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Email id:", style: TextStyle(fontSize: 20)),
              const SizedBox(width: 20),
              Container(
                color: Colors.white,
                height: 40,
                width: 350,
                child: TextFormField(
                  controller: emailidcontroller,
                  decoration: const InputDecoration(
                    hintText: "Type here",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "District",
                style: TextStyle(fontSize: 20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.yellow,
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(RegistrationEvent(
                      name: username_controller.text,
                      password: password_controller.text,
                      address: addresscontroller.text,
                      emailid: emailidcontroller.text,
                      district: dropdownvalue));
                },
                child: BlocConsumer<MainBloc, LoginStates>(
                    builder: (context, state) {
                  if (state is Registering) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("Registered");
                  }
                }, listener: (context, state) {
                  if (state is RegistrationSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Error'),
                          content: Text('Try Again'),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
