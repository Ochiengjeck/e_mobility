import 'package:ev_app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controllers/input_controllers.dart';

void showLoginPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Login',
          style: TextStyle(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email or Phone',
                labelStyle: TextStyle(),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(),
              ),
              obscureText: true,
              style: const TextStyle(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              passwordController.clear();
              phoneController.clear();
            },
            child: const Text('Cancel', style: TextStyle()),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the login logic here
              String email = emailController.text;
              String password = passwordController.text;
              if (email.isNotEmpty && password.isNotEmpty) {
                if (email == "ochiengjeck@gmail.com" ||
                    email == "sjecop2211@ueab.ac.ke" && password == "123") {
                  // Show success message using fluttertoast
                  Fluttertoast.showToast(
                    msg: "Login Successful",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Index(),
                    ),
                  );
                } else {
                  // Show error message using fluttertoast
                  Fluttertoast.showToast(
                    msg: "Invalid phone number or password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0,
                  );
                  emailController.clear();
                  passwordController.clear();
                }
              } else {
                // Show error message using fluttertoast
                Fluttertoast.showToast(
                  msg: "Please fill all fields",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  fontSize: 16.0,
                );
              }
            },
            style: ElevatedButton.styleFrom(),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
