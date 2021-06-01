import 'package:app_demo/pages/home.page.dart';
import 'package:app_demo/services/login_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildTextFormFieldLogin(),
            buildTextFormFieldSenha(),
            Divider(
              color: Colors.grey[200],
              height: 40,
            ),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  buildTextFormFieldLogin() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        labelText: "Login",
        labelStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20,
        ),
      ),
      controller: loginController,
    );
  }

  buildTextFormFieldSenha() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(fontSize: 18),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20,
        ),
      ),
      controller: senhaController,
    );
  }

  buildButton(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: () {
        _clickButton(context);
      },
      child: Text(
        "Entrar",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      color: Colors.amber,
    );
  }

  Future<void> _clickButton(BuildContext context) async {
    String login = loginController.text;
    String senha = senhaController.text;

    print("login: $login senha: $senha");

    var response = await LoginService.login(login, senha);

    if (response)
      _navegaHomePage(context);
    else
      _createDialog(context);
  }

  _createDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("ERRO"),
              content: Text("Usuário ou senha inválido"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                )
              ],
            ));
  }

  _navegaHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
