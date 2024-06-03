import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ipusnas_app/components/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<String> _imagePaths = [
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
    'assets/books/filosofi-teras-cover.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              items: _imagePaths.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(path, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height:
                    175.0, // Adjusted height to fit within the DetailBookScreen
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.4,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, size: 40, color: Colors.black),
                onPressed: () {
                  _controller.previousPage();
                },
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.chevron_right, size: 40, color: Colors.black),
                onPressed: () {
                  _controller.nextPage();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: _imagePaths.length,
          effect: ScrollingDotsEffect(
            dotWidth: 8.0,
            dotHeight: 8.0,
            activeDotColor: primaryColor,
            dotColor: Colors.grey,
          ),
          onDotClicked: (index) {
            _controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}
