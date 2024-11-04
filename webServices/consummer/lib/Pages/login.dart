import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor:Colors.black54 ,
        title: Text('Login',style: TextStyle(color:Color(0xFF76EEEE) )),
      ),
      body: Container(
        margin:EdgeInsets.only(top: 200,left: 30,right: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Color(0xFF0A6565),
                    wordSpacing: 1,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF76EEEE)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF0A6565),
                    wordSpacing: 1,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF76EEEE)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Form Submitted! Username: $_username, Password: $_password')),
                    );
                  }
                },
                child: Text('Login',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  padding:MaterialStateProperty.all(const EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.015),
                  )),
                  fixedSize: MaterialStateProperty.all(Size(450, 65)),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF0A6565)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  overlayColor: MaterialStateProperty.all(Color(0x1F416A)),
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Not registred?",style: TextStyle(color: Color(0xFF0A6565)),),
                  TextButton(onPressed: null, child: Text("Create an account",style: TextStyle(color: Color(0xFF0A6565)),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
