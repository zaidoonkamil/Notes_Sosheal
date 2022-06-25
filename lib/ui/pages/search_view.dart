import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:get/get.dart';

import '../widgets/note_tile.dart';

class searchTextFormField extends StatefulWidget {
  searchTextFormField({Key? key}) : super(key: key);

  @override
  State<searchTextFormField> createState() => _searchTextFormFieldState();
}

class _searchTextFormFieldState extends State<searchTextFormField> {

  final _notesController = Get.put(NoteController());

  late List listCard=_notesController.noteList;

  final _tileTypes = [
    TileType.Square,
    TileType.Square,
    TileType.HorRect,
    TileType.VerRect,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 10,
          bottom: 10,
        ),
        child: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
              bottom: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                onChanged: (search) => searchCard(search),
              ),
            ),
          ),
             Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              if (listCard.isNotEmpty) {
                return ListView.separated(
                  itemCount: listCard.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 100,
                      child: NoteTile(
                       tileType: _tileTypes[index % 7],
                        note: listCard[index],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {return Divider(height: 8,); },
                );
              } else {
                return Center(
                  child: Text(
                    "Empty",
                  ),
                );
              }
            }),
          ))
        ])),
      ),
    );
  }

  void searchCard(String search) {
    setState(() {
   //   listCard =listCard.where((user) => user._tileTypes.toLowerCase().contains(search)).toList();
    });
    print(search);
  }
}
