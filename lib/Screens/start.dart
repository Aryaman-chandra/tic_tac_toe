
import "package:flutter/material.dart";
import "package:tic_tac_toe/Screens/play.dart";

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       width:MediaQuery.of(context).size.width,
       height:MediaQuery.of(context).size.height,
       decoration: const BoxDecoration(
                 gradient:LinearGradient(
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                   colors: [
                   Color.fromARGB(255, 27, 66, 198),
                   Color.fromARGB(255, 17, 14, 111)
                 ]) 
          ),
        child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
                        
                       FilledButton(
                        onPressed: () {
                        print('Button Pressed');
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const play()));
                        },
                        child: const Text('Start')
                        ),
                      ],
           ),
      ),
    );        
  }
}
