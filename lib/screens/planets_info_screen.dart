import 'package:flutter/material.dart';
import 'package:planet_app/models/planets_model.dart';
import 'package:planet_app/utils/colors.dart';

class PlanetsInfoScreen extends StatefulWidget {
  final PlanetInfo planetInfo;
  const PlanetsInfoScreen({super.key, required this.planetInfo});

  @override
  State<PlanetsInfoScreen> createState() => _PlanetsInfoScreenState();
}

class _PlanetsInfoScreenState extends State<PlanetsInfoScreen> {
  bool _isExpanded = false;

  void toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 280),
                        Text(
                          widget.planetInfo.name,
                          style: TextStyle(
                            fontSize: 60,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                            fontSize: 35,
                            color: primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.black12),
                        const SizedBox(height: 20),
                        Text(
                          widget.planetInfo.description,
                          maxLines: _isExpanded ? null : 5,
                          overflow: _isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                              color: contentTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: toggleExpanded,
                          child: Text(
                            _isExpanded ? "Read Less" : "Read More",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.black12),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 25,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                widget.planetInfo.images[index],
                                fit: BoxFit.cover,
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
            Positioned(
              right: -50,
              child: Hero(
                tag: widget.planetInfo.id,
                child: Image.asset(
                  widget.planetInfo.iconImage,
                ),
              ),
            ),
            Positioned(
              child: Text(
                widget.planetInfo.id.toString(),
                style: TextStyle(
                  fontSize: 250,
                  color: primaryTextColor.withOpacity(0.1),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
