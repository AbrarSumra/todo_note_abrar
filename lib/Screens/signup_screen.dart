import 'package:flutter/material.dart';
import 'package:todo_note_abrar/AppDataBase/app_db.dart';
import 'package:todo_note_abrar/Model/user_model.dart';
import 'package:todo_note_abrar/Screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
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
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Enter Name",
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
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Enter Email",
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
                  hintText: "Enter Password",
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
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      var appDb = AppDataBase.instance;
                      var check = await appDb.createAccount(UserModel(
                        user_id: 0,
                        user_name: nameController.text.toString(),
                        user_email: emailController.text.toString(),
                        user_pass: passController.text.toString(),
                      ));

                      var msg = "";

                      if (check) {
                        msg = "Account created successfully";
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) => LoginScreen()));
                      } else {
                        msg = "Can't create account as email already exists";
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(msg)));
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => LoginScreen()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 15),
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
