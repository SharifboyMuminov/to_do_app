import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/data/local/local_varibals.dart';
import 'package:to_do_app/screens/home/widget/category_item.dart';
import 'package:to_do_app/screens/home/widget/notes_input.dart';
import 'package:to_do_app/screens/home/widget/save_button.dart';
import 'package:to_do_app/screens/home/widget/self_esteem_stress_level.dart';
import 'package:to_do_app/screens/home/widget/sub_category_item.dart';
import 'package:to_do_app/screens/home/widget/top_button.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndexCategory = -1;
  double _selfEsteem = 50;
  double _stressLevel = 20;

  bool _isActive = false;
  int _activePageIndex = 0;

  List<int> activeIndexSubCategories = [];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 22.he, bottom: 30.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
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
                        });
                      },
                      title: 'Статистика',
                      iconPath: AppImages.statisticsSvg,
                      isActive: _activePageIndex == 1,
                    ),
                  ],
                ),
              ),
            ),
            30.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                "Что чувствуешь?",
                style: AppTextStyle.nunitoBlack.copyWith(
                  color: AppColors.c4C4C69,
                  fontSize: 16.sp,
                ),
              ),
            ),
            18.getH(),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 14.we),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categoryModels.length,
                  (index) {
                    return CategoryItem(
                      categoryModel: categoryModels[index],
                      onTAb: () {
                        setState(() {
                          _activeIndexCategory = index;
                          _isActive = true;
                        });
                      },
                      isActive: _activeIndexCategory == index,
                    );
                  },
                ),
              ),
            ),
            if (_isActive) 14.getH(),
            if (_isActive)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: Wrap(
                  spacing: 8.he,
                  children: List.generate(
                    subCategories.length,
                    (index) {
                      return SubCategoryItem(
                        onTab: () {
                          setState(() {
                            if (activeIndexSubCategories.contains(index)) {
                              activeIndexSubCategories.remove(index);
                            } else {
                              activeIndexSubCategories.add(index);
                            }
                          });
                        },
                        title: subCategories[index],
                        isActive: activeIndexSubCategories.contains(index),
                      );
                    },
                  ),
                ),
              ),
            if (_isActive) 28.getH(),
            if (!_isActive) 36.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                "Уровень стресса",
                style: AppTextStyle.nunitoBlack.copyWith(
                  color: AppColors.c4C4C69,
                  fontSize: 16.sp,
                ),
              ),
            ),
            20.getH(),
            SelfEsteemStressLevel(
              onChanged: (value) {
                if (_isActive) {
                  setState(() {
                    _stressLevel = value;
                  });
                }
              },
              firsTitle: 'Низкий',
              lastTitle: 'Высокий',
              currentValue: _stressLevel,
              isActive: _isActive,
            ),
            36.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                "Самооценка",
                style: AppTextStyle.nunitoBlack.copyWith(
                  color: AppColors.c4C4C69,
                  fontSize: 16.sp,
                ),
              ),
            ),
            20.getH(),
            SelfEsteemStressLevel(
              onChanged: (value) {
                if (_isActive) {
                  setState(() {
                    _selfEsteem = value;
                  });
                }
              },
              firsTitle: 'Неуверенность',
              lastTitle: 'Уверенность',
              currentValue: _selfEsteem,
              isActive: _isActive,
            ),
            36.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                "Заметки",
                style: AppTextStyle.nunitoBlack.copyWith(
                  color: AppColors.c4C4C69,
                  fontSize: 16.sp,
                ),
              ),
            ),
            20.getH(),
            NotesInput(onChanged: (String value) {}),
            35.getH(),
            SaveButton(
              onTab: () {},
              isActive: _isActive,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await DateTimeRange(start: DateTime.now(), end: DateTime(2090));
          await showDateRangePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2080),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      // backgroundColor: AppColors.white,
      centerTitle: true,
      title: Text(
        "1 января 09:00",
        style: AppTextStyle.nunitoSemiBold.copyWith(
          fontSize: 18.sp,
          color: AppColors.cBCBCBF,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.dateIconSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
        14.getW(),
      ],
    );
  }
}
