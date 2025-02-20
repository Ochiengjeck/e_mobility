import 'package:carousel_slider/carousel_slider.dart';
import 'package:ev_app/assets/cars.dart';
import 'package:ev_app/assets/news.dart';
import 'package:ev_app/assets/shared_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        // appbar
        appBar: AppBar(
          title: const Text("E-Mobility"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                height: 30,
                width: 30,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),

        // body
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // advertisemements
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: News().news.entries.map((news) {
                        return Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(news.value),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: double.infinity,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                ),

                // New Arrivals label
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "New Arrivals 🔥🔥",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See more..",
                          style: TextStyle(
                            color: SharedColors(context).indicator,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // The new arrivals
                SizedBox(
                  height: 250,
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
                          decoration: BoxDecoration(
                            color: SharedColors(context).innerContainerColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                child: Image.asset(
                                  Cars().AllCars[index]["image"]!,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Cars().AllCars[index]["name"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Ksh.${Cars().AllCars[index]["price"]!}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        Cars().AllCars[index]["description"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          overflow: TextOverflow.clip,
                                        ),
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
        ));
  }
}
