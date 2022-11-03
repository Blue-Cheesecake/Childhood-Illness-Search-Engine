import 'package:childhood_illness_search_engine/res/style.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var txtController = TextEditingController();

  void onSearch() {}

  void onRemoveText() {
    setState(() {
      txtController.text = "";
    });
  }

  void onChangedTxt(String _) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      onChanged: onChangedTxt,
      decoration: InputDecoration(
        filled: true,
        fillColor: PrimaryColor.lightGrey,
        icon: IconButton(onPressed: onSearch, icon: const Icon(Icons.search)),
        hintText: "Search illness..",
        suffixIcon: txtController.text != ""
            ? IconButton(
                onPressed: onRemoveText,
                icon: const Icon(Icons.clear_outlined),
              )
            : null,
      ),
    );
  }
}
