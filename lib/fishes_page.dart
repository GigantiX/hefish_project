import 'package:flutter/material.dart';

class FishesPage extends StatefulWidget {
  const FishesPage({Key? key}) : super(key: key);

  @override
  State<FishesPage> createState() => _FishesPageState();
}

class _FishesPageState extends State<FishesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fishes Page'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text('Fishes Page Works'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
