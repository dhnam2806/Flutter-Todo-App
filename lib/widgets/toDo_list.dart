import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  var isCheck;
  final String taskName;
  final String? deadline;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoList({
    super.key,
    required this.isCheck,
    required this.taskName,
    required this.deadline,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red.shade600,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCheck,
                onChanged: onChanged,
                activeColor: Colors.black54,
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 16,
                      decoration: isCheck
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
              Text(
                deadline!,
                style: TextStyle(
                    fontSize: 16,
                    decoration: isCheck
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
