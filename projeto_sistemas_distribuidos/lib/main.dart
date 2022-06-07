import 'package:flutter/material.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/cadastro-pet-form.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/chatPet.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/homePage.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/inbox.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/sobreNos.dart';
import 'package:projeto_sistemas_distribuidos/login/components/cadastroUsuario.dart';
import 'package:projeto_sistemas_distribuidos/login/components/login.dart';
import 'package:projeto_sistemas_distribuidos/utils/loading.dart';

import 'cadastro-pet/components/detalhePet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   
      debugShowCheckedModeBanner: false,
      title: 'Adopets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF605088),
      ),
      home: new LoginPage(),
      routes: {
        HomePage.ROUTE: (context) => new HomePage(),
        DetalhePet.ROUTE: (context) => new DetalhePet(),
        CadastroPet.ROUTE: (context) => new CadastroPet(),
        ChatPet.ROUTE: (context) => new ChatPet(),
        LoginPage.ROUTE: (context) => new LoginPage(),
        CadastroUsuario.ROUTE: (context) => new CadastroUsuario(),
        Inbox.ROUTE: (context) => new Inbox(),
        SobreNos.ROUTE: (context) => new SobreNos(),
      },
    );
  }
}
