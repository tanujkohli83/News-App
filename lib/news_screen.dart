import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.notoSerifKhojki(
          textStyle: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      backgroundColor: Color(0xFFFEFAE0),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          setState(() {
            debugPrint("Refresh");
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: Icon(Icons.refresh_rounded, color: Colors.white, size: 30),
      ),
      body: News(),
    );
  }
}
