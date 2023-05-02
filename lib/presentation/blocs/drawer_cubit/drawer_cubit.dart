import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerCubitState> {
  DrawerCubit() : super(DrawerCubitInitial());
  final scafoldKey = GlobalKey<ScaffoldState>();
  openDrawer() {
    scafoldKey.currentState!.openDrawer();
    emit(DrawerState());
  }
}
