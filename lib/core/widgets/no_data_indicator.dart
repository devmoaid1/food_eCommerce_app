import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataIndicator extends StatelessWidget {
  final String message;

  const NoDataIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
      ),
    );
  }
}
