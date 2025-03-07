import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/home/data/model/todo.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/add_todo_modal_sheet.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_events.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == Status.error || state.todos == null) {
            return const Center(
              child: Text('No Todos available',
                  style: TextStyle(color: Colors.white)),
            );
          }

          return ListView.builder(
            itemCount: state.todos!.docs.length,
            itemBuilder: (context, index) {
              Todo todo = Todo.fromJson(state.todos!.docs[index]);
              DateTime convertedDateTime = todo.date.toDate();
              return ListTile(
                title: Text(todo.title,
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text(convertedDateTime.toString(),
                    style: const TextStyle(color: Colors.white)),
                trailing: IconButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(ToggleIsDone(todo.id, !todo.isDone));
                  },
                  icon: todo.isDone
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank),
                ),
                leading: Text(todo.priority.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 19)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF8687E6),
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const AddTodoModalSheet();
                });
          },
          child: const Icon(CupertinoIcons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(height: 60.0),
      ),
    );
  }
}
