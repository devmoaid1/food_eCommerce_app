import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/core/widgets/header_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderCard(),
            Expanded(
              child: Center(
                child: Text(
                  "News Page",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
