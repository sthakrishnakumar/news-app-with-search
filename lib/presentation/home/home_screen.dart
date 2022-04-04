import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/presentation/home/headline_section.dart';
import 'package:news/presentation/search/search_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('News App'),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: ((context) => const SearchPage()),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              'Headline News',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          HeadlineSection(),
          SizedBox(
            height: 20,
          ),
          HeadlineSection(),
          SizedBox(
            height: 20,
          ),
          HeadlineSection(),
          SizedBox(
            height: 20,
          ),
          HeadlineSection(),
        ],
      ),
    );
  }
}
