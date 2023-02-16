import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oye_busy/routs/routes.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context ) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final imageUrl =
       "https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png";
    return Material(
      color: Colors.white,
      child: Form(
        key: _formkey,
        child: Column(
          children:[Image.network(imageUrl,fit: BoxFit.cover,
          ),
            SizedBox(
              height: 20.0,
            ),
            Text("Welcome $name"
              ,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 0,bottom: 0),
              child:
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter username",
                  labelText: "username",
                ),
                validator:(value) {
                  if(value!.isEmpty){
                    return "user name cant be empty";
                  }
                  return null;

                },
                onChanged:(value){
                  name =value;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 0,bottom: 0),
              child:  TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                  labelText: "password",
                ),
                validator:(value){
                  if(value!.isEmpty){
                    return "password cant be empty";
                  }
                  else if(value.length<6){
                    return "password length should be 6";
                  }
                  return null;

                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Material(
              color: Colors.blue,
              borderRadius:
              BorderRadius.circular(changeButton ?50:10),
              child: InkWell(
                onTap: () =>moveToHome(context),
                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changeButton ?50:100,
                  height: 40,
                  alignment: Alignment.center,
                  child :changeButton?Icon(Icons.done, color:Colors.white,): Text(
                    "Login",
                    style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                  ),

                ),
              ),
            ),
            //ElevatedButton.icon(onPressed: () {
            //   Navigator.pushNamed(context, MyRoutes.homeRoute);
            // }, icon:Text("->"), label: Text("Login")
            //  ),
            SizedBox(
              height: 0.0,
            ),
            FlatButton(onPressed: () {print("nahi hai"); }, child: Text("forgot password ?",style: TextStyle( color:Colors.blue,fontSize: 15 ),)
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("new user ? create Account"),
          ],
        ),
      ),
    );

  }
}
