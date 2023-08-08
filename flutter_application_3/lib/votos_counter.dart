import 'package:flutter/material.dart';

class VotosCounter extends StatefulWidget {
  const VotosCounter({super.key});

  @override
  State<VotosCounter> createState() => _VotosCounterState();
}

class _VotosCounterState extends State<VotosCounter> {
  int votosOne = 0;
  int votosTwo = 0;
  int votosThree = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text('$votosOne'),
        Text('$votosTwo'),
        Text('$votosThree'),
      ])),
      floatingActionButton: Container(
          width: 200,
          margin: const EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    votosOne++;
                  });
                },
                child: const Text('A'),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    votosTwo++;
                  });
                },
                child: const Text('B')
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    votosThree++;
                  });
                },
                child: const Text('C')
              ),
            ],
          )),
          bottomNavigationBar: Container(
            height: 50,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total de votos: ${votosOne + votosTwo + votosThree}', style: const TextStyle(color: Colors.white),),
                if (votosOne > votosTwo && votosOne > votosThree) Text('A', style: const TextStyle(color: Colors.white),),
                if (votosTwo > votosOne && votosTwo > votosThree) Text('B', style: const TextStyle(color: Colors.white),),
                if (votosThree > votosOne && votosThree > votosTwo) Text('C', style: const TextStyle(color: Colors.white),),
                if (votosOne == votosTwo && votosOne > votosThree) Text('A e B', style: const TextStyle(color: Colors.white),),
                if (votosOne == votosThree && votosOne > votosTwo) Text('A e C', style: const TextStyle(color: Colors.white),),
                if (votosTwo == votosThree && votosTwo > votosOne) Text('B e C', style: const TextStyle(color: Colors.white),),
                if (votosOne == votosTwo && votosOne == votosThree) Text('A, B e C', style: const TextStyle(color: Colors.white),),
              ],
            ),
          ),
    );
  }
}
