// ignore_for_file: avoid_print

import 'package:favourite_app/Screen/remove_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/selected_provider.dart';

class FavouriteSelectedItems extends StatefulWidget {
  const FavouriteSelectedItems({super.key});

  @override
  State<FavouriteSelectedItems> createState() => _FavouriteSelectedItemsState();
}

class _FavouriteSelectedItemsState extends State<FavouriteSelectedItems> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite App"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouriteRemoveItems()));
              },
              child: const Icon(
                Icons.favorite,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              print("listView");
              // final SelecetdProvider = Provider.of<SelectedItems>(context);
              return Consumer<SelectedItems>(builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    print("listtile");
                    if (value.selectedItems.contains(index)) {
                      value.removeItems(index);
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
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.pinkAccent,
                        )
                      : const Icon(Icons.favorite_outline),
                );
              });
            }));
  }
}
