import 'package:equatable/equatable.dart';

class NotesModel extends Equatable {
  final String notesTitle;
  final String categoryName;
  final String date;
  final List<String> subCategories;
  final int stressLevel;
  final int selfEsteem;

  const NotesModel({
    required this.date,
    required this.notesTitle,
    required this.subCategories,
    required this.categoryName,
    required this.selfEsteem,
    required this.stressLevel,
  });

  NotesModel copyWith({
    String? categoryName,
    String? date,
    String? notesTitle,
    List<String>? subCategories,
    int? stressLevel,
    int? selfEsteem,
  }) {
    return NotesModel(
      date: date ?? this.date,
      subCategories: subCategories ?? this.subCategories,
      categoryName: categoryName ?? this.categoryName,
      selfEsteem: selfEsteem ?? this.selfEsteem,
      stressLevel: stressLevel ?? this.stressLevel,
      notesTitle: notesTitle ?? this.notesTitle,
    );
  }

  factory NotesModel.initali() {
    return const NotesModel(
      subCategories: [],
      categoryName: "",
      selfEsteem: 50,
      stressLevel: 50,
      notesTitle: '',
      date: '',
    );
  }

  @override
  List<Object?> get props => [
        subCategories,
        date,
        categoryName,
        selfEsteem,
        stressLevel,
        notesTitle,
      ];
}
