import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.searchController, required this.onChanged});
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onChanged,
      // onChanged: onChanged,
      controller: searchController,
      decoration: const InputDecoration(
        hintText: "Search",
        suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
            size: 24, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
