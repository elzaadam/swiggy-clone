import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';

class Sitelist extends StatefulWidget {
  const Sitelist({super.key});

  @override
  State<Sitelist> createState() => _SitelistState();
}

class _SitelistState extends State<Sitelist> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetSitelist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sitelist"),
      ),
      body: BlocConsumer<MainBloc, LoginStates>(
        buildWhen: (previous, current) =>
            current is SiteListgetting || current is SitelistSuccess,
        builder: (context, state) {
          if (state is SiteListgetting) {
            return const CircularProgressIndicator();
          } else if (state is SitelistSuccess) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.sitelistModel.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                        height: 200,
                        width: 250,
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Text(state.sitelistModel.data![index].sId
                                .toString()),
                            Text(state.sitelistModel.data![index]
                                .totalHoursWorkersSpend
                                .toString()),
                            Text(state.sitelistModel.data![index].totalWork
                                .toString()),
                          ],
                        ));
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
