import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        "Usuário Logado",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
