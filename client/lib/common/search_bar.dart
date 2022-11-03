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
      style: Theme.of(context).textTheme.titleSmall,
      controller: txtController,
      onChanged: onChangedTxt,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        filled: true,
        fillColor: PrimaryColor.lightGrey,
        prefixIcon: IconButton(
            onPressed: onSearch,
            icon: const Icon(
              Icons.search,
              color: PrimaryColor.lightNavyBlue,
            )),
        hintText: "Search illness..",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: PrimaryColor.lightNavyBlue,
        ),
        suffixIcon: txtController.text != ""
            ? IconButton(
                onPressed: onRemoveText,
                icon: const Icon(
                  Icons.clear_outlined,
                  color: PrimaryColor.lightNavyBlue,
                ),
              )
            : null,
      ),
    );
  }
}
