import 'package:ev_app/controllers/input_controllers.dart';
import 'package:ev_app/controllers/page_controllers.dart';
import 'package:ev_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void editProfilePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      UserProvider User = Provider.of<UserProvider>(context);
      return AlertDialog(
        title: const Text(
          "Edit Your profile",
          style: TextStyle(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              style: const TextStyle(),
              keyboardType: TextInputType.name,
              controller: userNameController,
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(),
              ),
            ),
            TextField(
              style: const TextStyle(),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              userNameController.clear();
              emailController.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              User.changeEmail(emailController.text);
              User.changeName(userNameController.text);
              userNameController.clear();
              emailController.clear();
              indexPageController.jumpToPage(4);
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
