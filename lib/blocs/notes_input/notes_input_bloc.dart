import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_event.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_state.dart';
import 'package:to_do_app/data/models/from_status/from_status_eman.dart';

class NotesInputBloc extends Bloc<NotesInputEvent, NotesInputState> {
  NotesInputBloc() : super(NotesInputState.initali()) {
    on<NotesInputChangeCategoryEvent>(_setCategory);
    on<NotesInputSaveTextEvent>(_saveNotes);
    on<NotesInputSetSubCategoriesEvent>(_setSubCategories);
    on<NotesInputSetStressLevelEvent>(_setStressLevel);
    on<NotesInputSetNotesTextEvent>(_setNotesText);
    on<NotesInputSetSelfEsteemEvent>(_setSelfEsteem);
    on<NotesInputSetDateTextEvent>(_settDateText);
  }

  void _saveNotes(NotesInputSaveTextEvent event, emit) {
    //Save logistics...

    emit(NotesInputState.initali());
    emit(
      state.copyWith(
        fromStatus: FromStatus.success,
        statusMessage: "save",
      ),
    );
    _check(emit);
  }

  void _settDateText(NotesInputSetDateTextEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          date: event.date,
          dateTime: event.dateTime,
        ),
      ),
    );
    _check(emit);
  }

  void _setNotesText(NotesInputSetNotesTextEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          notesTitle: event.text,
        ),
      ),
    );
    _check(emit);
  }

  void _setStressLevel(NotesInputSetStressLevelEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          stressLevel: event.stressLevel,
        ),
      ),
    );
    _check(emit);
  }

  void _setSelfEsteem(NotesInputSetSelfEsteemEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          selfEsteem: event.selfEsteem,
        ),
      ),
    );
    _check(emit);
  }

  void _setCategory(NotesInputChangeCategoryEvent event, emit) {
    emit(
      state.copyWith(
        notesModel: state.notesModel.copyWith(
          categoryName: event.categoryName,
          subCategories: [],
        ),
      ),
    );
    _check(emit);
  }

  void _setSubCategories(NotesInputSetSubCategoriesEvent event, emit) {
    List<String> subCategories = [...state.notesModel.subCategories];

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
    _check(emit);
  }

  void _check(emit) {
    if (state.notesModel.subCategories.isEmpty ||
        state.notesModel.categoryName.isEmpty ||
        state.notesModel.date.isEmpty ||
        state.notesModel.notesTitle.isEmpty) {
      emit(state.copyWith(fromStatus: FromStatus.error));
    } else {
      emit(state.copyWith(fromStatus: FromStatus.success));
    }
  }
}
