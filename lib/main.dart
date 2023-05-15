import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text('App - Lista de tarefas'),
          ),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter', 'assets/image1.jpg'),
            Task('Aprender mais sobre IA', ''),
            Task('Aprender xamarin com C#', ''),
            Task('Estudar para unicamp', ''),
            Task('Prepara material para aulas', ''),
            Task('Praparar um novo eBook sobre Git', ''),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nameTask;
  final String photo;

  const Task(this.nameTask, this.photo, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(color: Colors.blue, height: 140),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                        child: Image.network(
                          widget.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nameTask,
                          style: TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Icon(Icons.arrow_drop_up))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Nível: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
