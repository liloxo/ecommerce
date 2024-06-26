import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: const Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
