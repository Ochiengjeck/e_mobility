import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controllers/input_controllers.dart';

void showSignupPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Sign Up',
          style: TextStyle(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(),
              ),
              keyboardType: TextInputType.phone,
              style: const TextStyle(),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
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
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
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
            },
            child: const Text('Cancel', style: TextStyle()),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the signup logic here
              String phone = phoneController.text;
              String email = emailController.text;
              String password = passwordController.text;
              String confirmPassword = confirmPasswordController.text;

              if (phone.isNotEmpty &&
                  email.isNotEmpty &&
                  password.isNotEmpty &&
                  confirmPassword.isNotEmpty) {
                if (password == confirmPassword) {
                  // Perform signup action
                  Fluttertoast.showToast(
                    msg: "Sign Up Successful",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0,
                  );
                  Navigator.of(context).pop();
                  passwordController.clear();
                  phoneController.clear();
                  emailController.clear();
                  confirmPasswordController.clear();
                } else {
                  // Show error message using fluttertoast
                  Fluttertoast.showToast(
                    msg: "Passwords do not match",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0,
                  );
                  passwordController.clear();
                  confirmPasswordController.clear();
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
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
