import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';


class CounterAppStateSet extends StatefulWidget {
  const CounterAppStateSet({super.key});

  @override
  State <CounterAppStateSet> createState() => CounterAppStateSetState();
}

class CounterAppStateSetState extends State <CounterAppStateSet> {
  int counter= 1;
  
  @override
  void initState(){
    DMethod.printBasic("Initstate- counterstate");
    super.initState();
  }
  @override
  void dispose() {
     DMethod.printBasic("Initstate- counterstate");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     DMethod.printBasic("Bulid- counterstate");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App SetSate"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(onPressed: (){
              counter = counter -1;
              setState(() {
                
              });
            }, 
            icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            Text("$counter", style: Theme.of(context).textTheme.displaySmall
            ),
            const SizedBox(width: 20),
            IconButton.filled(onPressed: (){
              counter = counter +1;
              setState(() {
                
              });
            },
            
            icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}