import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/news_layout.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final apikey = 'd80324a08d5c40c7883239ea89bfc438';

  String newsHeadline = '';

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  Future<Map<String, dynamic>> getData() async {
    try {
      final result = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey',
        ),
      );

      final data = jsonDecode(result.body);

      if (data['status'] != 'ok') {
        throw "An Unexpected Error Occurs";
      }

      //   newsHeadline = data['articles'][0]['title'];

      //print(data);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: const CircularProgressIndicator(color: Colors.black),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //print(snapshot.data);
          final data = snapshot.data!;
          print(data);
          //final currentHeadline = data['articles'][0]['title'];
          //final currentContent = data['articles'][0]['content'];
          ///final currentImg = data['articles'][0]['urlToImage'];

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: [
                for (int i = 0; i <= 10; i++)
                  NewsLayout(
                    headLine:
                        data['articles'][i]['title'] ?? 'No Title Available',
                    newsImg: data['articles'][i]['urlToImage'] ?? '',
                    newsContent:
                        data['articles'][i]['content'] ??
                        'No Content Available',
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
