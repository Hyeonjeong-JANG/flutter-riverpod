import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_001/todo.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
    );
  }
}

class TodoPage extends ConsumerWidget {
  // 이렇게 해야 컨슈머가 되고 창고 관리자에게 접근할 수 있다.
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoVM vm = ref.read(todoProvider);
    // 1. ref가 있어야 창고 관리자에게 접근이 가능하다.
    // 2. read는 창고 데이터를 한 번만 수신한다.(상태변경을 관찰하지 않는다.)

    return Scaffold(
      body: Center(
        child: Text(
          "완료 : ${vm.getCompleted()}, 내용 : ${vm.description}",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.isCompleted = false;
          print("완료: ${vm.isCompleted}");
        },
        child: Text("값변경"),
      ),
    );
  }
}
