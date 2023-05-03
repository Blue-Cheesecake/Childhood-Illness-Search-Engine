import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/providers/favourite_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IllnessCardWidget extends StatefulWidget {
  const IllnessCardWidget(
      {Key? key, required this.illness, required this.callback})
      : super(key: key);

  final IllnessElementModel illness;
  final void Function(IllnessElementModel) callback;

  @override
  State<IllnessCardWidget> createState() => _IllnessCardWidgetState();
}

class _IllnessCardWidgetState extends State<IllnessCardWidget> {
  @override
  Widget build(BuildContext context) {
    FavouriteListProvider favProvider =
        Provider.of<FavouriteListProvider>(context);
    return GestureDetector(
      onTap: () => widget.callback(widget.illness),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: Card(
          elevation: 2.5,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                widget.illness.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            subtitle: Text(
              widget.illness.description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              splashRadius: 10,
              onPressed: () {
                setState(() {
                  widget.illness.isFavourite = !widget.illness.isFavourite;
                });
                if (widget.illness.isFavourite) {
                  favProvider.removeIllness(widget.illness);
                } else {
                  favProvider.addIllness(widget.illness);
                }
              },
              icon: Icon(
                widget.illness.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
