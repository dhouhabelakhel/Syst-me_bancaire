
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  String? _gender;
  String? _email;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF060606),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 50,right: 50,top: 80),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(
                        color: Color(0xFF0A6565),
                        thickness: 9,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                      Expanded(child:
                      Divider(
                        color: Colors.grey,
                        thickness: 9,
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                      Expanded(child:
                      Divider(
                        color: Colors.grey,
                        thickness: 9,
                      )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Full name",
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
                    style: TextStyle(color: Colors.white),
                    validator: (value){
                      if(value== null || value.isEmpty){
                        return ('please enter your name');
                      }
                    },
                    onSaved: (value){
                      _username=value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Country",
                      suffixIcon:
                          Icon(Icons.location_city, color: Color(0xFF0A6565)),
                      labelStyle: TextStyle(
                        color: Color(0xFF0A6565),
                        wordSpacing: 1,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF76EEEE)),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      suffixIcon:
                          Icon(Icons.email_outlined, color: Color(0xFF0A6565)),
                      labelStyle: TextStyle(
                        color: Color(0xFF0A6565),
                        wordSpacing: 1,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF76EEEE)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Gender",
                        style: TextStyle(color: Color(0xFF0A6565)),
                      ),
                      SizedBox(
                        child: ChoiceChip(
                          label: Text("Female"),
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          selected: true,
                          color: MaterialStateProperty.all(
                            Color(0xFF0A6565),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: ChoiceChip(
                          label: Text("Male"),
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          selected: false,
                          color: MaterialStateProperty.all(
                            Color(0xFF0A6565),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Date of birth",
                        style: TextStyle(color: Color(0xFF0A6565)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "MM",
                                  labelStyle:TextStyle(color: Color(0xFF0A6565))
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "MM",
                                  labelStyle:TextStyle(color: Color(0xFF0A6565))
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),

                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "YYYY",
                                  labelStyle:TextStyle(color: Color(0xFF0A6565)) ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _obscureText = !_obscureText;
                            print(_obscureText);
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color(0xFF0A6565),
                          )),
                      labelStyle: TextStyle(
                        color: Color(0xFF0A6565),
                        wordSpacing: 1,
                        fontSize: 20,
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF76EEEE)),
                      ),
                    ),
                    obscureText: _obscureText,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }else{
                      Navigator.pushNamed(context, 'card');}
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xFF0A6565)),
                      textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 20)),
                      overlayColor: MaterialStateProperty.all(Color(0x1F416A)),
                      padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.015),
                      )),
                      fixedSize: MaterialStateProperty.all(Size(300, 65)),                    ),
                  ),
                ],
              )),
        ));
  }
}
