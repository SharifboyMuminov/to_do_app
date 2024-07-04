import 'package:equatable/equatable.dart';

class NotesModel extends Equatable {
  final String notesTitle;
  final String categoryName;
  final String date;
  final DateTime dateTime;
  final List<String> subCategories;
  final int stressLevel;
  final int selfEsteem;

  const NotesModel({
    required this.dateTime,
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
    DateTime? dateTime,
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
      dateTime: dateTime ?? this.dateTime,
    );
  }

  factory NotesModel.initali() {
    return NotesModel(
      subCategories: [],
      categoryName: "",
      selfEsteem: 50,
      stressLevel: 50,
      notesTitle: '',
      date: '',
      dateTime: DateTime(2000),
    );
  }

  @override
  List<Object?> get props => [
        subCategories,
        dateTime,
        date,
        categoryName,
        selfEsteem,
        stressLevel,
        notesTitle,
      ];
}
