import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../todo_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("TASK NOTES",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff242A32),
      ),
      body: Container(
        color: Color(0xff242A32),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: todoController.title,
                      cursorColor: Colors.orange,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "what is today's task",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white), // Border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey), // Focused border color
                        ),

                      ),

                      ),
                    ),
                   SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      todoController.addTodo();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xff242A32),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [Text("ALL NOTES",style: TextStyle(color: Colors.white),)],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(
                      () => ListView(
                    children: todoController.todoList
                        .map((e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        textColor: Colors.white,
                        tileColor: Colors.white,
                        onTap: () {},
                        title: Text(e.title!),
                        trailing: SizedBox(
                            width: 100,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        todoController.deleteTodo(e.id!);
                                      },
                                      child: Icon(Icons.delete,color: Colors.red,)),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      todoController.updatedTitle.text =
                                      e.title!;
                                      Get.defaultDialog(
                                        backgroundColor: Colors.black,
                                        title: "Edit Note",titleStyle: TextStyle(color: Colors.white),
                                        content: StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return Container(
                                              height: 100,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      cursorColor: Colors.orange,
                                                      style: TextStyle(color: Colors.white),
                                                      controller:
                                                      todoController
                                                          .updatedTitle,
                                                      decoration:
                                                       InputDecoration(
                                                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                         focusedBorder: OutlineInputBorder(
                                                           borderRadius: BorderRadius.circular(10),
                                                           borderSide: BorderSide(color: Colors.grey), // Focused border color
                                                         ),
                                                      ),

                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      todoController
                                                          .updateTodo(e);
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      width: 45,
                                                      child: const Icon(
                                                        Icons.done,
                                                        color:
                                                        Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.edit,color: Colors.white,),
                                  )
                                ])),
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}