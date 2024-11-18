import 'package:flutter/material.dart';

class VendorServiceViewScreen extends StatelessWidget {
  const VendorServiceViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Service screen"),
      ),
      body: Center(
        child: Text(w1.toString()),
      ),
    );
  }
}
