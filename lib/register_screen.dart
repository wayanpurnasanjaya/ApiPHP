import 'package:flutter/material.dart';
import 'package:apiphp/api.dart';
import 'package:apiphp/login_screen.dart';
import 'package:apiphp/res_register.dart';
import 'package:http/http.dart'as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController full_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<ResRegister?> registerUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      var res = await http.post(Uri.parse("$baseUrl/register.php"), body: {
        "username": username.text,
        "email": email.text,
        "full_name": full_name.text,
        "password": password.text
      });
      ResRegister data = resRegisterFromJson((res.body));
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
                  (route) => false);
        });
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data.message),
            ),
          );
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data.message),
            ),
          );
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
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
    ),
    TextFormField(
      controller: username,
      decoration: InputDecoration(
      hintText: "Username",
      fillColor: Colors.grey.withOpacity(0.2),
     filled: true,
      prefixIcon: const Icon(Icons.person),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none)),
    ),

    const SizedBox(
    height: 25,
    ),
    TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: email,
    decoration: InputDecoration(
    hintText: "Email",
    fillColor: Colors.grey.withOpacity(0.2),
    filled: true,
    prefixIcon: const Icon(Icons.email),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none)),
    ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        controller: full_name,
        decoration: InputDecoration(
            hintText: "Full_name",
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)),
      ),
    const SizedBox(
    height: 25,
    ),
    TextFormField(
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    controller: password,
    decoration: InputDecoration(
    hintText: "Password",
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
    isLoading
    ? const Center(
    child: CircularProgressIndicator(),
    )
        : MaterialButton(
    height: 45,
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(10)),
    minWidth: 150,
    color: Colors.white,
      textColor: Colors.blue,
      onPressed: () async {
        await registerUser();
      },
      child: const Text(
        "Register",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
      const SizedBox(
        height: 25,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
        child: const Center(
            child: Text("Anda sudah punya akun? Silahkan Login")),
      )
    ],
    ),
        ),
    );
  }
}
