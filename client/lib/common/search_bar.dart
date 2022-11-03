import 'package:childhood_illness_search_engine/res/style.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key, required this.callback}) : super(key: key);

  Function callback;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var txtController = TextEditingController();

  void _onSearch() {
    // TODO: Implement on search function
    widget.callback;
  }

  void _onRemoveText() {
    setState(() {
      txtController.text = "";
    });
    widget.callback();
  }

  void _onChangedTxt(String _) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: txtController,
      onChanged: _onChangedTxt,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        filled: true,
        fillColor: PrimaryColor.lightGrey,
        prefixIcon: IconButton(
            onPressed: _onSearch,
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
                onPressed: _onRemoveText,
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
