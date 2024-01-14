import 'package:flutter/material.dart';

import 'functions/logout.dart';

class TestHome extends StatefulWidget {
  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color(0xFF1F67A9),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.30,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.person, color: Colors.white),
                              onPressed: () {
                                logout(context);
                              },
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.logout, color: Colors.white),
                              onPressed: () {
                                logout(context);
                              },
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi azri, welcome back",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Last Login: 7 august 2023",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                                letterSpacing: 1),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: height * 0.70,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
