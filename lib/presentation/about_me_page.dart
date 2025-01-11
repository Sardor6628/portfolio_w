import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website_p/services/router/route.dart';

@RoutePage()
class AboutMePage extends StatefulWidget {
  AboutMePage({required this.userName, super.key});
  String userName;

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Display Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child:  Text('${widget.userName}'),
        ),
      ),
    );
  }
}