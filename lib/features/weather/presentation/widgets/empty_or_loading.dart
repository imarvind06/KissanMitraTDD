import 'package:flutter/material.dart';

class EmptyOrLoading extends StatelessWidget {
  const EmptyOrLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
