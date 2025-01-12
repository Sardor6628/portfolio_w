import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Blog'),
      ),
      body: const Center(
        child: Text(
          'PLACE FOR BLOG',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}