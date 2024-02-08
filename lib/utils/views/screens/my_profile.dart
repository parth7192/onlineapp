import 'package:flutter/material.dart';

class my_profile extends StatefulWidget {
  const my_profile({super.key});

  @override
  State<my_profile> createState() => _cart_productState();
}

class _cart_productState extends State<my_profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Profile"),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(),
                  color: Colors.lightBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
