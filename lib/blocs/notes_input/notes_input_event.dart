import 'package:equatable/equatable.dart';

abstract class NotesInputEvent extends Equatable {}

class NotesInputChangeCategoryEvent extends NotesInputEvent {
  final String categoryName;

  NotesInputChangeCategoryEvent({required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}

class NotesInputSetSubCategoriesEvent extends NotesInputEvent {
  final String subCategoryName;

  NotesInputSetSubCategoriesEvent({required this.subCategoryName});

  @override
  List<Object?> get props => [subCategoryName];
}

class NotesInputSetStressLevelEvent extends NotesInputEvent {
  final int stressLevel;

  NotesInputSetStressLevelEvent({required this.stressLevel});

  @override
  List<Object?> get props => [stressLevel];
}

class NotesInputSetSelfEsteemEvent extends NotesInputEvent {
  final int selfEsteem;

  NotesInputSetSelfEsteemEvent({required this.selfEsteem});

  @override
  List<Object?> get props => [selfEsteem];
}

class NotesInputSetNotesTextEvent extends NotesInputEvent {
  final String text;

  NotesInputSetNotesTextEvent({required this.text});

  @override
  List<Object?> get props => [text];
}
