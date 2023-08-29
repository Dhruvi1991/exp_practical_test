import 'package:flutter/cupertino.dart';

class ErrorMessageView extends StatelessWidget {
  final String message;

  const ErrorMessageView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
