import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final List<String> _todoItems = <String>[];

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark ${_todoItems[index]} as'),
              actions: <Widget>[
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
        title: Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Data List')),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
            onPressed: _pushAddTodoScreen,
            tooltip: 'Add task',
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Add a Data')),
            body: TextField(
              autofocus: true,
              onSubmitted: (String val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  hintText: 'Please Enter Details',
                  contentPadding: EdgeInsets.all(16.0)),
            ));
      },
    ));
  }
}
