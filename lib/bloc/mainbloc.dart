import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:myproject/models/commonmodel.dart';
import 'package:myproject/models/profilemodel.dart';
import 'package:myproject/models/workerslistmodel.dart';
import 'package:myproject/prefManager/prefmanager.dart';
import 'package:myproject/server/webclient.dart';

class MainBloc extends Bloc<LoginEvents, LoginStates> {
  MainBloc() : super(LoginInitial()) {
    on<VerifyPassword>(verifyPassword);
    on<RegistrationEvent>(registrationEvent);
    on<GetProfile>(getProfile);
    on<GetWorkerslist>(getWorkerslist);
  }
  Future<FutureOr<void>> getProfile(
      GetProfile event, Emitter<LoginStates> emit) async {
    ProfileModel profileModel;

    try {
      emit(Profilegetting());
      profileModel = ProfileModel.fromJson(await WebClient.get(
        '/profile',
      ));
      if (profileModel.status == true) {
        //  Helper.showToast(msg: "OTP Successfully sent");
        emit(ProfileSuccess(profileModel: profileModel));
        print("Success");
      } else {
        print("Failed");
        emit(ProfileError());
      }
    } catch (e) {
      emit(ProfileError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> getWorkerslist(
      GetWorkerslist event, Emitter<LoginStates> emit) async {
    WorkerslistModel workerslistModel;

    try {
      emit(Listgetting());
      workerslistModel = WorkerslistModel.fromJson(await WebClient.get(
        '/client/workers/list',
      ));
      if (workerslistModel.status == true) {
        //  Helper.showToast(msg: "OTP Successfully sent");
        emit(WorkerslistSuccess(workerslistModel: workerslistModel));
        print("Success");
      } else {
        print("Failed");
        emit(WorkerslistError());
      }
      //////
    } catch (e) {
      emit(WorkerslistError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> verifyPassword(
      VerifyPassword event, Emitter<LoginStates> emit) async {
    CommonModel commonModel;
    // emit(abd());
    Map map = {"phone": event.name, "password": event.password};
    print(map);
    try {
      emit(Loading());
      commonModel = CommonModel.fromJson(await WebClient.post(
        '/user/login',
        map,
      ));
      if (commonModel.status == true) {
        await PrefManager.setToken(commonModel.token);
        //  Helper.showToast(msg: "OTP Successfully sent");
        emit(LoginSuccess());
      } else {
        emit(LoginError());
      }
    } catch (e) {
      emit(LoginError());
      log("Exception on authentication : $e");
    }
    // if (event.name == "shilpa" &&
    //     event.password == "12345" &&
    //     event.isIndian == true) {
    //   emit(LoginSuccess());
    // } else {
    //   emit(LoginError(error: "invlid"));
    // }
    // if (loginModel.status == true) {
    //   emit(LoginSuccess());
    // } else if (loginModel.status == false) {
    //   emit(LoginError(error: "Invalid credentials"));
    // }

    // if (event.name == "abc" && event.password == "123") {
    //   emit(LoginSuccess());
    // } else {
    //   emit(LoginError(error: "Invalid credentials"));
    // }
  }

  Future<FutureOr<void>> registrationEvent(
      RegistrationEvent event, Emitter<LoginStates> emit) async {
    emit(Registering());
    // emit(abd());

    if (event.name == "shilpa" &&
        event.password == "12345" &&
        event.address == "abc" &&
        event.emailid == "123" &&
        event.district == "Kottayam") {
      emit(RegistrationSuccess());
    } else {
      emit(RegistrationError(error: "invalid"));
    }
    // if (loginModel.status == true) {
    //   emit(LoginSuccess());
    // } else if (loginModel.status == false) {
    //   emit(LoginError(error: "Invalid credentials"));
    // }

    // if (event.name == "abc" && event.password == "123") {
    //   emit(LoginSuccess());
    // } else {
    //   emit(LoginError(error: "Invalid credentials"));
    // }
  }
}

class LoginEvents {}

class VerifyPassword extends LoginEvents {
  final String? name, password;
  final bool? isIndian;

  VerifyPassword({this.name, this.password, this.isIndian});
}

class GetProfile extends LoginEvents {
  final String? name, password;
  final bool? isIndian;

  GetProfile({this.name, this.password, this.isIndian});
}

class GetWorkerslist extends LoginEvents {
  final String? name, password;
  final bool? isIndian;

  GetWorkerslist({this.name, this.password, this.isIndian});
}

class RegistrationEvent extends LoginEvents {
  final String? name, password, address, emailid, district;

  RegistrationEvent(
      {this.name, this.password, this.address, this.emailid, this.district});
}

class LoginStates {}

class LoginInitial extends LoginStates {}

class Loading extends LoginStates {}

class Profilegetting extends LoginStates {}

class Listgetting extends LoginStates {}

class Registering extends LoginStates {}

class abd extends LoginStates {}

class Fething extends LoginStates {}

class RegistrationSuccess extends LoginStates {}

class RegistrationError extends LoginStates {
  final String? error;

  RegistrationError({this.error});
}

class LoginSuccess extends LoginStates {}

class ProfileSuccess extends LoginStates {
  final ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

class ProfileError extends LoginStates {
  final String? error;

  ProfileError({this.error});
}

class WorkerslistSuccess extends LoginStates {
  final WorkerslistModel workerslistModel;

  WorkerslistSuccess({required this.workerslistModel});
}

class WorkerslistError extends LoginStates {
  final String? error;

  WorkerslistError({this.error});
}

class LoginError extends LoginStates {
  final String? error;

  LoginError({this.error});
}
