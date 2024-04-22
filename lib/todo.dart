import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class Todo {
  bool isCompleted;
  String description;

  Todo(this.isCompleted, this.description);
}

// 창고
class TodoVM extends Todo { // 투두화면에 필요한 모든 데이터를 상속해서 가지고 있으면 된다.
  TodoVM(super.isCompleted, super.description);

  String getCompleted() {
    return isCompleted ? "완료" : "미완료";
  }
}

// 창고 관리자: 창고 데이터를 관리함, 그런데 창고가 창고 데이터를 익스텐즈해서 관리자는 창고를 관리하면 됨.
final todoProvider = StateProvider<TodoVM>((ref) {
  return TodoVM(true, "공부하기");
});
