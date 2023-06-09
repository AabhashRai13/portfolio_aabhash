import 'package:aabhash_portfolio_website/presentation/configs/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scroll_state.dart';

class ScrollCubit extends Cubit<ScrollState> {
  ScrollCubit() : super(ScrollInitial());
  final ScrollController scrollController = ScrollController();
  scroll(int index) {
    double offset = index == 1
        ? 270
        : index == 2
            ? 255
            : index == 3
                ? 250
                : 245;
    scrollController.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    emit(ScrollControllerState());
  }

  scrollMobile(int index) {
    double offset = index == 1
        ? 290
        : index == 2
            ? 250
            : index == 3
                ? 220
                : 310;
    scrollController.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    emit(ScrollControllerState());
  }
}
