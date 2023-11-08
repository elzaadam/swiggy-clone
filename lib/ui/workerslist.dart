import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';
import 'package:myproject/models/workerslistmodel.dart';

class Workerslist extends StatefulWidget {
  const Workerslist({super.key});

  @override
  State<Workerslist> createState() => _WorkerslistState();
}

class _WorkerslistState extends State<Workerslist> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetWorkerslist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workerslist"),
      ),
      body: BlocConsumer<MainBloc, LoginStates>(
        builder: (context, state) {
          if (state is Listgetting) {
            return const CircularProgressIndicator();
          } else if (state is WorkerslistSuccess) {
            return const Column(children: [
              //Text(state.workerslistModel.data!.name!.toString()),
              Text("hello"),
            ]);
          } else {
            return const SizedBox.shrink();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
