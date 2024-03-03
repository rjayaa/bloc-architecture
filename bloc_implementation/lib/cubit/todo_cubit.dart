import 'package:bloc_implementation/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);

  void addToDo(String title) {
    if (title.isEmpty) {
      addError('Title is empty');
      return;
    }
    final todo = ToDo(name: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('TodoCubit: $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
