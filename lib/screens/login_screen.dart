import 'package:buddyget/screens/sign_up.dart';
import 'package:buddyget/utils/appvalidator.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      appBar: AppBar(title: Text('My Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Login to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Email", Icons.email),
                    validator: appValidator.validateEmail),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF15900)),
                        onPressed: _submitForm,
                        child: Text("Login", style: TextStyle(fontSize: 20)))),
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpView()));
                    },
                    child: Text("Create new account",
                        style:
                            TextStyle(color: Color(0xFFF15900), fontSize: 25)))
              ],
            )),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color.fromARGB(170, 124, 129, 202),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color(0xFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
