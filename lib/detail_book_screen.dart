import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';
import 'package:ipusnas_app/ereader_screen.dart';

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
                  MaterialPageRoute(builder: (context) => const DetailBookScreen()),
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

class DetailBookScreen extends StatelessWidget {
  const DetailBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/books/filosofi-teras-cover.png', // Make sure to add the image to your assets
                height: 200,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Filosofi Teras: Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Chip(label: Text('Henry Manampiring')),
                SizedBox(width: 8.0),
                Chip(label: Text('Penerbit Buku Kompas')),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('4.8/5'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('346'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ukuran File',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('12.3 MB'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stok',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('8'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Format',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('PDF'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.queue, size: 30),
                    SizedBox(height: 8.0),
                    Text('58,633 antrian'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.people, size: 30),
                    SizedBox(height: 8.0),
                    Text('27,866 peminjam'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Detail',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('ISBN: 978-602-412-518-9'),
            const Text('Tahun Terbit: 2018'),
            const Text('Genre: Self-Improvement'),
            const Text('Kategori: Non-fiksi'),
            const Text(
                'Sitasi: Manampiring, Henry. 2019. Filosofi Teras. Jakarta: Buku Kompas.'),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Trigger Warning',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Chip(label: Text('Mental-health issues')),
                SizedBox(width: 8.0),
                Chip(label: Text('Sensitif Content')),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Sinopsis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Apakah kamu sering merasa khawatir akan banyak hal? baperan? susah move-on? mudah tersinggung dan marah-marah di social media maupun dunia nyata?',
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Beri rating dan ulasan untuk buku ini',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: const Icon(
                    Icons.star_border,
                    size: 32,
                  ),
                  onPressed: () {
                    // handle rating logic
                  },
                );
              }),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tuliskan ulasan Anda mengenai Buku ini',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Rating dan Ulasan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Text(
                  '4.8/5',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('dari 100 ulasan'),
                    Row(
                      children: [
                        Text('50'),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 8.0),
                        Text('27'),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 8.0),
                        Text('10'),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 8.0),
                        Text('8'),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 8.0),
                        Text('5'),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/avatar/john-doe.png'), // Make sure to add the image to your assets
                      ),
                      title: const Text('John Doe'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('@Bookworm'),
                          Text('323 Ulasan 200 Pengikut'),
                          SizedBox(height: 8.0),
                          Text(
                            'Ungkapan “Buku yang Bagus Dapat Mengubah Hidup Anda” ternyata ada benarnya. Ya, saya belum membaca begitu banyak buku...',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // handle follow logic
                        },
                        child: const Text('Ikuti'),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Desember 10, 2024',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 4.0),
                        Text('1,846 Suka'),
                        SizedBox(width: 16.0),
                        Icon(Icons.comment, color: Colors.grey),
                        SizedBox(width: 4.0),
                        Text('2 Komentar'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SectionTitle(title: 'Rekomendasi'),
            const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Mungkin kamu suka buku ini'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showConfirmationDialog(context);
        },
        label: const Text('Pinjam Buku'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        extendedPadding: const EdgeInsets.all(140),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        extendedTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pinjam Buku'),
          content: const Text('Apakah Anda yakin ingin meminjam buku ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EReaderScreen()),
                );
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
