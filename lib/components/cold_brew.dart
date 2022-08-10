import 'package:coffee_shop_raja_yogan/constants/color_palette.dart';
import 'package:coffee_shop_raja_yogan/pages/details.dart';
// import 'package:coffeebrew/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ColdBrew extends StatefulWidget {
  const ColdBrew({Key? key}) : super(key: key);

  @override
  State<ColdBrew> createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem(
          'assets/coffee4.png',
          '150',
          ColorPalette().secondSlice,
        ),
        buildListItem(
          'assets/coffee2.png',
          '200',
          ColorPalette().firstSlice,
        ),
      ],
    );
  }

  buildListItem(String imgPath, String price, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CoffeeDetails(
              imgPath: imgPath,
              headerColor: bgColor,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 280,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage('assets/doodle.png'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: bgColor.withOpacity(0.92),
              ),
            ),
          ),
          Positioned(
            right: 2,
            child: Hero(
              tag: imgPath,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 72,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.bigShouldersText(
                    color: const Color(0xFF23163D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$$price',
                  style: GoogleFonts.bigShouldersText(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Grady\'s COLD BREW',
                  style: GoogleFonts.bigShouldersText(
                    color: const Color(0xFF23163D),
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '65 reviews',
                            style: GoogleFonts.bigShouldersText(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            size: 16,
                            color: Colors.white,
                            borderColor: Colors.white,
                            rating: 3,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 16,
                              ),
                              Text(
                                'Add',
                                style: GoogleFonts.bigShouldersText(
                                  color: const Color(0xFF23163D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
