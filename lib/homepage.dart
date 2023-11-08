import 'package:flutter/material.dart';
import 'package:myproject/loginpage.dart';
import 'package:myproject/prefManager/prefmanager.dart';
import 'package:myproject/ui/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "Other",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Icon(
                  Icons.login,
                  size: 20,
                ),
              ),
            ],
          ),
          actions: const [
            Icon(Icons.bookmark, size: 20),
            Text("Offer", style: TextStyle(fontSize: 18)),
          ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Loginpage()));
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            ListTile(
                title: const Text("Log out"),
                onTap: () async {
                  await PrefManager.clearToken();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()));
                })
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Column(
              children: [
                const Text(
                  "We are now deliverying food\ngroceries and other essentials.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  "    Food & Genie service(Mon-Sat)-6.00am to\n9.00pm.Groceries & Meat (Mon-Sat)-6.00am to\n6.00pm.Dairy (Mon-Sat)-6.00am to 6.00pm\n(Sun)-6.00am to 12.00 pm",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 150,
                        width: 350,
                        color: const Color.fromARGB(223, 255, 119, 0),
                        child: const Text(
                          "    Restaurants",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 30,
                        left: 20,
                        child: Text("No-contact delivery available")),
                    const Positioned(
                      top: 5,
                      left: 210,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/images/dish.jpg"),
                      ),
                    ),
                    const Positioned(
                      top: 120,
                      left: 20,
                      child: Text("View all"),
                    ),
                    const Positioned(
                      top: 120,
                      left: 70,
                      child: Icon(
                        Icons.login,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 120,
                            width: 90,
                            color: Colors.black,
                            child: const Image(
                              image: AssetImage("assets/images/dish1.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Container(
                            height: 30,
                            width: 90,
                            color: Colors.red,
                            child: const Center(
                              child: Text(
                                "Genei",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Anything you need\ndelivered",
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 120,
                              width: 90,
                              color: Colors.black,
                              child: const Image(
                                image: AssetImage("assets/images/dish3.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Container(
                              height: 30,
                              width: 90,
                              color: Colors.red,
                              child: const Center(
                                child: Text(
                                  "Grocery",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text("", style: TextStyle(fontSize: 8)),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Essentials delivered\nin 2 hours.",
                    style: TextStyle(fontSize: 8),
                  )
                ]),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 120,
                                width: 90,
                                color: Colors.black,
                                child: const Image(
                                  image: AssetImage("assets/images/dish.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Container(
                                height: 30,
                                width: 90,
                                color: Colors.red,
                                child: const Center(
                                  child: Text(
                                    "Meat",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Fresh meat\ndelivered safe",
                        style: TextStyle(fontSize: 8)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(Icons.thumb_up),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Top Picks For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 110,
                            color: Colors.red,
                            child: Image.asset(
                              "assets/images/shop1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            "Murugans Idli\nShop",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "42 mins",
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 1),
            Container(
              height: 150,
              width: 350,
              color: Colors.black,
              child: const Image(
                image: AssetImage("assets/images/offer.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/food.jpg'),
                          ),
                          Text(
                            "South\nIndian",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(Icons.badge),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      " In the spotlight!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Explore sponered partner brand"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              width: 800,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                children: List.generate(4, (index) {
                  return Container(
                    height: 110,
                    width: 250,
                    color: Colors.red,
                    child: Image.asset(
                      "assets/images/dish4.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
            //Container(
            //width: 110,
            //color: Colors.red,
            //child: Image.asset(
            //"assets/images/dish4.jpg",
            // fit: BoxFit.cover,
            // ),

            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Popular Brands",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Most ordered from around your locality",
                      style:
                          TextStyle(color: Color.fromARGB(255, 158, 153, 153))),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/shop3.jpg'),
                          ),
                          Text(
                            "Sangeetha",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("42 Min"),
                        ],
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_down),
                  Text("SWIGGY's KEY MEASURES TO ENSURE SAFETY"),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 150,
                  width: 350,
                  color: const Color.fromARGB(255, 245, 179, 80),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20.0),
                    child: Text(
                      "No-contact Delivery",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                left: 20,
                child: Text(
                    "Have your order dropped of at\nyour door or gate added\nsafety"),
              ),
              const Positioned(
                  top: 120,
                  left: 40,
                  child: Text(
                    "Known More",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(253, 255, 94, 0)),
                  )),
              const Positioned(
                top: 10,
                left: 210,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/shop4.jpg"),
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.gamepad),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Best in Safety",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Text("SEE ALL"),
                  ),
                  Icon(Icons.arrow_circle_right),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Restaurants with best safety standards",
                    style: TextStyle(color: Color.fromARGB(255, 158, 153, 153)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 110,
                                color: Colors.red,
                                child: Image.asset(
                                  "assets/images/dish4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ]),
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(Icons.gamepad),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Top Offers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 170),
                    child: Text("SEE ALL"),
                  ),
                  Icon(Icons.arrow_circle_right),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Get 20 - 50% Off",
                    style: TextStyle(color: Color.fromARGB(255, 158, 153, 153)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 110,
                                color: Colors.red,
                                child: Image.asset(
                                  "assets/images/dish4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ]),
                      );
                    })),
            const SizedBox(height: 10),
            Stack(children: [
              Container(
                height: 150,
                width: 370,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Genieeee",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Positioned(
                  top: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Anything you need, delivered.\nPick up, Drop or Buy anything,\nfrom anywhere in your city "),
                  )),
              Positioned(
                top: 20,
                right: 10,
                child: Container(
                  height: 120,
                  width: 150,
                  color: Colors.white,
                  child: const Image(
                      image: AssetImage('assets/images/scooter.jpg')),
                ),
              ),
            ]),
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Buy\nAnything",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                        top: 80,
                        left: 20,
                        child:
                            Text("Stationery\nMedicine\nGrocery\n& More123.")),
                    Positioned(
                      top: 130,
                      left: 120,
                      child: Container(
                        height: 70,
                        width: 40,
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/delivery1.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Pick up\n& Drop",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                        top: 80,
                        left: 20,
                        child:
                            Text("Lunchbox\nCharger\nDocuments\n& Clothes.")),
                    Positioned(
                      top: 120,
                      left: 120,
                      child: Container(
                        height: 70,
                        width: 40,
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/delivery2.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Popular Catogories",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 65,
              color: Colors.red,
              child: Image.asset(
                "assets/images/shop1.jpg",
                fit: BoxFit.cover,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
