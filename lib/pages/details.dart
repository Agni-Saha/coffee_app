import 'package:coffee_shop_raja_yogan/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetails extends StatefulWidget {
  final String imgPath;
  final Color headerColor;

  const CoffeeDetails({
    Key? key,
    required this.imgPath,
    required this.headerColor,
  }) : super(key: key);

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              color: ColorPalette().leftBarColor,
            ),
            Container(
              height: screenHeight / 2,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Colors.transparent,
              ),
            ),
            Container(
              height: (screenHeight / 4 + 25),
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/doodle.png'),
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              height: (screenHeight / 4 + 25),
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: widget.headerColor.withOpacity(0.92),
              ),
            ),
            Positioned(
              top: 35,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            const Positioned(
              top: 35,
              right: 20,
              child: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: (screenHeight / 4 - 100),
              left: screenWidth / 4,
              child: Hero(
                tag: widget.imgPath,
                child: Image(
                  image: AssetImage(widget.imgPath),
                  height: 175,
                  width: 175,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: (screenHeight / 4) + 85,
              left: screenWidth / 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Grady's COLD BREW",
                    style: GoogleFonts.bigShouldersText(
                      color: const Color(0xFF23163D),
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_box_outlined,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1.5k',
                        style: GoogleFonts.bigShouldersText(
                          color: ColorPalette().firstSlice,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      //Repeat the same block as above
                      const Icon(
                        Icons.star,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '4',
                        style: GoogleFonts.bigShouldersText(
                          color: ColorPalette().firstSlice,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.anchor,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'No. 1',
                        style: GoogleFonts.bigShouldersText(
                          color: ColorPalette().firstSlice,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 2 + 10,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: GoogleFonts.bigShouldersText(
                      color: const Color(0xFF23163D),
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth - 40,
                    child: Text(
                      'Cold brewed with chicory and a unique blend of spices for 20 hours, our concentrate is velvety-smooth and packed with flavor.',
                      style: GoogleFonts.bigShouldersText(
                        color: const Color(0xFFB5ABB8),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    width: screenWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildOneItem('\$65'),
                        const SizedBox(width: 20),
                        buildOneItem('\$120'),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 225,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorPalette().buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            'BUY NOW',
                            style: GoogleFonts.bigShouldersText(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorPalette().buttonColor,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.bookmark,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildOneItem(price) {
    return Stack(
      children: [
        Container(
          height: 125,
          width: 200,
          color: Colors.transparent,
        ),
        Positioned(
          top: 50,
          child: Container(
            height: 75,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 5,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: GoogleFonts.bigShouldersText(
                  color: ColorPalette().firstSlice,
                  fontSize: 25,
                ),
              ),
              Text(
                'COLD BREW KIT',
                style: GoogleFonts.bigShouldersText(
                  color: const Color(0xFF23163D),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
