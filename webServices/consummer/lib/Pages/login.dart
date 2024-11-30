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
      backgroundColor: Color(0xFF060606),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black54,
          title: Center(
            child: Text('Login',
                style: TextStyle(
                    color: Color(0xFF84a5f1), fontSize: 25, wordSpacing: 1)),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 150,right: 20,left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  suffixIcon: Icon(Icons.person, color: Color(0xFF0A6565)),
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
                  suffixIcon:Icon(Icons.password,color:Color(0xFF0A6565)),
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
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not registred?",
                        style: TextStyle(color: Color(0xFF0A6565)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(color: Color(0xFF0A6565)),
                          ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(
                        color: Color(0xFF0A6565),
                        thickness: 1,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text( "Or login with",
                          style: TextStyle( fontSize: 16, color: Color(0xFF0A6565), ), ), ),
                      Expanded(child:
                      Divider(
                        color: Color(0xFF0A6565),
                        thickness: 1,
                      )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.facebook,color: Color(0xFF84a5f1),),
                      Icon(Icons.g_mobiledata,color: Color(0xFF84a5f1),)

                    ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
