import 'package:coffee_shop_raja_yogan/components/black_gold.dart';
import 'package:coffee_shop_raja_yogan/components/cold_brew.dart';
import 'package:coffee_shop_raja_yogan/components/gold_brew.dart';
import 'package:coffee_shop_raja_yogan/components/mccafe.dart';
import 'package:coffee_shop_raja_yogan/components/nescafe.dart';
import 'package:coffee_shop_raja_yogan/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final colorPalette = ColorPalette();

  var selectedOption = 0;

  List allOptions = [
    const BlackGold(),
    const ColdBrew(),
    const Nescafe(),
    const McCafe(),
    const GoldBrew(),
  ];

  List isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.transparent,
            ),
            Container(
              height: screenHeight,
              width: screenWidth / 5,
              color: colorPalette.leftBarColor,
            ),
            const Positioned(
              top: 35,
              left: 20,
              child: Icon(Icons.menu),
            ),
            const Positioned(
              top: 35,
              right: 20,
              child: Icon(Icons.shopping_bag_outlined),
            ),
            Positioned(
              top: screenHeight - (screenHeight - 100),
              left: (screenWidth / 5) + 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CoffeeHouse",
                    style: GoogleFonts.bigShouldersDisplay(
                      color: const Color(0xFF23163D),
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "A lot can happen over coffee.",
                    style: GoogleFonts.bigShouldersDisplay(
                      color: colorPalette.subtitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 225,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorPalette.titleColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        hintText: "search...",
                        hintStyle: GoogleFonts.bigShouldersText(
                          color: Colors.grey.withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SideNavigation(
              isSelected: isSelected,
              notifier: changeOption,
            ),
            Positioned(
              top: (screenHeight / 3) + 5,
              left: (screenWidth / 5) + 20,
              child: SizedBox(
                height: screenHeight - ((screenHeight / 3) + 50),
                width: screenWidth - ((screenWidth / 5) + 40),
                child: allOptions[selectedOption],
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeOption(int index) {
    setState(() {
      selectedOption = index;
      isSelected[isSelected.indexOf(true)] = false;
      isSelected[index] = true;
    });
  }
}

class SideNavigation extends StatelessWidget {
  final List isSelected;
  final Function(int) notifier;

  const SideNavigation({
    Key? key,
    required this.isSelected,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75,
      child: RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          width: MediaQuery.of(context).size.height - 100,
          height: MediaQuery.of(context).size.width / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOption('Black Gold', 0),
              buildOption('Cold Brew', 1),
              buildOption('Nescafe', 2),
              buildOption('McCafe', 3),
              buildOption('Gold Brew', 4),
            ],
          ),
        ),
      ),
    );
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF23163D),
                ),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            notifier(index);
          },
          child: Text(
            title,
            style: isSelected[index]
                ? GoogleFonts.bigShouldersText(
                    color: const Color(0xFF23163D),
                    fontSize: 18,
                  )
                : GoogleFonts.bigShouldersText(
                    color: ColorPalette().subtitleColor,
                    fontSize: 16,
                  ),
          ),
        ),
      ],
    );
  }
}
