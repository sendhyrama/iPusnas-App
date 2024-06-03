import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';
import 'package:ipusnas_app/detail_book_screen.dart';
import 'package:ipusnas_app/ereader_screen_1.dart';

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
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
              child: const Icon(
                Icons.home,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/pustaka.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'ePustaka',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/feed.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/book-rack.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Rak Buku',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 4 ? primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedLabelStyle:
            const TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
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
                      child: Container(
                        height: 40, // Set your desired height here
                        decoration: BoxDecoration(
                          color:
                              Colors.grey[300], // Set the background color here
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[
                                    600]), // Adjust hint text color if needed
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide:
                                  BorderSide.none, // Removes the default border
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    15.0), // Adjust vertical padding to center the text
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
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Selamat membaca buku',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
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
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
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
            child: Text('Jelajahi bacaan baru setiap harinya!',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 16),
          BookList(
            books: [
              Book(
                'Filosofi Teras',
                'Henry M.',
                5.0,
                'assets/books/filosofi-teras-cover.png', // Placeholder for book cover image
              ),
              Book(
                'Salvation of a Saint',
                'Keigo Higashino',
                5.0,
                'assets/books/salvation-of-a-saint.png', // Placeholder for book cover image
              ),
              Book(
                'Bumi',
                'Tere Liye',
                5.0,
                'assets/books/bumi.png', // Placeholder for book cover image
              ),
              Book(
                'Funiculi Funicula',
                'Toshikazu K.',
                5.0,
                'assets/books/funiculi-funicula.png', // Placeholder for book cover image
              ),
            ],
          ),
          const SectionTitle(title: 'Baca buku dari penulis ini'),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('Penulis buku ini sangat terkenal lho!',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 16),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Mungkin buku ini sesuai dengan minatmu!',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 16),
          BookList(
            books: [
              Book(
                'Keajaiban Toko Kelontong Namiya',
                'Keigo Higashino',
                5.0,
                'assets/books/keajaiban-toko-kelontong-namiya.png', // Placeholder for book cover image
              ),
              Book(
                'Dalang Pelukis Mimpi',
                'Lee Miye',
                5.0,
                'assets/books/dalang-pelukis-mimpi.png', // Placeholder for book cover image
              ),
              Book(
                'Cantik Itu Luka',
                'Eka Kurniawan',
                5.0,
                'assets/books/cantik-itu-luka.png', // Placeholder for book cover image
              ),
              Book(
                'Polaris Musim Dingin',
                'Alicia Lidwina',
                5.0,
                'assets/books/polaris-musim-dingin.png', // Placeholder for book cover image
              ),
            ],
          ),
          const SizedBox(height: 10)
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
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Lihat Semua',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
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
      height: 270,
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
              padding: const EdgeInsets.only(left: 16.0),
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
                  Container(
                    width: 120, // Same width as the book image
                    child: Text(
                      books[index].title,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 120, // Same width as the book image
                    child: Text(
                      books[index].author,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
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
                        const SizedBox(
                            width:
                                5), // Add some spacing between the stars and the rating text
                        Text(
                          '${books[index].rating.toStringAsFixed(1)}',
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
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
          final nameParts = authors[index].name.split(' ');
          final formattedName = nameParts.join('\n');
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(authors[index].image),
                ),
                const SizedBox(height: 8),
                Text(
                  formattedName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
    // Determine the original width and height of the book image asset
    const double originalImageWidth = 100.0;
    const double originalImageHeight = 148.0;
    const double imageMargin = 12.0; // Set your custom margin value

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: imageMargin), // Apply margin only to the right side
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // Set the desired border radius
                child: Image.asset(
                  'assets/books/things-left-behind.png',
                  width: originalImageWidth,
                  height: originalImageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: imageMargin), // Apply margin only to the left side
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Terakhir dibaca halaman $lastReadPage',
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 116,
                      height: 28,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EReaderScreen1()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Lanjutkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
