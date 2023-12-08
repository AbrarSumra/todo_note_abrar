import 'package:flutter/material.dart';
import 'package:todo_note_abrar/AppDataBase/app_db.dart';
import 'package:todo_note_abrar/Screens/home_screen.dart';
import 'package:todo_note_abrar/Screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 200),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Enter UserName",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Enter UserName",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                  ),
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      var email = emailController.text.toString();
                      var pass = passController.text.toString();

                      var appDb = AppDataBase.instance;
                      if (await appDb.authenticateUser(email, pass)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Invalid Email and Password !!!")));
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      )),
                  const Divider(
                    height: 15,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SignUpScreen()));
                    },
                    child: const Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                    ),
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
