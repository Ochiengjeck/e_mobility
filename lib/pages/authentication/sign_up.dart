import 'package:ev_app/assets/or_divider.dart';
import 'package:ev_app/assets/signup_popup.dart';
import 'package:ev_app/pages/authentication/log_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 + 100,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage("assets/images/dashboard dark.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(80),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Let's Sign You Up To Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 2,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 20.0, top: 5),
                                      child: Text(
                                        "To continue, you need to create an account. Selecct a method below.",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: const ButtonStyle(),
                                      onPressed: () {
                                        showSignupPopup(context);
                                      },
                                      child: const Text(
                                        "Sign Up with email",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: buildOrDivider(),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.mail,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.apple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("Have an account?"),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LogIn(),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Log In",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
