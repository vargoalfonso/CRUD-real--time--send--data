import 'package:course_/simple_crud_controller.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class SimpleCrudApp extends StatefulWidget {
  const SimpleCrudApp({super.key});

  @override
  State<SimpleCrudApp> createState() => _SimpleCrudAppState();
}

class _SimpleCrudAppState extends State<SimpleCrudApp> {
  final SimpleCRUDcontroller = Get.put(simpleCRUDcontroller());
  addView() {
    final editInput = TextEditingController();
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(
            controller: editInput,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                SimpleCRUDcontroller.add(editInput.text);
                Navigator.pop(context);
                DInfo.toastSuccess("Succes Add");
              },
              child: const Text("Add"),
            ),
          ),
        ],
      ),
    );
  }

  updateView(String oldData, int index) {
    final editInput = TextEditingController();
    editInput.text = oldData;
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: editInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                SimpleCRUDcontroller.updateItem(index, editInput.text);
                Navigator.pop(context);
                DInfo.toastSuccess("Finish Updated");
              },
              child: const Text("Update"),
            ),
          ),
        ],
      ),
    );
  }

  deleteView(String oldData, int index) {
    DInfo.dialogConfirmation(
      context,
      "Delete",
      "Are you sure you want to delete $oldData?",
    ).then((yes) {
      //thensynchronous
      if(yes??false){
          SimpleCRUDcontroller.deleter(index);
      }
    });
  }
  @override
  void dispose() {
    SimpleCRUDcontroller.clearState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //List<String> list = ['Pokemon', 'Doraemon', 'ultramen'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple CRUD"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              addView();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:
      //pakaiGetxperlu di Init ke kelas bersangkutan.
      //Getx bisa diganti GetBuilder<SimpleCRUDController>
      //Init di hapus, get builder perlu di triger update() di controller bagian add
      GetX(
        init: simpleCRUDcontroller(),
        builder: (controller) {
          List<String> list = controller.list;
          if(list.isEmpty){
              return const Center(child: Text("No Data"));
          }
          
        return  ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String item = list[index];
          return ListTile(
            leading: IconButton(
              onPressed: () => updateView(item, index),
              icon: const Icon(Icons.edit),
              color: Colors.blue,
            ),
            title: Text(item),
            trailing: IconButton(
              onPressed: () => deleteView(item, index),
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          );
        },
      );
      },
      ),
    );
  }
}