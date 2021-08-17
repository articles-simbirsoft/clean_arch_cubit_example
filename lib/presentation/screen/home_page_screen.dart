import 'package:clean_arch_example_cubit/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:clean_arch_example_cubit/presentation/bloc/home_page/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageCubit cubit =  HomePageCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${state.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: cubit.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}