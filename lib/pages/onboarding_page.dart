import 'package:flutter/material.dart';
import 'package:foodapp/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/slider_item_component.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToNextPage() {
    if (_currentPage < _sliderData.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _currentPage = 0;
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  final List<Map<String, String>> _sliderData = [
    {
      "title": "All your favorites",
      "subtitle":
          "Get all your loved foods in one once place, you just place the order we do the rest.",
      "image": "image1",
      "buttonText": "NEXT",
    },
    {
      "title": "All your favorites",
      "subtitle":
          "Get all your loved foods in one once place, you just place the order we do the rest.",
      "image": "image2",
      "buttonText": "NEXT",
    },
    {
      "title": "Order from chosen chef",
      "subtitle":
          "Get all your loved foods in one once place, you just place the order we do the rest.",
      "image": "image3",
      "buttonText": "NEXT",
    },
    {
      "title": "Free delivery offers",
      "subtitle":
          "Get all your loved foods in one once place, you just place the order we do the rest.",
      "image": "image4",
      "buttonText": "GET STARTED",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: _sliderData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SliderItem(
                      title: _sliderData[index]["title"]!,
                      subtitle: _sliderData[index]["subtitle"]!,
                      image: _sliderData[index]["image"]!);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _sliderData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.orange
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
          if (_currentPage == _sliderData.length - 1) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: 327,
              height: 62,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFFFF7622),
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Text(
                  'GET STARTED',
                  style: GoogleFonts.sen(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ] else ...[
            const SizedBox(height: 20),
            SizedBox(
              width: 327,
              height: 62,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFFFF7622),
                    foregroundColor: Colors.white),
                onPressed: () {
                  setState(() {
                    _goToNextPage();
                  });
                },
                child: Text(
                  'NEXT',
                  style: GoogleFonts.sen(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 327,
              height: 62,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'SKIP',
                    style: GoogleFonts.sen(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )),
            ),
            const SizedBox(height: 40),
          ]
        ],
      ),
    );
  }
}
