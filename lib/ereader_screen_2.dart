import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';

class EReaderScreen2 extends StatefulWidget {
  EReaderScreen2({Key? key}) : super(key: key);
  @override
  _EReaderScreen2State createState() => _EReaderScreen2State();
}

class _EReaderScreen2State extends State<EReaderScreen2> {
  int currentPage = 100;
  int totalPages = 346;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false, // Prevents automatic back button
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: primaryColor),
                      onPressed: () {
                        Navigator.pop(context); // Handle back action
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: primaryColor),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.tune, color: primaryColor),
                          onPressed: () {
                            // Handle tune action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu, color: primaryColor),
                          onPressed: () {
                            // Handle menu action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border,
                              color: primaryColor),
                          onPressed: () {
                            // Handle bookmark action
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Daftar isi',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text('$currentPage/$totalPages',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/books/filosofi-teras-cover.png'),
              ),
            ),
            const SizedBox(height: 8),
            Slider(
              value: currentPage.toDouble(),
              min: 1,
              max: totalPages.toDouble(),
              onChanged: (value) {
                setState(() {
                  currentPage = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
