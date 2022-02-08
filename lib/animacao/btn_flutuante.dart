import 'package:flutter/material.dart';

class BotaoFlutuante extends StatefulWidget {
  const BotaoFlutuante({Key? key}) : super(key: key);

  @override
  _BotaoFlutuanteState createState() => _BotaoFlutuanteState();
}

class _BotaoFlutuanteState extends State<BotaoFlutuante> {
  bool isClick = false;
  final duration = const Duration(seconds: 6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio do Botão Flutuante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedAlign(
          duration: duration,
          alignment: isClick ? Alignment.topCenter : Alignment.bottomRight,
          child: GestureDetector(
            onTap: (() {
              setState(() {
                isClick = !isClick;
              });
            }),
            child: AnimatedContainer(
              duration: duration,
              width: isClick ? 250 : 100,
              height: isClick ? 100 : 100,
              decoration: BoxDecoration(
                borderRadius: isClick
                    ? BorderRadius.circular(2)
                    : BorderRadius.circular(90),
                color: Colors.blue,
              ),
              child: isClick ? text() : image(),
            ),
          ),
        ),
      ),
    );
  }

  image() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://pbs.twimg.com/profile_images/1350144832350597124/pZ5ykSgo_400x400.jpg'),
          ),
        ),
      ),
    );
  }

  text() {
    return const Center(
      child: Text(
        'Flutter',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }


}
