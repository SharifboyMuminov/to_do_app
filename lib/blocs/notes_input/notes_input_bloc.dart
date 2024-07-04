import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_event.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_state.dart';

class NotesInputBloc extends Bloc<NotesInputEvent, NotesInputState> {
  NotesInputBloc() : super(NotesInputState.initali()) {
    on<NotesInputChangeCategoryEvent>(_setCategory);
    on<NotesInputSetSubCategoriesEvent>(_setSubCategories);
    on<NotesInputSetStressLevelEvent>(_setStressLevel);
    on<NotesInputSetNotesTextEvent>(_setNotesText);
    on<NotesInputSetSelfEsteemEvent>(_setSelfEsteem);
  }

  void _setNotesText(NotesInputSetNotesTextEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          notesTitle: event.text,
        ),
      ),
    );
  }

  void _setStressLevel(NotesInputSetStressLevelEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          stressLevel: event.stressLevel,
        ),
      ),
    );
  }

  void _setSelfEsteem(NotesInputSetSelfEsteemEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          selfEsteem: event.selfEsteem,
        ),
      ),
    );
  }

  void _setCategory(NotesInputChangeCategoryEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          categoryName: event.categoryName,
        ),
      ),
    );
  }

  void _setSubCategories(NotesInputSetSubCategoriesEvent event, emit) {
    List<String> subCategories = state.notesModel.subCategories;

    if (subCategories.contains(event.subCategoryName)) {
      subCategories.remove(event.subCategoryName);
    } else {
      subCategories.add(event.subCategoryName);
    }
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          subCategories: subCategories,
        ),
      ),
    );
  }
}
