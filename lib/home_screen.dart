import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';
import 'package:ipusnas_app/detail_book_screen.dart';
import 'package:ipusnas_app/ereader_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    const Center(child: Text('ePustaka')),
    const Center(child: Text('Feed')),
    const Center(child: Text('Rak Buku')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'ePustaka',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Rak Buku',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.mail_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // Profile and Welcome Message
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                          'assets/avatar/user.png'), // Placeholder for profile image
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, Jane Doe!',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Selamat membaca buku'),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lanjutkan Bacaan',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                BookCard(
                  title:
                      'Things Left Behind : Hal-hal yang Kita Pelajari dari Mereka yang Telah Tiada',
                  author: 'Kim Sae Byoul & Jeon Ae Won',
                  lastReadPage: 100,
                ),
              ],
            ),
          ),
          const SectionTitle(title: 'Yang baru di iPusnas'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Jelajahi bacaan baru setiap harinya!'),
          ),
          const SizedBox(height: 10),
          BookList(
            books: [
              Book(
                'Filosofi Teras',
                'Henry M.',
                4.5,
                'assets/books/filosofi-teras-cover.png', // Placeholder for book cover image
              ),
              Book(
                'Salvation of a Saint',
                'Keigo Higashino',
                4.5,
                'assets/books/salvation-of-a-saint.png', // Placeholder for book cover image
              ),
              Book(
                'Bumi',
                'Tere Liye',
                4.5,
                'assets/books/bumi.png', // Placeholder for book cover image
              ),
              Book(
                'Funiculi Funicula',
                'Toshikazu K.',
                4.5,
                'assets/books/funiculi-funicula.png', // Placeholder for book cover image
              ),
            ],
          ),
          const SectionTitle(title: 'Baca buku dari penulis ini'),
          AuthorList(
            authors: [
              Author(
                name: 'Keigo Higashino',
                image:
                    'assets/avatar/keigo-higashino.png', // Placeholder for author image
              ),
              Author(
                name: 'Henry Manampiring',
                image:
                    'assets/avatar/henry-manampiring.png', // Placeholder for author image
              ),
              Author(
                name: 'Raditya Dika',
                image:
                    'assets/avatar/raditya-dika.png', // Placeholder for author image
              ),
              Author(
                name: 'Mark Manson',
                image:
                    'assets/avatar/mark-manson.png', // Placeholder for author image
              ),
              Author(
                name: 'Dee Lestari',
                image:
                    'assets/avatar/dee-lestari.png', // Placeholder for author image
              ),
            ],
          ),
          const SectionTitle(title: 'Rekomendasi Bacaan'),
          BookList(
            books: [
              Book(
                'Keajaiban Toko Kelontong Namiya',
                'Keigo Higashino',
                4.5,
                'assets/books/keajaiban-toko-kelontong-namiya.png', // Placeholder for book cover image
              ),
              Book(
                'Dalang Pelukis Mimpi',
                'Lee Miye',
                4.5,
                'assets/books/dalang-pelukis-mimpi.png', // Placeholder for book cover image
              ),
              Book(
                'Cantik Itu Luka',
                'Eka Kurniawan',
                4.5,
                'assets/books/cantik-itu-luka.png', // Placeholder for book cover image
              ),
              Book(
                'Polaris Musim Dingin',
                'Alicia Lidwina',
                4.5,
                'assets/books/polaris-musim-dingin.png', // Placeholder for book cover image
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Lihat Semua'),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final double rating;
  final String coverImage;

  Book(this.title, this.author, this.rating, this.coverImage);
}

class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (books[index].title == 'Filosofi Teras') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailBookScreen()),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(books[index].coverImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    books[index].title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(books[index].author),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < books[index].rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Author {
  final String name;
  final String image;

  Author({required this.name, required this.image});
}

class AuthorList extends StatelessWidget {
  final List<Author> authors;

  const AuthorList({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: authors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(authors[index].image),
                ),
                const SizedBox(height: 8),
                Text(authors[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final int lastReadPage;

  const BookCard(
      {super.key,
      required this.title,
      required this.author,
      required this.lastReadPage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.asset('assets/books/things-left-behind.png',
            width: 50), // Placeholder for book cover image
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author),
            Text('Terakhir dibaca halaman $lastReadPage'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EReaderScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Text(
                'Lanjutkan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
