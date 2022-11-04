import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.queryText}) : super(key: key);

  final String queryText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Search result appear here with q: $queryText"),
    );
  }
}
