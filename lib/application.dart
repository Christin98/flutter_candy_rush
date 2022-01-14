import 'package:flutter/material.dart';
import 'package:flutter_candy_rush/bloc/bloc_provider.dart';
import 'package:flutter_candy_rush/bloc/game_bloc.dart';
import 'package:flutter_candy_rush/pages/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      bloc: GameBloc(),
      child: MaterialApp(
        title: 'Flutter Candy Crush',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ), );
  }

}