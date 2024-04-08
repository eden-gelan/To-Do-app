import 'package:flutter/material.dart';
import 'package:todo/constant/constant.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Adjust width according to your layout

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: cprimary.withOpacity(1), // Set border color here
            width: 1.0, // Set border width here
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none, // Remove TextField's default border
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: cprimary.withOpacity(1),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: cprimary.withOpacity(1), // Set border color here
                  width: 1.0, // Set border width here
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your search functionality here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
