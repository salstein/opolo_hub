import 'package:flutter/material.dart';

class UpdateView extends StatelessWidget {
  final List<String> images;
  const UpdateView({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.asset(images[index]);
          }),
    );
  }
}
