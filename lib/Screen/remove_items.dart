// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/selected_provider.dart';

class FavouriteRemoveItems extends StatefulWidget {
  const FavouriteRemoveItems({super.key});

  @override
  State<FavouriteRemoveItems> createState() => _FavouriteRemoveItemsState();
}

class _FavouriteRemoveItemsState extends State<FavouriteRemoveItems> {
  
  @override
  Widget build(BuildContext context) {
    print("build");
    final selecetdProvider = Provider.of<SelectedItems>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Items"),
          actions: const [
            Icon(
              Icons.favorite,
              size: 2,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: selecetdProvider.selectedItems.length,
            itemBuilder: (context, index) {
              print("listView");

              return Consumer<SelectedItems>(builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    print("listtile");
                    if (value.selectedItems.contains(index)) {
                      value.removeItems(index);
                      setState(() {});
                    } else {
                      value.addItems(index);
                    }
                  },
                  title: Text(
                    "Item $index",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: value.selectedItems.contains(index)
                      ? const Icon(Icons.favorite, color: Colors.pinkAccent)
                      : const Icon(Icons.favorite_outline),
                );
              });
            }));
  }
}
