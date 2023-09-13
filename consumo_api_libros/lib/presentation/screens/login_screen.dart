import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  final String url = 'http://localhost:3000/api/users/login';

  void apiLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    final body = jsonEncode({'correo': email, 'contrasena': password});

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final rol = responseData['rol'];
      final message = responseData['message'];
      final nombre = responseData['nombre'];

      if (rol == "Administrador") {
        /* Navegar a la pantalla dashboard */
      } else {
        /* Navegar a la pantalla inicial del cliente */
      }
    } else if (response.statusCode == 401) {
      final responseData = jsonDecode(response.body);
      final error = responseData['error'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'Ingrese su correo',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: _isVisible,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                apiLogin();
              }, child: const Text('Iniciar sesión'),),
            ],
          ),
        ),
      ),
    );
  }
}
