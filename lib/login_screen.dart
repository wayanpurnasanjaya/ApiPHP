import 'package:apiphp/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:apiphp/api.dart';
import 'package:http/http.dart' as http;
import 'package:apiphp/res_login.dart';
import 'package:apiphp/session_manager.dart';
import 'package:apiphp/res_register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  SessionManager sessionManager = SessionManager();

  Future<ResLogin?>loginUser()async{
    try{
      setState((){
        isLoading = true;
      });
      var res = await http.post(Uri.parse("$baseUrl/login.php"),
          body:{"username":username.text,"password":password.text});
    ResLogin data = resLoginFromJson((res.body));
      if(data.value == 1){
        setState((){
          isLoading = false;
          sessionManager.saveSession(data.value, data.id, data.fullname, data.username);
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_)=>const MenuTab(),
          //   ),
          //     (route)=>false);
        });
      }else if(data.value == 2){
        setState((){
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data.message),
              ),
              );
        });
      }else{
        setState((){
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data.message),
              ),
          );
        });
      }
    }catch(e){
      setState((){
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()),
            ),
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: [
        const CircleAvatar(
          radius: 55,
        child: Icon(
          Icons.person,
          size: 55,
        ),
        ),
      const SizedBox(
    height: 25,
    ),
    TextFormField(
        controller: username,
      decoration: InputDecoration(hintText: "Username",
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
        prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder( borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)),
    ),
        const SizedBox(
          height: 25,
    ),
        const SizedBox(
          height: 25,
    ),
    TextFormField(
      controller: password,
      decoration: InputDecoration( hintText: "Password",
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          prefixIcon: const Icon(Icons.password),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none)),
    ),
        const SizedBox(
          height: 25,
    ),
    isLoading ? const Center(
      child: CircularProgressIndicator(),
    ) : MaterialButton(
      height: 45,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10)),
      minWidth: 150,
      color: Colors.white,
      textColor: Colors.blue,
      onPressed: () {
        loginUser();
        },
      child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
      const SizedBox( height: 25,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const RegisterPage()));
        },
        child: const Center(
            child: Text("Anda belum punya akun? Silahkan Register")),
      )
    ],
    ),
        ),
    );
  }
}
