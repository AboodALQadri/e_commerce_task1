import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Uzay Shop'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/shop.png'),
            ),
          ],
        ),
      ),
    );
  }
}
