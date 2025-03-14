import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  final String categoryName;
  const CategoryDetailPage({super.key, required this.categoryName});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Text(widget.categoryName),
    );
  }
}
