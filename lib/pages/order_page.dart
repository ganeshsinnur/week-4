import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String itemName;
  final int itemPrice;

  const OrderPage({super.key, required this.itemName, required this.itemPrice});

  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF656565),
                Color(0xFF4F4A4A),
                Colors.black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(widget.itemName,
                      style: const TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5)),
                ),
                const Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: BeveledRectangleBorder(),
                  child: ListTile(
                    title: Text("Product Id",
                        style: TextStyle(color: Colors.white60, fontSize: 23)),
                    trailing: Text(
                      "&ndksu#vy",
                      style: TextStyle(color: Colors.white60, fontSize: 20),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: const BeveledRectangleBorder(),
                  child: ListTile(
                    title: const Text("Price",
                        style: TextStyle(color: Colors.white60, fontSize: 23)),
                    trailing: Text(widget.itemPrice.toString(),
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50,top:5),
              color: Colors.black.withOpacity(0.5),
              // Optional: Add a semi-transparent background
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  //foregroundColor: Colors.white,
                  backgroundColor: Colors.yellow, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  minimumSize: const Size(
                      double.infinity, 50), // Full width button
                ),
                child: const Text('Pre Order',
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
