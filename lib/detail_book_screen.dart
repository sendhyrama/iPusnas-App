import 'package:flutter/material.dart';
import 'package:ipusnas_app/components/color.dart';
import 'package:ipusnas_app/ereader_screen_2.dart';

import 'carousel.dart';

const double customCornerRadius = 12.0;

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
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
            child: const Text(
              'Lihat Semua',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
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

Widget _buildColumn(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Nunito',
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
        ),
      ),
    ],
  );
}

class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
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

class DetailBookScreen extends StatefulWidget {
  const DetailBookScreen({super.key});

  @override
  _DetailBookScreenState createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  bool isBorrowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Buku',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert), // 3-dot icon
            onPressed: () {
              // Add your functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                child: ImageCarousel(), // Replace with the ImageCarousel widget
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Filosofi Teras: Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center horizontally
                children: [
                  Chip(
                    label: Text(
                      'Henry Manampiring',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor:
                        Colors.black12, // Set background color to primary color
                  ),
                  SizedBox(width: 8.0),
                  Chip(
                    label: Text(
                      'Penerbit Buku Kompas',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor:
                        Colors.black12, // Set background color to primary color
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 4, // Adjust elevation as per your design preference
              margin: const EdgeInsets.all(
                  8.0), // Adjust margin as per your design preference
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColumn('Rating', '4.8/5'),
                    _buildColumn('Halaman', '346'),
                    _buildColumn('Ukuran File', '12.3 MB'),
                    _buildColumn('Stok', '8'),
                    _buildColumn('Format', 'PDF'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Chip(
                      avatar: Icon(Icons.access_time, color: Colors.black87),
                      label: Text(
                        '58,633 Antrian',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700),
                      ),
                      backgroundColor: Color(
                          0xFFBAC8E4), // Set background color to primary color
                    ),
                    SizedBox(width: 8.0),
                    Chip(
                      avatar: Icon(Icons.event_note, color: Colors.black87),
                      label: Text(
                        '27,866 Peminjam',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700),
                      ),
                      backgroundColor: Color(
                          0xFFBAC8E4), // Set background color to primary color
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Detail',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ISBN: ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '978-602-412-518-9',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tahun Terbit: ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '2018',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Genre: ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Self-Improvement',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kategori: ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Non-fiksi',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sitasi: ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Manampiring, Henry. 2019. Filosofi Teras. Jakarta: Buku Kompas.',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16.0),
            const Text(
              'Trigger Warning',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // Set your custom corner radius value
            Row(
              children: [
                Chip(
                  label: const Text('Mental-health issues'),
                  backgroundColor: Colors.white, // Set background color
                  labelStyle: const TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold), // Set label text color
                  shape: RoundedRectangleBorder(
                    // Create outline
                    borderRadius: BorderRadius.circular(customCornerRadius),
                    side: const BorderSide(
                        color: Colors.orange,
                        width: 1.0), // Set outline color and width
                  ),
                ),
                const SizedBox(width: 8.0),
                Chip(
                  label: const Text('Sensitive Content'),
                  backgroundColor: Colors.white, // Set background color
                  labelStyle: const TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold), // Set label text color
                  shape: RoundedRectangleBorder(
                    // Create outline
                    borderRadius: BorderRadius.circular(customCornerRadius),
                    side: const BorderSide(
                        color: Colors.orange,
                        width: 1.0), // Set outline color and width
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sinopsis',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 24.0, // Adjust the size of the chevron if needed
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Apakah kamu sering merasa khawatir akan banyak hal? baperan? susah move-on? mudah tersinggung dan marah-marah di social media maupun dunia nyata?',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Beri rating dan ulasan untuk buku ini',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Sampaikan pendapat Anda',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                fontWeight: FontWeight.w600,
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
            const SizedBox(height: 12.0),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  labelText: 'Tuliskan ulasan Anda mengenai Buku ini',
                  labelStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating dan Ulasan',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 24.0, // Adjust the size of the chevron if needed
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  10.0), // Adjust the corner radius as needed
              child: Image.asset('assets/rating.png'),
            ),
            const SizedBox(height: 4.0),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 80, // Set the desired width
                          child: CircleAvatar(
                            radius:
                                40, // Set the radius to make the image bigger
                            backgroundImage:
                                AssetImage('assets/avatar/john-doe.png'),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle_outline, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      'Bookworm',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Text(
                                  '323 Ulasan 200 Pengikut',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 2.0),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              // handle follow logic
                            },
                            child: const Text(
                              'Ikuti',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < 4 ? Icons.star : Icons.star_border,
                              color: Colors.yellow,
                              size: 16,
                            );
                          }),
                        ),
                        const Text(
                          'Desember 10, 2024',
                          style: TextStyle(
                              color: Colors.black54, fontFamily: 'Nunito'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Filosofi Teras oleh Henry Manampiring',
                      style: TextStyle(
                          fontFamily: 'Nunito', fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Ungkapan “Buku yang Bagus Dapat Mengubah Hidup Anda” ternyata ada benarnya. Ya, saya belum membaca begitu banyak buku...',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Nunito', fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8.0),
                    const Row(
                      children: [
                        SizedBox(width: 4.0),
                        Text('Tampilkan lebih banyak',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700)),
                        Icon(Icons.expand_more),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite_border_outlined, size: 20),
                        const SizedBox(width: 4.0),
                        const Text('1,846 Suka',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700)),
                        const SizedBox(width: 16.0),
                        Image.asset('assets/icons/chat.png',
                            color: Colors.black),
                        const SizedBox(width: 4.0),
                        const Text('2 Komentar',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700)),
                        const SizedBox(width: 16.0),
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {
                            // handle more options
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SectionTitle(title: 'Rekomendasi'),
            const Text(
              'Mungkin kamu suka buku ini',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            BookList(
              books: [
                Book(
                  'Cantik Itu Luka',
                  'Eka Kurniawan',
                  5.0,
                  'assets/books/cantik-itu-luka.png', // Placeholder for book cover image
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
            const SizedBox(height: 50)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!isBorrowed) {
            _showConfirmationDialog(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EReaderScreen2()),
            );
          }
        },
        label: Text(isBorrowed ? 'Baca Sekarang' : 'Pinjam Buku'),
        backgroundColor: isBorrowed ? Colors.green : primaryColor,
        foregroundColor: Colors.white,
        extendedPadding: const EdgeInsets.all(124),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        extendedTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Nunito'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, size: 24),
                      SizedBox(width: 8.0),
                      Text(
                        'Konfirmasi Peminjaman',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'Apakah Anda yakin meminjam buku Filosofi Teras oleh Henry Manampiring?',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100, // Adjust width as needed
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _showSuccessDialog(context);
                            setState(() {
                              isBorrowed = true;
                            });
                          },
                          child: const Text(
                            'Ya',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100, // Adjust width as needed
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Tidak',
                            style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: const BorderSide(
                                  color: primaryColor), // Add stroke outline
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_outline_rounded, size: 24),
                        SizedBox(width: 8.0),
                        Text(
                          'Pinjaman Berhasil',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'Buku ini akan tersimpan di dalam rak buku setelah Anda mengunduhnya',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: Colors.grey),
                  SizedBox(
                    width: 100, // Adjust width as needed
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Tutup',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
