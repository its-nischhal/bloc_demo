import 'package:bloc_demo/src/bloc/home/home_bloc.dart';
import 'package:bloc_demo/src/bloc/home/home_event.dart';
import 'package:bloc_demo/src/bloc/home/home_state.dart';
import 'package:bloc_demo/src/data/home_data.dart';
import 'package:bloc_demo/src/screens/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeScreenBloc>().add(FetchHomeScreenDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
        if (state is HomeScreenSuccessState) {
          return ListView.builder(
            itemCount: state.model.data.levels.length,
            itemBuilder: (context, index) {
              return ProductWidget(
                  product: state.model.data.levels[index].products[0]);
            },
          );
        } else if (state is HomeScreenFailureState) {
          return Center(
            child: Text('Something went wrong'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
