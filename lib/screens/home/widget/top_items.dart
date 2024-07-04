import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/home/widget/top_button.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_images.dart';

class TopItems extends StatefulWidget {
  const TopItems({super.key, required this.onChanged});

  final ValueChanged<int> onChanged;

  @override
  State<TopItems> createState() => _TopItemsState();
}

class _TopItemsState extends State<TopItems> {
  int _activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cF2F2F2,
          borderRadius: BorderRadius.circular(47.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopMyButton(
              onTab: () {
                setState(() {
                  _activePageIndex = 0;
                  widget.onChanged.call(_activePageIndex);
                });
              },
              title: 'Дневник настроения',
              iconPath: AppImages.notesSvg,
              isActive: _activePageIndex == 0,
            ),
            TopMyButton(
              onTab: () {
                setState(() {
                  _activePageIndex = 1;
                  widget.onChanged.call(_activePageIndex);
                });
              },
              title: 'Статистика',
              iconPath: AppImages.statisticsSvg,
              isActive: _activePageIndex == 1,
            ),
          ],
        ),
      ),
    );
  }
}
