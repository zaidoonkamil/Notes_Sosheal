import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/ui/pages/add_note_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:flutter_note_app/ui/widgets/note_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../services/theme_services.dart';
import 'search_view.dart';

class HomePage extends StatelessWidget {
  final _notesController = Get.put(NoteController());

  final _tileCounts = [
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(4, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
  ];
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: Get.isDarkMode ? Color(0xFF3B3B3B) : Colors.white70,
          foregroundColor: Get.isDarkMode ? Colors.white : Color(0xFF3B3B3B),
          onPressed: () {
            Get.to(
              AddNotePage(),
              transition: Transition.downToUp,
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 10,
            ),
            _searchTextFormField(),
            const SizedBox(
              height: 12,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(searchTextFormField());
        },
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.black, size: 35),
              SizedBox(
                width: 10,
              ),
              Text(
                'Search',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "NotesShow",
            style: titleTextStyle.copyWith(
              fontSize: 26,
              color: Get.isDarkMode ? Colors.white : bgColor,
            ),
          ),
          IconButton(
            onPressed: () {
              ThemeServices().switchTheme();
            },
            icon: Icon(
              Icons.wb_sunny_outlined,
              size: 24,
              color: Get.isDarkMode ? Colors.white : bgColor,
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        print("######## " + _notesController.noteList.length.toString());
        if (_notesController.noteList.isNotEmpty) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: _notesController.noteList.length,
            itemBuilder: (context, index) {
              return NoteTile(
                tileType: _tileTypes[index % 7],
                note: _notesController.noteList[index],
              );
            },
            staggeredTileBuilder: (int index) => _tileCounts[index % 7],
          );
        } else {
          return Center(
            child: Text("Empty",
                style: titleTextStyle.copyWith(
                    color: Get.isDarkMode ? Colors.white : bgColor)),
          );
        }
      }),
    ));
  }
}
