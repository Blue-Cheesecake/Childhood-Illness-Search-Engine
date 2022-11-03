import 'package:childhood_illness_search_engine/res/style.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.callback}) : super(key: key);

  final Function(ContainerStatus, String) callback;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var txtController = TextEditingController();

  void _onSearch(String txt) {
    // TODO: Implement on search function
    widget.callback(ContainerStatus.UP, txtController.text);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _onRemoveText() {
    setState(() {
      txtController.text = "";
    });
    widget.callback(ContainerStatus.DOWN, txtController.text);
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
      onSubmitted: _onSearch,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        filled: true,
        fillColor: PrimaryColor.lightGrey,
        prefixIcon: IconButton(
            onPressed: () => _onSearch(txtController.text),
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
