import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayuri Bakery',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              child:  Image.asset(
              'assets/hayuri.jpg', // Path to your logo image
              width: 400, // Adjust size as needed
              height: 400,
            ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('SIGN IN'),
            ),
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
final List<Map<String, String>> products = [
    {
      "name": "Roti Unyil",
      "description": "Roti unyil, si mungil yang penuh rasa! Hadir dengan aneka isian lezat seperti cokelat, keju, sosis, dan lainnya. Teksturnya lembut, ukurannya pas di tangan, cocok untuk camilan keluarga atau bekal si kecil."
    },
    {
      "name": "Roti Kasur",
      "description": "Roti kasur empuk seperti bantal! Setiap gigitan membawa rasa manis yang sempurna dengan tekstur lembut yang bikin nagih. Tersedia dengan berbagai pilihan rasa atau polos untuk teman minum teh."
    },
    {
      "name": "Roti Gembung Sarikaya",
      "description": "Roti gembung dengan isian sarikaya yang legit dan manis. Aroma pandan yang harum berpadu dengan tekstur roti lembut menjadikan setiap gigitannya memanjakan lidah."
    },
    {
      "name": "Pastel",
      "description": "Pastel renyah dengan isian gurih yang melimpah! Terbuat dari kulit yang crispy, berisi wortel, kentang, bihun, dan telur, cocok untuk kudapan kapan saja. Bisa dinikmati hangat bersama saus sambal."
    },
    {
      "name": "Roti Sisir",
      "description": "Roti sisir klasik yang manis dan lembut, sempurna untuk sarapan atau camilan sore. Tambahan olesan mentega membuat roti ini terasa lebih nikmat."
    },
    {
      "name": "Risoles",
      "description": "Risoles gurih dengan kulit yang lembut, berisi ragout creamy, sayuran, dan potongan ayam. Setiap gigitan memberikan perpaduan rasa yang pas, cocok untuk teman minum teh atau snack acara spesial."
    },
    {
      "name": "Bika Ambon",
      "description": "Bika Ambon legit dengan tekstur bersarang sempurna! Harumnya pandan dan kelembutannya membuat kue tradisional ini selalu menjadi pilihan favorit di setiap kesempatan."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(products[index]["name"]!),
             subtitle: Text(products[index]["description"]!.substring(0, 40) + '...'), // Display a short description
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pushNamed(context, '/detail', arguments: products[index]);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(product["name"]!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             product["name"]!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product["description"]!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Like')),
                ElevatedButton(onPressed: () {}, child: Text('Comment')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}