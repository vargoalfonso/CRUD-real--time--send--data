

import 'package:d_input/d_input.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';


class RealTimeInputApp extends StatefulWidget {
  const RealTimeInputApp({super.key});

  @override
  State<RealTimeInputApp> createState() => _RealTimeInputAppState();
}

class _RealTimeInputAppState extends State<RealTimeInputApp> {
  final realtimeInputController = Get.put(RealtimeInputController());
  @override
  void initState() {
    DMethod.printBasic("Initstate- counterstate");
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<RealtimeInputController>(force: true);
     DMethod.printBasic("Initstate- counterstate");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Realtime"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
DInput(controller: TextEditingController(),
  fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
  radius: BorderRadius.circular(30),
  onChanged: (value){
realtimeInputController.input = value!;
  }
 ),
 const SizedBox(height: 20),
Obx(
   () {
     return Text(realtimeInputController.input,
     style: Theme.of(context).textTheme.displaySmall,
     );
   }
 )
        ],
      ),
    );
  }
}

class RealtimeInputController extends GetxController{
  final _input="Input".obs;
  String get input => _input.value;
  set input(String n)=> _input.value = n;

}