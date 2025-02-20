import 'package:ev_app/assets/edit_profile_popup.dart';
import 'package:ev_app/assets/shared_colors.dart';
import 'package:ev_app/providers/theme_provider.dart';
import 'package:ev_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushvalue = false;

  @override
  Widget build(BuildContext context) {
    // innitialize the providers
    UserProvider User = Provider.of<UserProvider>(context);
    ThemeProvider Theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.settings,
                        size: 50,
                      ),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: SharedColors(context).headingColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 130.0,
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                accountName: Text(
                  User.userName,
                  style: TextStyle(
                    color: SharedColors(context).labelColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  User.email,
                  style: TextStyle(
                    color: SharedColors(context).labelColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                decoration: BoxDecoration(
                  color: SharedColors(context).containerColor,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/dashboard 2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: SharedColors(context).innerContainerColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Account Profile",
                            style: TextStyle(
                              color: SharedColors(context).headingColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text(
                        "Edit Profile",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          editProfilePopup(context);
                        },
                        icon: const Icon(Icons.navigate_next),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Change Password",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.navigate_next),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Add Payment Method",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Push Notification",
                        style: TextStyle(),
                      ),
                      trailing: Switch(
                        value: pushvalue,
                        onChanged: (value) {
                          setState(() {
                            pushvalue = !pushvalue;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Dark Mode",
                        style: TextStyle(),
                      ),
                      trailing: Switch(
                        value: Theme.darkThemeEnabled,
                        onChanged: (value) {
                          Theme.changeTheme();
                        },
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "More",
                            style: TextStyle(
                              color: SharedColors(context).headingColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text(
                        "About Us",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.navigate_next),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.navigate_next),
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    ListTile(
                      title: const Text(
                        "Log Out",
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
