import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'albumList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Album's API",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: "Galerie d'Albums"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bkgrd.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Bienvenu(e)",
                style: GoogleFonts.cinzel(textStyle: const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500, color: Colors.white)),
               ),
              const SizedBox(height: 20),
              Text("Retrouvez ici, les albums les plus vendus du dernier trimestre",
                style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500, color: Colors.white)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context)=> AlbumList()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                    primary: Colors.white70, // background
                    onPrimary: Colors.deepPurpleAccent, // foreground
                ),
                child: Text("DECOUVRIR",
                  style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w600, color: Colors.black)),
              )
              )
            ],
          ),
        ),
      ),
    );
  }

  Card generateAlbumCard(){
    return Card(

    );
  }
}
