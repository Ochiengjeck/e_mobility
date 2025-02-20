import 'package:ev_app/assets/cars.dart';
import 'package:ev_app/assets/shared_colors.dart';
import 'package:ev_app/controllers/page_controllers.dart';
import 'package:ev_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Providers
    UserProvider User = Provider.of<UserProvider>(context);

    return Scaffold(
      // The app body
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            // Salutations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning ",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        "${User.userName}😁👋",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/profile.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // The rest of the body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // The Rented cars
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: SharedColors(context).containerColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/ev1.jpg",
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rented Vehichles",
                                        style: TextStyle(),
                                      ),
                                      Text(
                                        "Honda E Advance",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_time,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.8,
                                        decoration: BoxDecoration(
                                          color: SharedColors(context)
                                              .innerContainerColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 4,
                                              bottom: 10,
                                              right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Period",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "30 Days",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 2,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.8,
                                        decoration: BoxDecoration(
                                          color: SharedColors(context)
                                              .innerContainerColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 4,
                                              bottom: 10,
                                              right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Rental Plan",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "Ksh 1,210/day",
                                                style: TextStyle(
                                                  // fontStyle: FontStyle.italic,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.8,
                                        decoration: BoxDecoration(
                                          color: SharedColors(context)
                                              .innerContainerColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 4,
                                              bottom: 10,
                                              right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paymment",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "Ksh 36,300",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                SharedColors(context).indicator,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: SharedColors(context)
                                                .innerContainerColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                                  child: Icon(
                                                    Icons.timelapse,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    " 12 Days Left",
                                                    overflow: TextOverflow.fade,
                                                    softWrap: true,
                                                    maxLines: 1,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        indexPageController.jumpToPage(0);
                                      },
                                      icon: const Icon(
                                        Icons.pin_drop,
                                        size: 40,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Available Cars
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: SharedColors(context).containerColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nearby Electric Vehichles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 220,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: Cars().AllCars.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 45, 45, 45),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            child: Image.asset(
                                              Cars().AllCars[index]["image"]!,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Cars().AllCars[index]
                                                      ["name"]!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "From Ksh. ${Cars().AllCars[index]["price"]!}/hour",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
