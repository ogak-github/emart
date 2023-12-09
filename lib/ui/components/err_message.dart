import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrMessage extends ConsumerWidget {
  final String errMessage;
  const ErrMessage({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(errMessage),
    );
  }
}
