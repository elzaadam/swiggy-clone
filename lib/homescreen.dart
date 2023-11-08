import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myproject/bloc/bottombar.dart';
import 'package:myproject/homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Welcome",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.yellow),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.blue,
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Column1"),
            InkWell(
              child: Container(
                height: 100,
                width: 75,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Text("C1"),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            Container(
                color: Colors.white,
                height: 50,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                )),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              child: Container(
                height: 100,
                width: 75,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25),
                  child: Text("C2"),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Bottombar()));
              },
              //Bottombar
            ),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 100,
                            width: 75,
                            color: Colors.red,
                            child: const Text("Container1"),
                          ),
                        ),
                        const Text("Container1")
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 100,
                            width: 75,
                            color: Colors.yellow,
                            child: const Text("Container2"),
                          ),
                        ),
                        const Text("Container2"),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 75,
                          color: Colors.yellow,
                          child: const Text("Container3"),
                        ),
                        const Text("Container3"),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 75,
                          color: Colors.red,
                          child: const Text("Container4"),
                        ),
                        const Text("Container4"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Text("dgfhfhxddhfhc\nfchhfxhx\nvbvbv"),
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 100,
                  color: Colors.yellow,
                ),
                const Positioned(top: 15, left: 8, child: Icon(Icons.abc)),
                const Positioned(
                  top: 19,
                  left: 10,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
                height: 100,
                width: 110,
                child: Image.asset("assets/images/food.jpg")),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/food.jpg'),
            ),
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/food2.jpg"),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 50,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.red,
                          child: Text(index.toString())),
                    );
                  }),
            ),
            SizedBox(
              height: 150,
              child: GridView.count(
                crossAxisCount: 5,
                crossAxisSpacing: 14,
                mainAxisSpacing: 20,
                children: List.generate(15, (index) {
                  return Container(height: 30, width: 50, color: Colors.blue);
                }),
              ),
            ),
            TextField(
                controller: dateController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.fromSwatch(
                            primarySwatch: Colors.red,
                            // primaryColorDark: Colors.teal,
                            accentColor: Colors.yellow,
                          ),
                          dialogBackgroundColor: Colors.white,
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat("yyyy - MM - dd").format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  } else {
                    print("Date not selected");
                  }
                })
          ],
        ),
      ),
    );
  }
}
