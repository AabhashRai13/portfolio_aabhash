part of 'scroll_cubit.dart';

@immutable
abstract class ScrollState {}

class ScrollInitial extends ScrollState {}

class ScrollControllerState extends ScrollState {
  final ScrollController? scrollController;
  ScrollControllerState({this.scrollController});
}
