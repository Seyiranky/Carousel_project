import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FashionCarousel(),
    );
  }
}

class FashionCarousel extends StatefulWidget {
  const FashionCarousel({super.key});

  @override
  State<FashionCarousel> createState() => _FashionCarouselState();
}

class _FashionCarouselState extends State<FashionCarousel> {
  int _currentIndex = 0;
  
  final List<Map<String, dynamic>> fashionItems = [
    {
      'emoji': '👗',
      'title': 'Summer Dresses',
      'subtitle': 'Light & Beautiful',
      'color': Color(0xFFFF6B8B),
      'price': '\$49.99',
    },
    {
      'emoji': '👟',
      'title': 'Running Shoes',
      'subtitle': 'Comfort & Style',
      'color': Color(0xFF4ECDC4),
      'price': '\$79.99',
    },
    {
      'emoji': '🕶',
      'title': 'Sunglasses',
      'subtitle': 'UV Protection',
      'color': Color(0xFF45B7D1),
      'price': '\$29.99',
    },
    {
      'emoji': '👜',
      'title': 'Designer Bag',
      'subtitle': 'Elegant & Spacious',
      'color': Color(0xFF96CEB4),
      'price': '\$99.99',
    },
    {
      'emoji': '💄',
      'title': 'Beauty Kit',
      'subtitle': 'Complete Makeup Set',
      'color': Color(0xFFFECA57),
      'price': '\$59.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Fashion Collection 👗',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.purple,
            child: const Column(
              children: [
                Text(
                  'Discover Amazing Deals',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Swipe to explore our collection',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Beautiful Carousel
          CarouselSlider(
            items: fashionItems.map((item) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      item['color'],
                      item['color'].withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background pattern
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Opacity(
                        opacity: 0.1,
                        child: Text(
                          '✨',
                          style: TextStyle(fontSize: 80),
                        ),
                      ),
                    ),
                    
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Emoji/Icon
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              item['emoji'],
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Title
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          
                          const SizedBox(height: 8),
                          
                          // Subtitle
                          Text(
                            item['subtitle'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Price
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item['price'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 320,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.75,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: fashionItems.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentIndex == entry.key ? 25 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentIndex == entry.key 
                      ? Colors.purple 
                      : Colors.grey.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 30),
          
          // Current Item Info
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                // Emoji
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: fashionItems[_currentIndex]['color'].withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    fashionItems[_currentIndex]['emoji'],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                
                const SizedBox(width: 15),
                
                // Text Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fashionItems[_currentIndex]['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        fashionItems[_currentIndex]['subtitle'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Price
                Text(
                  fashionItems[_currentIndex]['price'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
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