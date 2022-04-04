import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/async_value_widget.dart';
import 'package:news/data/models/search_model.dart';
import 'package:news/logic/search_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String query = 'cricket';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                query = _searchController.text;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: Container(
          color: Colors.green[200],
          child: TextField(
            controller: _searchController,
            onSubmitted: (value) {
              setState(() {
                query = _searchController.text;
              });
            },
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final _search = ref.watch(searchProvider(query));
        return AsyncValueWidget<List<SearchModel>>(
            value: _search,
            data: (_searching) {
              return _searching.isEmpty
                  ? const Center(
                      child: Text('No Results found'),
                    )
                  : ListView(
                      children: [
                        Text(
                          '    Total results: ${_searching.length}',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        ..._searching.map((e) => ListTile(
                              title: Text(e.title ?? 'No title'),
                            ))
                      ],
                    );
            });
      }),
    );
  }
}
