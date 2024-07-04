import 'package:equatable/equatable.dart';
import 'package:to_do_app/data/models/from_status/from_status_eman.dart';
import 'package:to_do_app/data/models/notes/notes_model.dart';

class NotesInputState extends Equatable {
  final FromStatus fromStatus;
  final String errorText;
  final String statusMessage;
  final NotesModel notesModel;

  const NotesInputState({
    required this.notesModel,
    required this.fromStatus,
    required this.errorText,
    required this.statusMessage,
  });

  NotesInputState copyWith({
    FromStatus? fromStatus,
    String? errorText,
    String? statusMessage,
    NotesModel? notesModel,
  }) {
    return NotesInputState(
      notesModel: notesModel ?? this.notesModel,
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  factory NotesInputState.initali() {
    return NotesInputState(
      notesModel: NotesModel.initali(),
      fromStatus: FromStatus.pure,
      errorText: "",
      statusMessage: "",
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        notesModel,
        errorText,
        statusMessage,
      ];
}
