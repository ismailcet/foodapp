import 'package:flutter/material.dart';
import 'package:foodapp/pages/category_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedAddress = 'Halal Lab office';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    List<Map<String, String>> categories = [
      {'name': 'Pizza'},
      {'name': 'Burger'},
      {'name': 'Pasta'},
      {'name': 'Sushi'},
      {'name': 'Sushi'},
      {'name': 'Sushi'},
    ];
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 32),
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFECF0F4), shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          print("Menu button clicked!");
                        },
                        iconSize: 32,
                        icon: const Icon(Icons.menu), // Menü ikonu
                        color: const Color(0xFF181C2E),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver to',
                            style: GoogleFonts.sen(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: const Color(0xFFFC6E2A)),
                          ),
                          DropdownButton<String>(
                              isDense: true,
                              items: const [
                                DropdownMenuItem(
                                  child: Text('Halal Lab office'),
                                  value: 'Halal Lab office',
                                ),
                              ],
                              value: selectedAddress,
                              onChanged: (String? selected) {
                                setState(() {
                                  selectedAddress = selected!;
                                });
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xFF181C2E), // Koyu arka plan
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined, // Alışveriş ikonu
                          color: Colors.white,
                          size: 30,
                        )),
                    Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFF7622), shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            '2',
                            style: GoogleFonts.sen(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Row(
                children: [
                  Text(
                    'Hey Halal , ',
                    style: GoogleFonts.sen(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Good Afternoon!',
                    style: GoogleFonts.sen(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6), // Açık gri arka plan
                borderRadius:
                    BorderRadius.circular(10), // Yuvarlatılmış köşeler
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
                    hintText: 'Search dishes, restaurants',
                    hintStyle: GoogleFonts.sen(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff676767)),
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      size: 28,
                      color: Color(0xFFA0A5BA),
                    ),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Categories',
                  style: GoogleFonts.sen(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: GoogleFonts.sen(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF333333)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                      ),
                      color: const Color(0xffA0A5BA),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryDetailPage(
                                    categoryName: categories[index]['name']!)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF98A8B8),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              categories[index]['name']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Open Restaurants',
                  style: GoogleFonts.sen(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: GoogleFonts.sen(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF333333)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                      ),
                      color: const Color(0xffA0A5BA),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
                height: 310,
                child: ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xFF98A8B8),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rose Garden Restaurant',
                                  style: GoogleFonts.sen(
                                      fontSize: 20,
                                      color: const Color(0xFF181C2E),
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Burger - Chiken - Riche - Wings ',
                                  style: GoogleFonts.sen(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A5BA)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star_border_outlined,
                                  color: Color(0xFFFF7622), size: 21),
                              const SizedBox(width: 4),
                              Text(
                                '4.7',
                                style: GoogleFonts.sen(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFF7622),
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.delivery_dining_outlined,
                                  color: Color(0xFFFF7622), size: 20),
                              const SizedBox(width: 4),
                              Text(
                                'Free',
                                style: GoogleFonts.sen(
                                  fontSize: 16,
                                  color: const Color(0xFF181C2E),
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.access_time,
                                  color: Color(0xFFFF7622), size: 20),
                              const SizedBox(width: 4),
                              Text(
                                '20 min',
                                style: GoogleFonts.sen(
                                  fontSize: 16,
                                  color: const Color(0xFF181C2E),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 28,
                          )
                        ],
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}
