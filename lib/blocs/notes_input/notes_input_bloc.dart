import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_event.dart';
import 'package:to_do_app/blocs/notes_input/notes_input_state.dart';

class NotesInputBloc extends Bloc<NotesInputEvent, NotesInputState> {
  NotesInputBloc() : super(NotesInputState.initali()) {}
}
