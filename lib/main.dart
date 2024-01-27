import 'package:damu/pages/add_book.dart';
import 'package:damu/models/book_access.dart';
import 'package:damu/pages/book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/body_page.dart';
import 'widgets/app_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          BookAccess(), // Replace with your data provider class
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ozindi Damyt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Page'),
      initialRoute: '/',
      routes: {
        '/book_page': (context) => BookPage(),
        '/add_book': (context) => AddBook(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1.0),
        title: Text("Кітапхана"),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 16),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: BodyPage(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_book');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
