import 'package:course_/Counter_app_setState.dart';
import 'package:course_/counter_app.dart';
import 'package:course_/realtime_input_app.dart';
import 'package:course_/simple_crud_app.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ElevatedButton(onPressed: (){ 
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> const CounterApp(),
                ), 
            );
          }, 

          child: const Text("Counter App"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context)=> const CounterAppStateSet(),
              ),
            );
          },
          child: const Text("Counter App Set State"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> const RealTimeInputApp(),
              ),
            );
          }, child: const Text("Realtime Input App"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=>const SimpleCrudApp(),
              ),
            );
          }, child: const Text("Simple CRUD App"),
          ),
        ],
      ),
    );
  }
}