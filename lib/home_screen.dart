import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
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
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mail_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Profile and Welcome Message
                Row(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lanjutkan Bacaan',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                BookCard(
                  title:
                      'Filosofi Teras: Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini',
                  author: 'Henry Manampiring',
                  lastReadPage: 10,
                ),
              ],
            ),
          ),
          SectionTitle(title: 'Yang baru di iPusnas'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Jelajahi bacaan baru setiap harinya!'),
          ),
          SizedBox(height: 10),
          BookList(
            books: [
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
          SectionTitle(title: 'Baca buku dari penulis ini'),
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
          SectionTitle(title: 'Rekomendasi Bacaan'),
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
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Lihat Semua'),
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

  BookList({required this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
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
                SizedBox(height: 5),
                Text(
                  books[index].title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(books[index].author),
                Row(
                  children: List.generate(5, (i) {
                    return Icon(
                      i < books[index].rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 16,
                    );
                  }),
                ),
              ],
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

  AuthorList({required this.authors});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                SizedBox(height: 8),
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

  BookCard(
      {required this.title, required this.author, required this.lastReadPage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.asset('assets/books/filosofi-teras.png',
            width: 50), // Placeholder for book cover image
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author),
            Text('Terakhir dibaca halaman $lastReadPage'),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                child: Text(
                  'Lanjutkan',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
