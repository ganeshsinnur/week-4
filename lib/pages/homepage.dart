import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prego/pages/order_page.dart';

import '../api_related/apis.dart';
import '../model/item_model.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key,});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  List<Item> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xFF656565),
            Color(0xFF4F4A4A),
            Colors.black
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Electronics",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: APIs.getItems(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      itemList = data?.map((e) => Item.fromJson(e.data())).toList() ?? [];
                      log("$itemList");
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        itemCount: itemList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.transparent,
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => OrderPage(itemName: itemList[index].item, itemPrice: itemList[index].price),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0); // Start from the right
                                      const end = Offset.zero; // End at the current position
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                                log("button of ${itemList[index].item} tapped");
                              },
                              title: Text(
                                itemList[index].item,
                                style: const TextStyle(color: Color(0xFFFFF951), fontSize: 20, fontWeight: FontWeight.w600,),),
                              subtitle: Text(
                                "\$ ${itemList[index].price.toString()}.00/-",
                                style: const TextStyle(color: Colors.white70, fontSize: 16,),),
                              trailing: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle,),
                                  child: const Icon(Icons.add, color: Colors.white70,),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
