import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/bloc/mainbloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: BlocConsumer<MainBloc, LoginStates>(
        builder: (context, state) {
          if (state is Profilegetting) {
            return const CircularProgressIndicator();
          } else if (state is ProfileSuccess) {
            return Column(children: [
              Text(state.profileModel.data!.name!.toString()),
              Text(state.profileModel.data!.phone!.toString()),
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
