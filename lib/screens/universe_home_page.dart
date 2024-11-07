import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:planet_app/models/planets_model.dart';
import 'package:planet_app/screens/planets_info_screen.dart';
import 'package:planet_app/utils/colors.dart';

class UniverseHomePage extends StatefulWidget {
  const UniverseHomePage({super.key});

  @override
  State<UniverseHomePage> createState() => _UniverseHomePageState();
}

class _UniverseHomePageState extends State<UniverseHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondGradientColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              firstGradientColor,
              secondGradientColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Solar System",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white60,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down,
                            color: Colors.pink[200], size: 25),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Swiper(
                  itemCount: planets.length,
                  itemHeight: MediaQuery.of(context).size.height * 0.7,
                  itemWidth: double.infinity,
                  layout: SwiperLayout.TINDER,
                  physics: const BouncingScrollPhysics(),
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.white60,
                      activeSize: 12,
                      size: 8,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlanetsInfoScreen(planetInfo: planets[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 50),
                              Card(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 200),
                                      Text(
                                        planets[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 50,
                                          color:
                                              Color.fromARGB(255, 71, 69, 95),
                                        ),
                                      ),
                                      Text(
                                        "Solar System",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25,
                                          color: primaryTextColor,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            "Know More ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: secondaryTextColor,
                                            ),
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: secondaryTextColor)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                          Hero(
                              tag: planets[index].id,
                              child: Image.asset(planets[index].iconImage)),
                          Positioned(
                            right: 10,
                            bottom: 70,
                            child: Text(
                              planets[index].id.toString(),
                              style: TextStyle(
                                fontSize: 220,
                                color: primaryTextColor.withOpacity(0.1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: navBarColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/menu_icon.png"),
                  ),
                  const Text(
                    "Explore",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.pink[200], size: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_outline_outlined,
                    color: Colors.pink[200], size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
