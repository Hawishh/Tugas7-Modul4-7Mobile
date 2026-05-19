import 'package:flutter/material.dart';

void main() {
  runApp(const GacoanApp());
}

class GacoanApp extends StatelessWidget {
  const GacoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Gacoan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF6F1FF),
      ),
      home: const HomePage(),
    );
  }
}

class MenuItem {
  final String title;
  final String description;
  final String imageAsset;
  final String detail;
  final String price;

  const MenuItem({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.detail,
    required this.price,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<MenuItem> menus = const [
    MenuItem(
      title: 'Mie Gacoan',
      description: 'Mie pedas favorit dengan pilihan level.',
      imageAsset: 'assets/images/mie_gacoan.jpg',
      detail:
          'Mie Gacoan adalah menu mie pedas dengan rasa gurih dan level pedas yang bisa dipilih. Menu ini cocok untuk pecinta makanan pedas.',
      price: 'Rp 12.000',
    ),
    MenuItem(
      title: 'Udang Keju',
      description: 'Camilan gurih berisi udang dan keju.',
      imageAsset: 'assets/images/udang_keju.jpg',
      detail:
          'Udang Keju adalah camilan dengan tekstur renyah di luar dan lembut di dalam. Rasanya gurih dan cocok dimakan bersama mie.',
      price: 'Rp 10.000',
    ),
    MenuItem(
      title: 'Es Gobak Sodor',
      description: 'Minuman segar untuk teman makan pedas.',
      imageAsset: 'assets/images/es_gobak_sodor.jpg',
      detail:
          'Es Gobak Sodor adalah minuman segar dengan rasa manis yang cocok untuk mengurangi rasa pedas setelah makan mie.',
      price: 'Rp 9.000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Mie Gacoan'), centerTitle: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di Gacoan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pilih menu favoritmu dan lihat detailnya.',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final item = menus[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(item: item),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item.imageAsset,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.description,
                                style: const TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item.price,
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 18),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text('Form', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final MenuItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              item.imageAsset,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 260,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 60,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.detail,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.all(14),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.title} ditambahkan ke pesanan',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Pesan Sekarang',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController menuController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    menuController.dispose();
    super.dispose();
  }

  void kirimPesanan() {
    final nama = namaController.text;
    final menu = menuController.text;

    if (nama.isEmpty || menu.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama dan menu harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pesanan $menu atas nama $nama berhasil dikirim!'),
        backgroundColor: Colors.green,
      ),
    );

    namaController.clear();
    menuController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama Pemesan',
                hintText: 'Masukkan nama kamu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: menuController,
              decoration: InputDecoration(
                labelText: 'Menu Favorit',
                hintText: 'Contoh: Mie Gacoan Level 3',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.restaurant_menu),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: kirimPesanan,
                child: const Text(
                  'Kirim Pesanan',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
