import 'package:equatable/equatable.dart';

class NotesModel extends Equatable {
  final String categoryName;
  final List<String> subCategories;
  final int stressLevel;
  final int selfEsteem;

  const NotesModel({
    required this.subCategories,
    required this.categoryName,
    required this.selfEsteem,
    required this.stressLevel,
  });

  NotesModel copyWith({
    String? categoryName,
    List<String>? subCategories,
    int? stressLevel,
    int? selfEsteem,
  }) {
    return NotesModel(
      subCategories: subCategories ?? this.subCategories,
      categoryName: categoryName ?? this.categoryName,
      selfEsteem: selfEsteem ?? this.selfEsteem,
      stressLevel: stressLevel ?? this.stressLevel,
    );
  }

  factory NotesModel.initali() {
    return const NotesModel(
      subCategories: [],
      categoryName: "",
      selfEsteem: 0,
      stressLevel: 0,
    );
  }

  @override
  List<Object?> get props => [
        subCategories,
        categoryName,
        selfEsteem,
        stressLevel,
      ];
}
