import 'package:flutter/material.dart';
class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  Future<bool> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(
                child: Text(
                  'Esta es la Segunda Pantalla',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
          }
        },
      ),
    );
  }
}