import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_bloc.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_event.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_state.dart';
import 'package:to_do_app/data/local/local_varibals.dart';
import 'package:to_do_app/data/models/from_status/from_status_eman.dart';
import 'package:to_do_app/screens/calendar/calendar_screen.dart';
import 'package:to_do_app/screens/home/widget/category_item.dart';
import 'package:to_do_app/screens/home/widget/notes_input.dart';
import 'package:to_do_app/screens/home/widget/save_button.dart';
import 'package:to_do_app/screens/home/widget/self_esteem_stress_level.dart';
import 'package:to_do_app/screens/home/widget/sub_category_item.dart';
import 'package:to_do_app/screens/home/widget/top_items.dart';
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
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocBuilder<NotesInputBloc, NotesInputState>(
      builder: (BuildContext context, NotesInputState state) {
        return Scaffold(
          appBar: _appBar(state.notesModel.date),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 22.he, bottom: 30.he),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopItems(onChanged: (int value) {}),
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
                            context.read<NotesInputBloc>().add(
                                  NotesInputChangeCategoryEvent(
                                    categoryName: categoryModels[index].title,
                                  ),
                                );
                          },
                          isActive: state.notesModel.categoryName ==
                              categoryModels[index].title,
                        );
                      },
                    ),
                  ),
                ),
                if (state.notesModel.categoryName.isNotEmpty) 14.getH(),
                if (state.notesModel.categoryName.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.we),
                    child: Wrap(
                      spacing: 8.he,
                      children: List.generate(
                        subCategories.length,
                        (index) {
                          return SubCategoryItem(
                            onTab: () {
                              context.read<NotesInputBloc>().add(
                                    NotesInputSetSubCategoriesEvent(
                                      subCategoryName: subCategories[index],
                                    ),
                                  );
                            },
                            title: subCategories[index],
                            isActive: state.notesModel.subCategories
                                .contains(subCategories[index]),
                          );
                        },
                      ),
                    ),
                  ),
                if (state.notesModel.categoryName.isNotEmpty) 28.getH(),
                if (!state.notesModel.categoryName.isNotEmpty) 36.getH(),
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
                    if (state.notesModel.categoryName.isNotEmpty) {
                      context.read<NotesInputBloc>().add(
                            NotesInputSetStressLevelEvent(
                              stressLevel: value.toInt(),
                            ),
                          );
                    }
                  },
                  firsTitle: 'Низкий',
                  lastTitle: 'Высокий',
                  currentValue: state.notesModel.stressLevel.toDouble(),
                  isActive: state.notesModel.categoryName.isNotEmpty,
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
                    if (state.notesModel.categoryName.isNotEmpty) {
                      context.read<NotesInputBloc>().add(
                            NotesInputSetSelfEsteemEvent(
                              selfEsteem: value.toInt(),
                            ),
                          );
                    }
                  },
                  firsTitle: 'Неуверенность',
                  lastTitle: 'Уверенность',
                  currentValue: state.notesModel.selfEsteem.toDouble(),
                  isActive: state.notesModel.categoryName.isNotEmpty,
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
                NotesInput(onChanged: (String value) {
                  context.read<NotesInputBloc>().add(
                        NotesInputSetNotesTextEvent(
                          text: value,
                        ),
                      );
                }),
                35.getH(),
                SaveButton(
                  onTab: () {},
                  isActive: state.fromStatus == FromStatus.success,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar(String title) {
    return AppBar(
      // backgroundColor: AppColors.white,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.nunitoSemiBold.copyWith(
          fontSize: 18.sp,
          color: AppColors.cBCBCBF,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CalendarScreen();
                },
              ),
            );
            // final DateTimeRange? dateTimeRange = await showDateRangePicker(
            //   initialEntryMode: DatePickerEntryMode.calendarOnly,
            //   saveText: "Сохранить",
            //   context: context,
            //   firstDate: DateTime.now(),
            //   lastDate: DateTime(2080),
            //   locale: const Locale('ru', ''),
            // );
          },
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
