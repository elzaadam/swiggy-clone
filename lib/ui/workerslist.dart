import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';

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
        buildWhen: (previous, current) =>
            current is Listgetting || current is WorkerslistSuccess,
        builder: (context, state) {
          if (state is Listgetting) {
            return const CircularProgressIndicator();
          } else if (state is WorkerslistSuccess) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.workerslistModel.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    //final item = state.workerslistModel.data![0];
                    return Container(
                        height: 50,
                        width: 80,
                        color: Colors.blue,
                        child: Text(state.workerslistModel.data![index].name
                            .toString()));
                    //child: Text("Item $index: $item"));
                  }),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
